//
//  Material.h
//  Material
//
//  Created by Stef Tervelde on 25/08/2021.
//
#import "FSObject.h"
#import "Engine.h"
#import "MaterialInstance.h"

#ifndef Material_h
#define Material_h
NS_SWIFT_NAME(Filament.Material)
@interface Material : FSObject
- (MaterialInstance* _Nonnull)createInstance;
@end



NS_SWIFT_NAME(Material.Builder)
@interface MaterialBuilder : FSObject
- (MaterialBuilder*_Nonnull) package: (NSArray*_Nonnull) bytes;
- (Material*_Nonnull) build: (Engine*_Nonnull) engine;
@end



#endif /* Material_h */
