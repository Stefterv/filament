//
//  Renderer.c
//  Renderer
//
//  Created by Stef Tervelde on 19/08/2021.
//

#import "Renderer.h"
#import <filament/Renderer.h>
#import <filament/View.h>
#import <filament/Viewport.h>

@implementation Renderer{
    filament::Renderer* ref;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::Renderer*)ref;
    return self;
}

- (void) setClearOptions:(float)r :(float)g :(float)b :(float)a :(bool)clear :(bool)discard{
    self->ref->setClearOptions({.clearColor={r,g,b,a}, .clear = clear});
}

- (bool)beginFrame:(SwapChain *)swapchain{
    return self->ref->beginFrame((filament::SwapChain*) swapchain.ref);
}
- (void)render:(View *)view{
    self->ref->render((filament::View*) view.ref);
}

- (void)endFrame{
    self->ref->endFrame();
}

@end
