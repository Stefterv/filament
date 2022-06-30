//
//  MaterialBuilder.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>
#import "Engine.h"

#ifndef MaterialBuilder_h
#define MaterialBuilder_h

@interface MaterialBuilder : NSObject

@property (nonatomic, readonly, nonnull) void* builder  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init;

- (nonnull instancetype) payload: (nonnull NSArray*) buffer;
- (nonnull instancetype) build: (nonnull Engine*) engine;

@end


#endif /* MaterialBuilder_h */
