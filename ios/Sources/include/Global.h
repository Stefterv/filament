//
//  Global.h
//  Global
//
//  Created by Stef Tervelde on 25/08/2021.
//
#import "Engine.h"
#import "Scene.h"
#import "FilamentAsset.h"
#import "MaterialInstance.h"

#ifndef Global_h
#define Global_h

@interface Global : NSObject
+ (void) setAssetMaterial: (Engine*) engine :(FilamentAsset*) asset :(MaterialInstance*) material;
+ (void) setupLighting: (Engine*) engine :(Scene*) scene;

+ (void) setupIBL: (Engine*) engine :(Scene*) scene : (const uint8_t*) iblBytes :(NSInteger) iblCount :(const uint8_t*) skyBytes :(NSInteger) skyCount;
@end

#endif /* Global_h */
