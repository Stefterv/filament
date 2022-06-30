//
//  IndirectLight.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/IndirectLight.h"
#import <filament/IndirectLight.h>

@implementation IndirectLight{
    filament::IndirectLight* nativeLight;
}

- (id) init:(void *)light{
    self->_ light = light;
    self->nativeLight = (filament::IndirectLight*)light;
    return self;
}

@end
