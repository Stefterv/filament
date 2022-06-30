//
//  RenderableBuilder.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/RenderableBuilder.h"
#import <filament/RenderableManager.h>

@implementation RenderableBuilder{
    filament::RenderableManager::Builder* nativeBuilder;
}

- (id) init:(int)count{
    auto builder = new filament::RenderableManager::Builder(count);
    self->_builder = builder;
    self->nativeBuilder = builder;
    return self;
}

@end
