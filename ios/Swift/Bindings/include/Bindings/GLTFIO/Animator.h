//
//  Animator.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>

#ifndef Animator_h
#define Animator_h

NS_SWIFT_NAME(glTFIO.Animator)
@interface Animator : NSObject

@property (nonatomic, readonly, nonnull) void* animator  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull void*) animator NS_SWIFT_UNAVAILABLE("Create a new renderer with engine.createRenderer");
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* Animator_h */
