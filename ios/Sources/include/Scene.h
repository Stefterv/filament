//
//  Scene.h
//  Scene
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import "FSObject.h"
#import "Entity.h"

#ifndef Scene_h
#define Scene_h

NS_SWIFT_NAME(Filament.Scene)
@interface Scene : FSObject

- (void) addEntities: (NSArray<Entity *>*) entities;
- (void) addEntity: (Entity*) entity;
- (void) remove: (Entity*) entity;
- (void) removeEntities: (NSArray<Entity *>*) entities;

@end

#endif /* Scene_h */
