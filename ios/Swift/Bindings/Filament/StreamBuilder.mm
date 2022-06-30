//
//  StreamBuilder.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/StreamBuilder.h"
#import <filament/StreamBuilder.h>

@implementation StreamBuilder{
    filament::StreamBuilder* nativeBuilder;
}

- (id) init:(void *)builder{
    self->_ builder = builder;
    self->nativeBuilder = (filament::StreamBuilder*)builder;
    return self;
}

@end
