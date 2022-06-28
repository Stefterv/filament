//
//  Entity.m
//  Entity
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import <Foundation/Foundation.h>

#import "Entity.h"
#import <utils/Entity.h>

@implementation Entity{
    utils::Entity __ref;
}

- (id) initWithRef: (uint32_t) ref{
    self->__ref = utils::Entity::import(ref);
    self->_ref = ref;
    return self;
}

@end
