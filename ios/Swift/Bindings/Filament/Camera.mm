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

#define FILAMENT_MAT4_FROM_SIMD(m) (filament::math::mat4 \
        (m.columns[0][0], m.columns[0][1], m.columns[0][2], m.columns[0][3], \
         m.columns[1][0], m.columns[1][1], m.columns[1][2], m.columns[1][3], \
         m.columns[2][0], m.columns[2][1], m.columns[2][2], m.columns[2][3], \
         m.columns[3][0], m.columns[3][1], m.columns[3][2], m.columns[3][3]))

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
