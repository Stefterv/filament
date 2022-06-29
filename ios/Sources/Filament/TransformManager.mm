//
//  TransformManager.m
//  Dummy
//
//  Created by Stef Tervelde on 19/10/2021.
//
#import "TransformManager.h"
#import <filament/TransformManager.h>
#import <utils/EntityInstance.h>
#import <utils/Entity.h>
#import "SimdToMatf.h"

@implementation TransformManager{
    filament::TransformManager* ref;
}
- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::TransformManager*)ref;
    return self;
}

- (instancetype) create: (Entity*)entity{
    auto ent = utils::Entity::import(entity.ref);
    self->ref->create(ent);
    return self;
}
- (instancetype) setTransform: (Instance*)instance :(simd_float4x4)geometry{
//    self->ref->setTransform(*(filament::TransformManager::Instance*)instance.ref, [Mat4fHelper fromSimd:geometry]);
    return self;
}
- (Instance*) getInstance: (Entity*)entity{
    auto ent = utils::Entity::import(entity.ref);
    auto inst = new filament::TransformManager::Instance(self->ref->getInstance(ent));
    return [[Instance alloc] initWithRef:inst];
}

- (void) setParent: (Instance*)instance :(Instance*)newParent{
    self->ref->setParent(*(filament::TransformManager::Instance*)instance.ref, *(filament::TransformManager::Instance*)newParent.ref);
}

@end
