//
//  ParallelThread.h
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import <Foundation/Foundation.h>

#import "ParallelCommand.h"

@interface ParallelThread : NSThread
@property (nonatomic, retain) NSMutableArray *commands;

- (void)addCommand:(ParallelCommand *)command;
@end
