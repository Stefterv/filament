//
//  MaterialProvider.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>
#import "../Filament/Engine.h"

#ifndef MaterialProvider_h
#define MaterialProvider_h

NS_SWIFT_NAME(glTFIO.MaterialProvider)
@interface MaterialProvider : NSObject

@property (nonatomic, readonly, nonnull) void* provider  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull Engine*) engine;
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* MaterialProvider_h */
