//
//  TransformManager.h
//  Dummy
//
//  Created by Stef Tervelde on 19/10/2021.
//
#import "FSObject.h"
#import "Entity.h"
#import "Instance.h"
#import <simd/simd.h>

#ifndef TransformManager_h
#define TransformManager_h

NS_SWIFT_NAME(Filament.TransformManager)
@interface TransformManager: FSObject

- (instancetype) create: (Entity*)entity;
- (instancetype) setTransform: (Instance*)instance :(simd_float4x4)geometry;
- (Instance*) getInstance: (Entity*)entity;
- (void) setParent: (Instance*) instance :(Instance*)newParent;

@end

#endif /* TransformManager_h */
