//
//  Engine.m
//  
//
//  Created by Stef Tervelde on 29.06.22.
//
#import "Bindings/Filament/Engine.h"
#import <filament/Engine.h>

@implementation Engine{
    filament::Engine* nativeEngine;
}

+ (instancetype) create{
    auto nativeEngine = filament::Engine::create(filament::Engine::Backend::METAL);
    auto engine = [[Engine alloc] init:nativeEngine];
    engine->nativeEngine = nativeEngine;
    return engine;
}
+ (instancetype) create: (Backend) backend{
    auto nativeEngine = filament::Engine::create((filament::Engine::Backend)backend);
    auto engine = [[Engine alloc] init:nativeEngine];
    engine->nativeEngine = nativeEngine;
    return engine;
}

- (id) init: (void *)engine{
    self->_engine = engine;
    return self;
}

+ (void)destroy: (Engine*)engine{
    filament::Engine::destroy(engine->nativeEngine);
}


@end
