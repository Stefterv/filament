//
//  ResourceLoader.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/ResourceLoader.h"
#import <gltfio/ResourceLoader.h>

@implementation ResourceLoader{
    gltfio::ResourceLoader* nativeLoader;
}

- (id) init:(void *)loader{
    self->_loader = loader;
    self->nativeLoader = (gltfio::ResourceLoader*)loader;
    return self;
}

@end
