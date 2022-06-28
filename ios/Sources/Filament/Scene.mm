//
//  Scene.m
//  Scene
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import "Scene.h"
#import "Entity.h"
#import <filament/Scene.h>
#import <utils/EntityManager.h>
#import <filament/LightManager.h>

@implementation Scene{
    filament::Scene* ref;
}

- (void) addEntities: (NSArray<Entity *>*) entities{
    for (Entity* entity in entities) {
        [self addEntity:entity];
    }
}
- (void) addEntity: (Entity *)entity{
    self->ref->addEntity(utils::Entity::import(entity.ref));
}

- (void) remove: (Entity*) entity{
    self->ref->remove(utils::Entity::import(entity.ref));
}
- (void) removeEntities: (NSArray<Entity *>*) entities{
    for (Entity* entity in entities) {
        [self remove:entity];
    }
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Scene*)ref;
    
    
    
    return self;
}

@end
