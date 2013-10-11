//
//  KKConverter.h
//  Kase Konvert
//
//  Created by Khalid on 10/11/13.
//  Copyright (c) 2013 devious. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKConverter : NSObject
+ (NSString*)CamelCaseString:(NSString *)inString;
+ (NSString*)TitleCaseString:(NSString *)inString;
+ (NSString*)SentenceCaseString:(NSString *)inString;
@end


