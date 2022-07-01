//
//  FilamentAsset.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/FilamentAsset.h"
#import <gltfio/FilamentAsset.h>

@implementation FilamentAsset{
    filament::gltfio::FilamentAsset* nativeAsset;
}

- (id) init:(void *)asset{
    self->_asset = asset;
    self->nativeAsset = (filament::gltfio::FilamentAsset*)asset;
    return self;
}

@end
