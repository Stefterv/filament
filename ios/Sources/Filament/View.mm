//
//  View.m
//  View
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import <Foundation/Foundation.h>

#import "View.h"
#import <filament/View.h>
#import <filament/Viewport.h>

@implementation View{
    filament::View* ref;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::View*)ref;
    return self;
}

- (void) setCamera:(Camera *)camera{
    self->ref->setCamera((filament::Camera*)camera.ref);
}

- (void) setScene:(Scene *)scene{
    self->ref->setScene((filament::Scene*)scene.ref);
}

- (void) setViewport:(Viewport)viewport{
    self->ref->setViewport(filament::Viewport(viewport.x, viewport.y, viewport.width, viewport.height));
}

@end
