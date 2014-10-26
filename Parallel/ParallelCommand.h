//
//  ParallelCommand.h
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import <Foundation/Foundation.h>

@interface ParallelCommand : NSObject
@property (nonatomic, retain) id target;
@property (nonatomic) SEL selector;
@property (nonatomic, copy) void (^callback)(id);

- (instancetype)initWithTarget:(id)aTarget selector:(SEL)sel callback:(void (^)(id))cb;
- (void)execute;
@end
