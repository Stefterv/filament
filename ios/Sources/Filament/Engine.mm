//
//  Engine.m
//  Engine
//
//  Created by Stef Tervelde on 19/08/2021.
//

#import "Engine.h"
#import <filament/Engine.h>
#import <utils/Entity.h>



@implementation Engine{
        filament::Engine* ref;
}
- (Renderer*) createRenderer{
    return [[Renderer alloc] initWithRef: ref->createRenderer()];
}

- (Scene*) createScene{
    return [[Scene alloc] initWithRef: ref->createScene()];
}

- (View*) createView{
    return [[View alloc] initWithRef: ref->createView()];
}

- (Camera*) createCamera: (Entity*) entity{
    return [[Camera alloc] initWithRef:ref->createCamera(utils::Entity::import(entity.ref))];
}

- (SwapChain*) createSwapChain:(CALayer*)layer{
    
    return [[SwapChain alloc] initWithRef:ref->createSwapChain((__bridge void*)layer)];
}

- (TransformManager*) getTransformManager{
    // Probably not working
    return [[TransformManager alloc] initWithRef: &ref->getTransformManager()];
}

- (instancetype) destroy:(Entity *)entity{
    self->ref->destroy(utils::Entity::import(entity.ref));
    return self;
}

+ (instancetype) create{
    auto eng = filament::Engine::create(filament::Engine::Backend::METAL);
    auto engine = [[Engine alloc] initWithRef:eng];
    engine->ref = eng;
    return engine;
}
@end
