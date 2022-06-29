//
//  Renderer.m
//  
//
//  Created by Stef Tervelde on 29.06.22.
//

#import "Bindings/Filament/Renderer.h"
#import <filament/Renderer.h>

@implementation Renderer{
    filament::Renderer* nativeRenderer;
}

- (id) init:(void *)renderer{
    self->_renderer = renderer;
    self->nativeRenderer = (filament::Renderer*)renderer;
    return self;
}

@end
