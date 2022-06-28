//
//  RenderableManager.h
//  RenderableManager
//
//  Created by Stef Tervelde on 21/09/2021.
//

#import "FSObject.h"
#import "./MaterialInstance.h"
#import "./Engine.h"
#import "Entity.h"
#import <ARKit/ARPlaneGeometry.h>

#ifndef RenderableManager_h
#define RenderableManager_h

typedef NS_ENUM(NSInteger, PrimitiveType) {
    Triangles
} NS_SWIFT_NAME(RenderableManager.PrimitiveType);

typedef struct
{
    float x;
    float y;
    float z;
    float w;
    float u;
    float v;
} Vertex;

NS_SWIFT_NAME(Filament.RenderableManagerBuilder)
@interface RenderableManagerBuilder : FSObject
- (instancetype) geometry: (Engine*) engine :(int) index :(PrimitiveType) type :(const Vertex*) vertices :(NSInteger) vertexCount :(const NSInteger*) indices :(NSInteger) indexCount;
- (instancetype) geometry: (Engine*) engine :(int) index :(PrimitiveType) type :(ARPlaneGeometry*) plane;
- (instancetype) materials: (int)index :(MaterialInstance*)material;
- (instancetype) receiveShadows: (bool)enabled;
- (instancetype) castShadows: (bool)enabled;
- (instancetype) culling: (bool)enabled;
- (void) build: (Engine*)engine :(Entity*)entity;
@end

NS_SWIFT_NAME(Filament.RenderableManager)
@interface RenderableManager : FSObject

+ (RenderableManagerBuilder*) Builder: (int) count;

@end



#endif /* RenderableManager_h */
