//
//  IndirectLight.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>

#ifndef IndirectLight_h
#define IndirectLight_h

@interface IndirectLight : NSObject

@property (nonatomic, readonly, nonnull) void* light  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) light NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* IndirectLight_h */
