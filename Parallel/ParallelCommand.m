//
//  ParallelCommand.m
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import "ParallelCommand.h"

@implementation ParallelCommand
@synthesize target, selector, callback;

- (instancetype)initWithTarget:(id)aTarget selector:(SEL)sel callback:(void (^)(id))cb
{
    self = [super init];
    
    if (self) {
        target = aTarget;
        selector = sel;
        callback = cb;
    }
    
    return self;
}

- (void)execute
{
    id res = [target performSelector:selector];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        callback(res);
    });
}

@end
