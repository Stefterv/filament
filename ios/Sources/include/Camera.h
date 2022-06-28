//
//  Camera.h
//  Camera
//
//  Created by Stef Tervelde on 23/08/2021.
//
#import "FSObject.h"
#import <simd/simd.h>

#ifndef Camera_h
#define Camera_h

NS_SWIFT_NAME(Filament.Camera)
@interface Camera : FSObject

- (void) setCustomProjection:(simd_float4x4) projection;
- (void) setModelMatrix: (simd_float4x4) transform;
- (void) setLensProjection: (double) focalLengthInMillimeters :(double) aspect :(double) near :(double) far;
- (void) lookAt: (simd_float3) eye :(simd_float3) center;
- (void) setExposure: (float) exposure;
- (void) setExposure: (float) aperture :(float) shutterSpeed :(float)sensitivity;
@end


#endif /* Camera_h */
