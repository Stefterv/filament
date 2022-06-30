//
//  MaterialProvider.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>

#ifndef MaterialProvider_h
#define MaterialProvider_h

@interface MaterialProvider : NSObject

@property (nonatomic, readonly, nonnull) void* provider  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) provider NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* MaterialProvider_h */
