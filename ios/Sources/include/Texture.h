//
//  Texture.h
//  Texture
//
//  Created by Stef Tervelde on 25/08/2021.
//
#import "FSObject.h"
#import "Engine.h"

#ifndef Texture_h
#define Texture_h

NS_SWIFT_NAME(Filament.Texture)
@interface Texture : FSObject
- (void) setExternalImage: (Engine*) engine :(CVPixelBufferRef) image;
@end

typedef NS_ENUM(NSInteger, TextureFormat) {
    RGB8
} NS_SWIFT_NAME(Texture.InternalFormat);

typedef NS_ENUM(NSInteger, SamplerType) {
    External
} NS_SWIFT_NAME(Texture.Sampler);

NS_SWIFT_NAME(Texture.Builder)
@interface TextureBuilder : FSObject
    - (TextureBuilder*) levels: (uint8_t) levels;
    - (TextureBuilder*) format: (TextureFormat) format;
    - (TextureBuilder*) sampler: (SamplerType) type;
    - (Texture*_Nonnull) build: (Engine*) engine;
@end

#endif /* Texture_h */
