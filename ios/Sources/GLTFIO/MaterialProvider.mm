//
//  MaterialProvider.m
//  MaterialProvider
//
//  Created by Stef Tervelde on 24/08/2021.
//

#import "Engine.h""
#import <Foundation/Foundation.h>
#import "MaterialProvider.h"
#include <gltfio/AssetLoader.h>

#include <gltfio/ResourceLoader.h>
#include <gltfio/TextureProvider.h>



@implementation MaterialProvider

+ (instancetype) createUbershaderLoader: (Engine*) engine{
    auto eng = (filament::Engine*)engine.ref;
    
    auto loader = gltfio::createUbershaderLoader(eng);
    return [[MaterialProvider alloc] initWithRef:loader];
}
@end
