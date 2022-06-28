//
//  FilamentAsset.m
//  FilamentAsset
//
//  Created by Stef Tervelde on 24/08/2021.
//

#import <Foundation/Foundation.h>
#import "FilamentAsset.h"
#import <gltfio/FilamentAsset.h>
#import <filament/Scene.h>


@implementation FilamentAsset{
    gltfio::FilamentAsset* ref;
}
- (void) addToScene: (Scene*) sceneRef{
    auto scene = (filament::Scene*)sceneRef.ref;
    scene->addEntities(self->ref->getEntities(), self->ref->getEntityCount());
}
- (NSArray<Entity*>*_Nonnull) getEntities{
    auto count = self->ref->getEntityCount();
    auto ents = [[NSMutableArray alloc] init];
    auto _ents = self->ref->getEntities();
    for(auto i = 0; i<count; i++){
        auto ent = _ents[i];
        [ents addObject:[[Entity alloc] initWithRef:utils::Entity::smuggle(ent)]];
    }
    return ents;
}
- (Entity*) getRoot{
    auto root = self->ref->getRoot();
    return [[Entity alloc] initWithRef:utils::Entity::smuggle(root)];
}
- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (gltfio::FilamentAsset*)ref;
    return self;
}

@end
