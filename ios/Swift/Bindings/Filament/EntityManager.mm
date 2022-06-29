//
//  EntityManager.mm
//  
//
//  Created by Stef Tervelde on 29.06.22.
//

#import "Bindings/Utils/EntityManager.h"
#import <utils/EntityManager.h>

@implementation EntityManager{
    utils::EntityManager* nativeManager;
}

- (id) init:(void *)manager{
    self->_manager = manager;
    self->nativeManager = (utils::EntityManager*) manager;
    return self;
}

- (Entity) create{
    return utils::Entity::smuggle(nativeManager->create());
}

@end
