//
//  SkyboxBuilder.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/SkyboxBuilder.h"
#import <filament/SkyboxBuilder.h>

@implementation SkyboxBuilder{
    filament::SkyboxBuilder* nativeBuilder;
}

- (id) init:(void *)builder{
    self->_ builder = builder;
    self->nativeBuilder = (filament::SkyboxBuilder*)builder;
    return self;
}

@end
