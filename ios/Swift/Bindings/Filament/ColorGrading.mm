//
//  ColorGrading.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/Filament/ColorGrading.h"
#import <filament/ColorGrading.h>

@implementation ColorGrading{
    filament::ColorGrading* nativeGrading;
}

- (id) init:(void *)grading{
    self->_ grading = grading;
    self->nativeGrading = (filament::ColorGrading*)grading;
    return self;
}

@end
