//
//  Parallel.h
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import <Foundation/Foundation.h>

#import "ParallelThread.h"
#import "ParallelCommand.h"

@interface Parallel : NSObject
@property (nonatomic, retain) ParallelThread *parallelThread;

- (void)performSelector:(SEL)selector onTarget:(id)target withCallback:(void (^)(id))callback;
- (void)cancel;
@end
