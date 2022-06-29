//
//  View.m
//  
//
//  Created by Stef Tervelde on 29.06.22.
//

#import "Bindings/Filament/View.h"
#import <filament/View.h>

@implementation View{
    filament::View* nativeView;
}

- (id) init:(void *)view{
    self->_view = view;
    self->nativeView = (filament::View*) view;
    return self;
}

@end
