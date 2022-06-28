//
//  Swapchain.m
//  Swapchain
//
//  Created by Stef Tervelde on 23/08/2021.
//

#import <Foundation/Foundation.h>
#import "SwapChain.h"
#import <filament/SwapChain.h>

@implementation SwapChain{
    filament::SwapChain* ref;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::SwapChain*)ref;
    return self;
}

@end
