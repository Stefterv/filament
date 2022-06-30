//
//  LightManager.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/LightManager.h"
#import <filament/LightManager.h>

@implementation LightManager{
    filament::LightManager* nativeManager;
}

- (id) init:(void *)manager{
    self->_manager = manager;
    self->nativeManager = (filament::LightManager*)manager;
    return self;
}

@end
