//
//  Camera.mm
//  
//
//  Created by Stef Tervelde on 29.06.22.
//

#import "Bindings/Filament/Camera.h"
#import <filament/Camera.h>
#import <math/mat2.h>
#import "../Math.h"

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

- (void)setCustomProjection:(simd_double4x4)inProjection :(double)near :(double)far{
    nativeCamera->setCustomProjection(FILAMENT_MAT4_FROM_SIMD(inProjection), near, far);
}

- (void)setCustomProjection:(simd_double4x4)inProjection :(simd_double4x4)inProjectionForCulling :(double)near :(double)far{
    nativeCamera->setCustomProjection(FILAMENT_MAT4_FROM_SIMD(inProjection), FILAMENT_MAT4_FROM_SIMD(inProjectionForCulling), near, far);
}

- (void)setScaling:(double)xscaling :(double)yscaling{
    nativeCamera->setScaling(filament::math::double2(xscaling, yscaling));
}

- (void)setShift:(double)xshift :(double)yshift{
    nativeCamera->setShift(filament::math::double2(xshift, yshift));
}

- (void)setModelMatrix:(simd_double4x4)viewMatrix{
    nativeCamera->setModelMatrix(FILAMENT_MAT4_FROM_SIMD(viewMatrix));
}

@end
