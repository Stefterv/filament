//
//  ResourceLoader.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>
#import "../Filament/Engine.h"

#ifndef ResourceLoader_h
#define ResourceLoader_h

NS_SWIFT_NAME(ResourceLoader.Options)
@interface ResourceLoaderOptions : NSObject
@property bool normalizeSkinningWeights;
@property bool recomputeBoundingBoxes;
@property bool ignoreBindTransform;
- (nonnull id) init;
@end

NS_SWIFT_NAME(glTFIO.ResourceLoader)
@interface ResourceLoader : NSObject

@property (nonatomic, readonly, nonnull) void* loader  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull Engine*) engine :(nonnull ResourceLoaderOptions*) options;
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* ResourceLoader_h */
