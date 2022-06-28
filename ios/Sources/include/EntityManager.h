//
//  EntityManager.h
//  EntityManager
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import "Entity.h"
#import "FSObject.h"

#ifndef EntityManager_h
#define EntityManager_h

NS_SWIFT_NAME(Utils.EntityManager)
@interface EntityManager : FSObject
- (Entity*_Nonnull) create;
+ (instancetype _Nonnull) get;
@end

#endif /* EntityManager_h */
