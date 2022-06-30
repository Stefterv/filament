//
//  MaterialInstance.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>

#ifndef MaterialInstance_h
#define MaterialInstance_h

@interface MaterialInstance : NSObject

@property (nonatomic, readonly, nonnull) void* instance  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) instance NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* MaterialInstance_h */
