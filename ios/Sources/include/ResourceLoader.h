//
//  ResourceLoader.h
//  ResourceLoader
//
//  Created by Stef Tervelde on 24/08/2021.
//

#import "FSObject.h"
#import "Engine.h"
#import "FilamentAsset.h"

#ifndef ResourceLoader_h
#define ResourceLoader_h

NS_SWIFT_NAME(glTFIO.ResourceLoaderConfiguration)
typedef struct
{
    bool recomputeBoundingBoxes;
    bool normalizeSkinningWeights;
} ResourceLoaderConfiguration;

NS_SWIFT_NAME(glTFIO.ResourceLoader)
@interface ResourceLoader : FSObject
- (void) loadResources: (FilamentAsset*) asset;
- (id) initWithEngine: (Engine*) engine :(ResourceLoaderConfiguration) config;
@end

#endif /* ResourceLoader_h */
