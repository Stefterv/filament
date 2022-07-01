//
//  MaterialProvider.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/MaterialProvider.h"
#import <filament/Engine.h>
#import <gltfio/MaterialProvider.h>
#import <gltfio/materials/uberarchive.h>



@implementation MaterialProvider{
    filament::gltfio::MaterialProvider* nativeProvider;
}

- (id)init:(Engine *)engine{
    auto provider = filament::gltfio::createUbershaderProvider((filament::Engine*) engine.engine, UBERARCHIVE_DEFAULT_DATA, UBERARCHIVE_DEFAULT_SIZE);
    self->nativeProvider = provider;
    self->_provider = provider;
    return self;
}

@end
