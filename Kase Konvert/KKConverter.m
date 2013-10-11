//
//  KKConverter.m
//  Kase Konvert
//
//  Created by Khalid on 10/11/13.
//  Copyright (c) 2013 devious. All rights reserved.
//

#import "KKConverter.h"

@implementation KKConverter


+ (NSString*)CamelCaseString:(NSString *)inString
{
    return [[inString capitalizedString]stringByReplacingOccurrencesOfString:@" " withString:@""];
}


+ (NSString*)TitleCaseString:(NSString *)inString
{
    return [inString capitalizedString];    
}


+ (NSString*)SentenceCaseString:(NSString *)inString
{
    NSMutableString *processedString = [inString mutableCopy];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    inString = [inString uppercaseStringWithLocale:locale];
    CFStringTokenizerRef stringTokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, (__bridge CFStringRef)(inString), CFRangeMake(0, [inString length]), kCFStringTokenizerUnitSentence, (__bridge CFLocaleRef)(locale));
    
    
    while (CFStringTokenizerAdvanceToNextToken(stringTokenizer) != kCFStringTokenizerTokenNone) {
        CFRange sentenceRange = CFStringTokenizerGetCurrentTokenRange(stringTokenizer);
        
        if (sentenceRange.location != kCFNotFound && sentenceRange.length > 0) {
            NSRange firstLetterRange = NSMakeRange(sentenceRange.location, 1);
            NSString *uppercaseFirstLetter = [[processedString substringWithRange:firstLetterRange] uppercaseStringWithLocale:locale];
            [processedString replaceCharactersInRange:firstLetterRange withString:uppercaseFirstLetter];
        }
    }
    CFRelease(stringTokenizer);
    return processedString;
}



@end
