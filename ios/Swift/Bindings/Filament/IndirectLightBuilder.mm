//
//  IndirectLightBuilder.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/IndirectLightBuilder.h"
#import <filament/IndirectLightBuilder.h>

@implementation IndirectLightBuilder{
    filament::IndirectLightBuilder* nativeBuilder;
}

- (id) init:(void *)builder{
    self->_ builder = builder;
    self->nativeBuilder = (filament::IndirectLightBuilder*)builder;
    return self;
}

@end
