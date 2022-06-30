//
//  AssetLoader.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/AssetLoader.h"
#import <gltfio/AssetLoader.h>

@implementation AssetLoader{
    gltfio::AssetLoader* nativeLoader;
}

- (id) init:(void *)loader{
    self->_loader = loader;
    self->nativeLoader = (gltfio::AssetLoader*)loader;
    return self;
}

@end
