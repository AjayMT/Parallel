//
//  Parallel.m
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import "Parallel.h"

@implementation Parallel
@synthesize parallelThread;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        parallelThread = [[ParallelThread alloc] init];
        [parallelThread start];
    }
    
    return self;
}

- (void)performSelector:(SEL)selector onTarget:(id)target withCallback:(void (^)(id))callback
{
    ParallelCommand *cmd = [[ParallelCommand alloc] initWithTarget:target selector:selector callback:callback];
    [parallelThread addCommand:cmd];
}

- (void)cancel
{
    parallelThread.commands = [NSMutableArray array];
    [parallelThread cancel];
}

@end
