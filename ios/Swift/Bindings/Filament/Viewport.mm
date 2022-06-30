//
//  Viewport.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/Viewport.h"
#import <filament/Viewport.h>

@implementation Viewport{
    filament::Viewport* nativeViewPort;
}

- (id) init:(void *)viewPort{
    self->_viewPort = viewPort;
    self->nativeViewPort = (filament::Viewport*)viewPort;
    return self;
}

@end
