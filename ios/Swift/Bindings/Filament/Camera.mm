//
//  Camera.mm
//  
//
//  Created by Stef Tervelde on 29.06.22.
//

#import "Bindings/Filament/Camera.h"
#import <filament/Camera.h>

@implementation Camera{
    filament::Camera* nativeCamera;
}

- (id) init:(void *)camera{
    self->_camera = camera;
    self->nativeCamera = (filament::Camera*) camera;
    return self;
}

@end
