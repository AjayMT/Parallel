//
//  ParallelThread.m
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import "ParallelThread.h"

@implementation ParallelThread
@synthesize commands;

- (instancetype)init
{
    self = [super init];
    
    if (self)
        commands = [NSMutableArray array];
    
    return self;
}

- (void)main
{
    @autoreleasepool {
        while (true) {
            NSArray *cmds = commands;
            
            for (ParallelCommand *cmd in cmds) {
                [cmd execute];
                [commands removeObject:cmd];
            }
        }
    }
}

- (void)addCommand:(ParallelCommand *)command
{
    [commands addObject:command];
}

@end
