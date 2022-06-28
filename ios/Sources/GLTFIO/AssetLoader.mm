//
//  AssetLoader.m
//  AssetLoader
//
//  Created by Stef Tervelde on 24/08/2021.
//

#import "AssetLoader.h"
#import <gltfio/AssetLoader.h>
#import <vector>
 

@implementation AssetConfiguration

@end


@implementation AssetLoader{
    gltfio::AssetLoader* ref;
}
// https://stackoverflow.com/questions/10201953/convert-stdvector-to-nsarray


- (FilamentAsset*) createAssetFromBinary: (const uint8_t*) bytes :(NSInteger) count{
    printf("Loading GLTF: %lu, %lu", sizeof(bytes),count);
    
    auto asset = self->ref->createAssetFromBinary(bytes,count);
    return [[FilamentAsset alloc] initWithRef:asset];
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (gltfio::AssetLoader*)ref;
    return self;
}

+ (instancetype) create: (AssetConfiguration*) config{
    auto engine = (filament::Engine *)config.engine.ref;
    auto materialProvider = (gltfio::MaterialProvider *)config.materialProvider.ref;
    
    auto loader = gltfio::AssetLoader::create({engine, materialProvider, nullptr});
    
    return [[AssetLoader alloc] initWithRef:loader];
}

@end
