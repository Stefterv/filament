//
//  FilamentAsset.h
//  FilamentAsset
//
//  Created by Stef Tervelde on 24/08/2021.
//

#import "FSObject.h"
#import "Scene.h"
#import "Entity.h"

#ifndef FilamentAsset_h
#define FilamentAsset_h

NS_SWIFT_NAME(glTFIO.FilamentAsset)
@interface FilamentAsset : FSObject
- (void) addToScene: (Scene*) scene;

- (NSArray<Entity *>*) getEntities;
- (Entity *) getRoot;
@end

#endif /* FilamentAsset_h */
