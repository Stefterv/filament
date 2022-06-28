//
//  EntityManager.m
//  EntityManager
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import <Foundation/Foundation.h>
#import "EntityManager.h"
#import <utils/EntityManager.h>

@implementation EntityManager{
    utils::EntityManager* ref;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (utils::EntityManager*)ref;
    return self;
}

- (Entity*) create{
    auto ent = self->ref->create();
    return [[Entity alloc] initWithRef:utils::Entity::smuggle(ent)];
}

+ (instancetype) get{
    return [[EntityManager alloc] initWithRef: &utils::EntityManager::get()];
}

@end
