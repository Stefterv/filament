//
//  Camera.m
//  Camera
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import <Foundation/Foundation.h>
#import "Camera.h"
#import <filament/Camera.h>
#import <math/mat4.h>


#define FILAMENT_MAT4F_FROM_SIMD(m) (filament::math::mat4f \
        (m.columns[0][0], m.columns[0][1], m.columns[0][2], m.columns[0][3], \
         m.columns[1][0], m.columns[1][1], m.columns[1][2], m.columns[1][3], \
         m.columns[2][0], m.columns[2][1], m.columns[2][2], m.columns[2][3], \
         m.columns[3][0], m.columns[3][1], m.columns[3][2], m.columns[3][3]))

#define FILAMENT_MAT4_FROM_SIMD(m) (filament::math::mat4 \
        (m.columns[0][0], m.columns[0][1], m.columns[0][2], m.columns[0][3], \
         m.columns[1][0], m.columns[1][1], m.columns[1][2], m.columns[1][3], \
         m.columns[2][0], m.columns[2][1], m.columns[2][2], m.columns[2][3], \
         m.columns[3][0], m.columns[3][1], m.columns[3][2], m.columns[3][3]))

#define SIMD_FLOAT4X4_FROM_FILAMENT(m) (simd_matrix( \
        simd_make_float4(m[0][0], m[0][1], m[0][2], m[0][3]), \
        simd_make_float4(m[1][0], m[1][1], m[1][2], m[1][3]), \
        simd_make_float4(m[2][0], m[2][1], m[2][2], m[2][3]), \
        simd_make_float4(m[3][0], m[3][1], m[3][2], m[3][3])))


@implementation Camera{
    filament::Camera* ref;
}

- (void) setCustomProjection:(simd_float4x4) projection{
    self->ref->setCustomProjection(FILAMENT_MAT4_FROM_SIMD(projection),0, 10);
}
- (void) setModelMatrix: (simd_float4x4) transform{
    self->ref->setModelMatrix(FILAMENT_MAT4F_FROM_SIMD(transform));
}

- (void) setLensProjection:(double)focalLengthInMillimeters :(double)aspect :(double)near :(double)far{
    self->ref->setLensProjection(focalLengthInMillimeters, aspect, near, far);
}

- (void) lookAt:(simd_float3)eye :(simd_float3)center{
    self->ref->lookAt(filament::math::float3(eye[0], eye[1], eye[2]), filament::math::float3(center[0], center[1], center[2]));
}

- (void) setExposure: (float) exposure{
    self->ref->setExposure(exposure);
}

- (void) setExposure:(float) aperture :(float) shutterSpeed :(float)sensitivity{
    self->ref->setExposure(aperture, shutterSpeed, sensitivity);
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Camera*)ref;
    return self;
}

@end
