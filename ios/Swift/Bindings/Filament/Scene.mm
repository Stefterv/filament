//
//  Scene.mm
//  
//
//  Created by Stef Tervelde on 29.06.22.
//


#import "Bindings/Filament/Scene.h"
#import <filament/Scene.h>

@implementation Scene{
    filament::Scene* nativeScene;
}

- (id) init:(void *)scene{
    self->_scene = scene;
    self->nativeScene = (filament::Scene*)scene;
    return self;
}

@end
