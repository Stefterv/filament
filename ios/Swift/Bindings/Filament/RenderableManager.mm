//
//  RenderableManager.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/RenderableManager.h"
#import <filament/RenderableManager.h>

@implementation RenderableManager{
    filament::RenderableManager* nativeManager;
}

- (id) init:(void *)manager{
    self->_manager = manager;
    self->nativeManager = (filament::RenderableManager*)manager;
    return self;
}

@end
