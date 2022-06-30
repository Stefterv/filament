//
//  MaterialBuilder.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/MaterialBuilder.h"
#import <filament/Material.h>

@implementation MaterialBuilder{
    filament::Material::Builder* nativeBuilder;
}

- (id) init:(void *)builder{
    self->_builder = builder;
    self->nativeBuilder = (filament::Material::Builder*)builder;
    return self;
}

@end
