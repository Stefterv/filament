//
//  MaterialProvider.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/MaterialProvider.h"
#import <gltfio/MaterialProvider.h>

@implementation MaterialProvider{
    gltfio::MaterialProvider* nativeProvider;
}

- (id) init:(void *)provider{
    self->_provider = provider;
    self->nativeProvider = (gltfio::MaterialProvider*)provider;
    return self;
}

@end
