//
//  Kase_KonvertTests.m
//  Kase KonvertTests
//
//  Created by Khalid on 10/10/13.
//  Copyright (c) 2013 devious. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KKConverter.h"

@interface Kase_KonvertTests : XCTestCase

@end

@implementation Kase_KonvertTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCamelCase
{
    NSString * inString = @"hello world";
    NSString * outString = [KKConverter CamelCaseString:inString];
    XCTAssertTrue([outString isEqualToString:@"HelloWorld"], @"string should have been camel cased");
}


- (void)testTitleCase
{
    NSString * inString = @"hello world";
    NSString * outString = [KKConverter TitleCaseString:inString];
    XCTAssertTrue([outString isEqualToString:@"Hello World"], @"string should have been title cased");
}

- (void)testSentenceCase
{
    NSString * inString = @"hello world. i sure like being inside this fancy computer. goodbye.";
    NSString * outString = [KKConverter SentenceCaseString:inString];
    XCTAssertTrue([outString isEqualToString:@"Hello world. I sure like being inside this fancy computer. Goodbye."], @"string should have been sentence cased");
}

@end
