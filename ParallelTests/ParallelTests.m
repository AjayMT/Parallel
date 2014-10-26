//
//  ParallelTests.m
//  Parallel
//
//  Created by Ajay Madhusudan on 26/10/14.
//  Copyright (c) 2014 Ajay Madhusudan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "Parallel.h"

@interface ParallelTests : XCTestCase
@property (nonatomic, retain) Parallel *parallel;
@property (nonatomic, retain) NSString *testString;

- (NSString *)changeString;
@end

@implementation ParallelTests
@synthesize parallel, testString;

- (void)setUp {
    [super setUp];
    
    parallel = [[Parallel alloc] init];
    testString = @"not changed";
}

- (void)tearDown {
    [parallel cancel];
    
    [super tearDown];
}

- (NSString *)changeString
{
    return (testString = @"changed");
}

- (void)testPerformSelector {
    XCTestExpectation *changedStringExpectation = [self expectationWithDescription:@"string changed"];
    
    [parallel performSelector:@selector(changeString) onTarget:self withCallback:^(id result){
        XCTAssertEqual(testString, @"changed");
        XCTAssertEqual(result, @"changed");
        
        [changedStringExpectation fulfill];
    }];
    
    XCTAssertEqual(testString, @"not changed");
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError *error){}];
}

@end
