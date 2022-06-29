//
//  SimdToMatf.h
//  Dummy
//
//  Created by Stef Tervelde on 02/11/2021.
//
#import <simd/simd.h>

#ifndef SimdToMatf_h
#define SimdToMatf_h

@interface Mat4fHelper: NSObject

+ (void) fromSimd: (simd_float4x4) matrix;


@end
#endif /* SimdToMatf_h */
