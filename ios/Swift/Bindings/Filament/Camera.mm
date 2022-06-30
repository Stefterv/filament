//
//  Camera.mm
//  
//
//  Created by Stef Tervelde on 29.06.22.
//

#import "Bindings/Filament/Camera.h"
#import <filament/Camera.h>
#import <math/mat4.h>
#import <math/mat2.h>

#define FILAMENT_MAT4_FROM_DOUBLEARRAY(inProjection) (filament::math::mat4 \
        (inProjection[0], inProjection[1], inProjection[2], inProjection[3], \
        inProjection[5], inProjection[6], inProjection[7], inProjection[8], \
        inProjection[9], inProjection[10], inProjection[11], inProjection[12], \
        inProjection[13], inProjection[14], inProjection[15], inProjection[16]))

@implementation Camera{
    filament::Camera* nativeCamera;
}

- (id) init:(void *)camera{
    self->_camera = camera;
    self->nativeCamera = (filament::Camera*) camera;
    return self;
}

- (void)setProjection:(Projection)projection :(double)left :(double)right :(double)bottom :(double)top :(double)near :(double)far{
    nativeCamera->setProjection((filament::Camera::Projection) projection, left, right, bottom, top, near, far);
}

- (void)setProjection:(double)fovInDegrees :(double)aspect :(double)near :(double)far :(Fov)direction{
    nativeCamera->setProjection(fovInDegrees, aspect, near, far, (filament::Camera::Fov) direction);
}

- (void)setLensProjection:(double)focalLength :(double)aspect :(double)near :(double)far{
    nativeCamera->setLensProjection(focalLength, aspect, near, far);
}

- (void)setCustomProjection:(double * _Nonnull)inProjection :(double)near :(double)far{
    
    nativeCamera->setCustomProjection(FILAMENT_MAT4_FROM_DOUBLEARRAY(inProjection), near, far);
}

- (void)setCustomProjection:(double * _Nonnull)inProjection :(double * _Nonnull)inProjectionForCulling :(double)near :(double)far{
    nativeCamera->setCustomProjection(FILAMENT_MAT4_FROM_DOUBLEARRAY(inProjection), FILAMENT_MAT4_FROM_DOUBLEARRAY(inProjectionForCulling), near, far);
}

- (void)setScaling:(double)xscaling :(double)yscaling{
    nativeCamera->setScaling(filament::math::double2(xscaling, yscaling));
}

- (void)setShift:(double)xshift :(double)yshift{
    nativeCamera->setShift(filament::math::double2(xshift, yshift));
}

- (void)setModelMatrix:(double * _Nonnull)viewMatrix{
    nativeCamera->setModelMatrix(FILAMENT_MAT4_FROM_DOUBLEARRAY(viewMatrix));
}

@end
