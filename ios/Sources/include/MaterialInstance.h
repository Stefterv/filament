//
//  MaterialInstance.h
//  MaterialInstance
//
//  Created by Stef Tervelde on 25/08/2021.
//
#import <UIKit/UIKit.h>
#import "FSObject.h"
#import "Texture.h"
#import "TextureSampler.h"
#import "Colors.h"

#ifndef MaterialInstance_h
#define MaterialInstance_h

@interface MaterialInstance : FSObject
- (instancetype) setParameterTexture: (const char*) name :(Texture*) texture :(TextureSampler*) sampler;
- (instancetype) setParameterColorRGB: (const char*) name :(RgbType) colorSpace :(float) r :(float) g :(float) b;
- (instancetype) setParameterColor4: (const char*) name :(RgbType) colorSpace :(simd_float4) color;
- (instancetype) setParameterColor3: (const char*) name :(RgbType) colorSpace :(simd_float3) color;
- (instancetype) setParameterFloat3x3: (const char*) name :(simd_float3x3) matrix;
- (instancetype) setParameterCGAffineTransform: (const char*) name :(CGAffineTransform) transform;
@end

#endif /* MaterialInstance_h */
