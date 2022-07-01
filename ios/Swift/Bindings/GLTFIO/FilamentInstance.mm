//
//  FilamentInstance.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/FilamentInstance.h"
#import <gltfio/FilamentInstance.h>

@implementation FilamentInstance{
    filament::gltfio::FilamentInstance* nativeInstance;
}

- (id) init:(void *)instance{
    self->_instance = instance;
    self->nativeInstance = (filament::gltfio::FilamentInstance*)instance;
    return self;
}

@end
