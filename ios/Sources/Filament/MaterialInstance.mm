//
//  MaterialInstance.m
//  MaterialInstance
//
//  Created by Stef Tervelde on 25/08/2021.
//

#import "MaterialInstance.h"
#import <filament/MaterialInstance.h>
#import <filament/Texture.h>
#import <filament/TextureSampler.h>
#import <math/mat3.h>

@implementation MaterialInstance{
    filament::MaterialInstance* ref;
}


- (instancetype) setParameterTexture: (const char*) name :(Texture*) texture :(TextureSampler*) sampler{
    self->ref->setParameter(name,(filament::Texture*)texture.ref, *(filament::TextureSampler*)sampler.ref);

    return self;
}
- (instancetype) setParameterColorRGB: (const char*) name :(RgbType) colorSpace :(float) r :(float) g :(float) b{
    // TODO: Link rgbtype
    self->ref->setParameter(name, (filament::RgbType::sRGB), filament::math::float3(r,g,b));
    return self;
}

- (instancetype) setParameterCGAffineTransform:(const char *)name :(CGAffineTransform)transform{
    auto mat = filament::math::mat3f(transform.a, transform.b, 0,
                                     transform.c, transform.d, 0,
                                     transform.tx, transform.ty, 1);
    self->ref->setParameter(name, mat);
    return self;
}
- (instancetype) setParameterColor4: (const char*) name :(RgbType) colorSpace :(simd_float4) color{

    self->ref->setParameter(name, filament::RgbaType::sRGB, filament::math::float4(color[0], color[1], color[2], color[3]));
    return self;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::MaterialInstance*)ref;
    return self;
}

@end
