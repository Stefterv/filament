//
//  Texture.m
//  Texture
//
//  Created by Stef Tervelde on 25/08/2021.
//
#import "Texture.h"

#import <filament/Texture.h>
#import <filament/Engine.h>

@implementation Texture{
    filament::Texture* ref;
}

- (void) setExternalImage: (Engine*) engine :(CVPixelBufferRef) image{
    self->ref->setExternalImage(*(filament::Engine*)engine.ref, image);
}
- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Texture*)ref;
    return self;
}

@end

@implementation TextureBuilder{
    filament::Texture::Builder* ref;
}
- (TextureBuilder*) levels: (uint8_t) levels{
    self->ref->levels(levels);
    return self;
}
- (TextureBuilder*) format: (TextureFormat) format{
    // TODO: Link
    self->ref->format(filament::Texture::InternalFormat::SRGB8);
    return self;
}
- (TextureBuilder*) sampler: (SamplerType) type{
    // TODO: Link
    self->ref->sampler(filament::Texture::Sampler::SAMPLER_EXTERNAL);
    return self;
}
- (Texture*) build: (Engine*) engine{
    return [[Texture alloc] initWithRef:self->ref->build(*(filament::Engine*)engine.ref)];
}
- (id) init{
    self = [super init];
    self = [self initWithRef:new filament::Texture::Builder()];
    return self;
}
- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Texture::Builder*)ref;
    return self;
}

@end
