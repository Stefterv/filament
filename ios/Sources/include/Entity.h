//
//  Entity.h
//  Entity
//
//  Created by Stef Tervelde on 23/08/2021.
//

#ifndef Entity_h
#define Entity_h

NS_SWIFT_NAME(Utils.Entity)
@interface Entity : NSObject
@property (nonatomic, readonly) uint32_t ref;

- (id) initWithRef: (uint32_t) ref;

@end


#endif /* Entity_h */
