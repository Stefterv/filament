//
//  Engine.h
//  Engine
//
//  Created by Stef Tervelde on 19/08/2021.
//
#import "Renderer.h"
#import "Scene.h"
#import "View.h"
#import "SwapChain.h"
#import "Entity.h"
#import "Camera.h"
#import "TransformManager.h"
#import "FSObject.h"

#import <UIKit/UIKit.h>


#ifndef Engine_h
#define Engine_h

@interface Engine : FSObject
NS_ASSUME_NONNULL_BEGIN

- (Renderer*) createRenderer;
- (Scene*) createScene;
- (View*) createView;
- (Camera*) createCamera: (Entity*) entity;
- (SwapChain*) createSwapChain:(CALayer*)layer;
- (TransformManager*_Nonnull)getTransformManager;
- (instancetype) destroy: (Entity*) entity;
+ (instancetype) create;

NS_ASSUME_NONNULL_END
@end



#endif /* Engine_h */
