//
//  MaterialProvider.h
//  MaterialProvider
//
//  Created by Stef Tervelde on 24/08/2021.
//
#import "FSObject.h"
#import "Engine.h"

#ifndef MaterialProvider_h
#define MaterialProvider_h

NS_SWIFT_NAME(glTFIO.MaterialProvider)
@interface MaterialProvider: FSObject
+ (instancetype) createUbershaderLoader: (Engine*) engine;
@end

#endif /* MaterialProvider_h */
