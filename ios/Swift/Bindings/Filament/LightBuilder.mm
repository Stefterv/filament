//
//  LightBuilder.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/LightBuilder.h"
#import "Bindings/Filament/LightManager.h"
#import <filament/LightManager.h>

@implementation LightBuilder{
    filament::LightManager::Builder* nativeBuilder;
}

- (id) init: (Type) type{
    auto builder = new filament::LightManager::Builder( (filament::LightManager::Type) type);
    self->_builder = builder;
    self->nativeBuilder = builder;
}

@end
