//
//  Animator.mm
//  swift-gltf-viewer
//
//  Created by Stef Tervelde on 30.06.22.
//
#import "Bindings/GLTFIO/Animator.h"
#import <gltfio/Animator.h>

@implementation Animator{
    gltfio::Animator* nativeAnimator;
}

- (id) init:(void *)animator{
    self->_animator = animator;
    self->nativeAnimator = (gltfio::Animator*)animator;
    return self;
}

@end
