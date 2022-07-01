//
//  ResourceLoader.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/ResourceLoader.h"
#import <gltfio/ResourceLoader.h>
@implementation ResourceLoaderOptions{
    
}

@end

@implementation ResourceLoader{
    filament::gltfio::ResourceLoader* nativeLoader;
}

- (id)init:(Engine *)engine :(ResourceLoaderOptions *)options{
    auto config = filament::gltfio::ResourceConfiguration();
    config.engine = (filament::Engine*) engine.engine;
    config.ignoreBindTransform = options.ignoreBindTransform;
    config.normalizeSkinningWeights = options.normalizeSkinningWeights;
    config.recomputeBoundingBoxes = options.recomputeBoundingBoxes;
    auto loader = new filament::gltfio::ResourceLoader(config);
    self->_loader = loader;
    self->nativeLoader = loader;
    return self;
}

@end
