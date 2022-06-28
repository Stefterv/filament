//
//  ResourceLoader.m
//  ResourceLoader
//
//  Created by Stef Tervelde on 24/08/2021.
//

#import <Foundation/Foundation.h>
#import "Engine.h"
#import <gltfio/ResourceLoader.h>
#import "ResourceLoader.h"


@implementation ResourceLoader{
    gltfio::ResourceLoader* ref;
}
- (void) loadResources: (FilamentAsset*) asset{
    auto item = (gltfio::FilamentAsset*)asset.ref;
    self->ref->loadResources(item);

}
- (id) initWithEngine: (Engine*) engine :(ResourceLoaderConfiguration) config{
    auto loader = new gltfio::ResourceLoader({
        .engine = (filament::Engine*)engine.ref
    });
    self = [super init];
    self->ref = loader;
    return self;
}
@end
