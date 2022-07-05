//
//  FilamentAsset.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/FilamentAsset.h"
#import <gltfio/FilamentAsset.h>

@implementation FilamentAsset{
    filament::gltfio::FilamentAsset* nativeAsset;
}

- (id) init:(void *)asset{
    self->_asset = asset;
    self->nativeAsset = (filament::gltfio::FilamentAsset*)asset;
    return self;
}

- (Entity)getRoot{
    
}
- (Entity)popRenderable{
    
}
- (Entity)popRenderables:(NSMutableArray *)entities{
    
}
+ (NSArray<NSNumber*>*)getEntitiesArray: (const void*) array :(unsigned long)count{
    auto typedArray = (utils::Entity*) array;
    auto target = [[NSMutableArray alloc] initWithCapacity:count];
    for(auto i = 0; i<count; i++){
        auto ent = typedArray[i];
        auto num = utils::Entity::smuggle(ent);
        target[i] = [[NSNumber alloc] initWithUnsignedInt: num];
    }
    return target;
}
- (NSArray<NSNumber *> *)getEntities{
    auto ents = nativeAsset->getEntities();
    auto count = nativeAsset->getEntityCount();
    
    return [FilamentAsset getEntitiesArray:ents :count];
    
}


@end
