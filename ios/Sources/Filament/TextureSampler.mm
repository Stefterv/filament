//
//  TextureSampler.m
//  TextureSampler
//
//  Created by Stef Tervelde on 25/08/2021.
//

#import "TextureSampler.h"
#import <filament/TextureSampler.h>

@implementation TextureSampler{
    filament::TextureSampler* ref;
}
- (id) init{
    self = [super init];
    self = [self initWithRef:new filament::TextureSampler()];
    return self;
}

- (id) initWithRef: (void*) ref{
    self = [super initWithRef:ref];
    self->ref = (filament::TextureSampler*)ref;
    return self;
}

@end
