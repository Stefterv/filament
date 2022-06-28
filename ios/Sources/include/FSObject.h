//
//  FSObject.h
//  FSObject
//
//  Created by Stef Tervelde on 23/08/2021.
//
#import <Foundation/Foundation.h>

#ifndef FSObject_h
#define FSObject_h

@interface FSObject : NSObject
@property (nonatomic, readonly) void* ref;

- (id) initWithRef: (void*) ref;
@end


#endif /* FSObject_h */
