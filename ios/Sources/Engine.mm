//
//  Engine.m
//
//
//  Created by Stef Tervelde on 28.06.22.
//

#import <Foundation/Foundation.h>
#import <filament/Engine.h>
#import "Engine.h"

@implementation Engine{
    filament::Engine* ref;
}

+ (instancetype) create{
    auto eng = filament::Engine::create(filament::Engine::Backend::METAL);
//    auto engine = [[Engine alloc] initWithRef:eng];
//    engine->ref = eng;
//    return engine;
}

@end
