//
//  AssetLoader.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/AssetLoader.h"
#import <gltfio/AssetLoader.h>
#import <gltfio/resources/gltfresources.h>

@implementation AssetConfiguration



@end

@implementation AssetLoader{
    filament::gltfio::AssetLoader* nativeLoader;
}

- (id) init:(void *)loader{
    self->_loader = loader;
    self->nativeLoader = (filament::gltfio::AssetLoader*)loader;
    return self;
}
+ (instancetype)create:(AssetConfiguration *)config1{
    auto config2 = filament::gltfio::AssetConfiguration();
    config2.engine = (filament::Engine*) config1.engine.engine;
    config2.entities = (utils::EntityManager*) config1.entities.manager;
    config2.materials = (filament::gltfio::MaterialProvider*) config1.materials.provider;;
    config2.names = (utils::NameComponentManager*) config1.names.manager;
    auto loader = filament::gltfio::AssetLoader::create(config2);
    return [[AssetLoader alloc] init:loader];
}

@end
