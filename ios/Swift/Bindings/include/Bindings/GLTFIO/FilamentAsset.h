//
//  FilamentAsset.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>

#ifndef FilamentAsset_h
#define FilamentAsset_h

NS_SWIFT_NAME(glTFIO.FilamentAsset)
@interface FilamentAsset : NSObject

@property (nonatomic, readonly, nonnull) void* asset  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) asset NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* FilamentAsset_h */
