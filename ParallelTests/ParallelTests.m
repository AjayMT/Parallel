//
//  ParallelTests.m
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "Parallel.h"

@interface ParallelTests : XCTestCase
@property (nonatomic, retain) NSString *testString;
@property (nonatomic, retain) Parallel *parallel;

- (void)changeString;
@end

@implementation ParallelTests
@synthesize parallel, testString;

- (void)setUp {
    [super setUp];
    parallel = [[Parallel alloc] init];
    testString = @"not changed";
}

- (void)changeString
{
    testString = @"changed";
}

- (void)testExample {
    [parallel performSelector:@selector(changeString) onTarget:self withCallback:^(id result){
        XCTAssert(testString, @"changed");
    }];

    XCTAssert(testString, @"not changed");
}

- (void)tearDown
{
    [parallel cancel];
    [super tearDown];
}

@end
