//
//  AssetLoader.h
//  AssetLoader
//
//  Created by Stef Tervelde on 24/08/2021.
//
#import <Foundation/Foundation.h>
#import "Engine.h"
#import "MaterialProvider.h"
#import "FilamentAsset.h"

#ifndef AssetLoader_h
#define AssetLoader_h

NS_SWIFT_NAME(glTFIO.AssetConfiguration)
@interface AssetConfiguration : NSObject
@property Engine* engine;
@property MaterialProvider* materialProvider;
@end


NS_SWIFT_NAME(glTFIO.AssetLoader)
@interface AssetLoader : FSObject

- (FilamentAsset*) createAssetFromBinary: (const uint8_t*) bytes :(NSInteger) count;

+ (instancetype) create: (AssetConfiguration*) config;
@end

#endif /* AssetLoader_h */
