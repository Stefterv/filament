//
//  AssetLoader.h
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import <Foundation/Foundation.h>
#import "../Filament/Engine.h"
#import "MaterialProvider.h"

#ifndef AssetLoader_h
#define AssetLoader_h

/**
 * Consumes a blob of glTF 2.0 content (either JSON or GLB) and produces a {@link FilamentAsset}
 * object, which is a bundle of Filament entities, material instances, textures, vertex buffers,
 * and index buffers.
 *
 * <p>AssetLoader does not fetch external buffer data or create textures on its own. Clients can use
 * the provided {@link ResourceLoader} class for this, which obtains the URI list from the asset.</p>
 *
 * @see Animator
 * @see FilamentAsset
 * @see ResourceLoader
 */

NS_SWIFT_NAME(glTFIO.AssetLoader)
@interface AssetLoader : NSObject

@property (nonatomic, readonly, nonnull) void* loader  NS_SWIFT_UNAVAILABLE("Don't access the raw pointers");
- (nonnull id) init: (nonnull Engine*) engine :(nonnull MaterialProvider*) provider;
- (nonnull id) init NS_UNAVAILABLE;

@end


#endif /* AssetLoader_h */
