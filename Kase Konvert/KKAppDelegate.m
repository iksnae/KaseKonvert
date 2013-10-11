//
//  KKAppDelegate.m
//  Kase Konvert
//
//  Created by Khalid on 10/10/13.
//  Copyright (c) 2013 devious. All rights reserved.
//

#import "KKAppDelegate.h"
#import "KKConverter.h"

#define CASES @[@"Camel Case", @"Sentence Case", @"Title Case"]


@interface KKAppDelegate ()
{
    NSInteger conversionMode;
}
@property (weak) IBOutlet NSComboBox *conversionModeCB;
@property (weak) IBOutlet NSButton *convertButton;
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSTextField *outputTextField;
@property (readonly) NSString * inString;
- (IBAction)onConversionModeChange:(id)sender;
- (IBAction)onConvert:(id)sender;

@end


@implementation KKAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)onConversionModeChange:(id)sender {
    conversionMode = self.conversionModeCB.indexOfSelectedItem;
}

- (void)awakeFromNib
{
    [self.conversionModeCB selectItemAtIndex:0];
}

- (IBAction)onConvert:(id)sender {
    switch (conversionMode) {
        case 0:
            // camel case
            NSLog(@"Camel Case");
            [self convertToCamelCase];
            break;
        case 1:
            // sentence case
            NSLog(@"Sentence Case");
            [self convertToSentenceCase];
            break;
        case 2:
            // title case
            NSLog(@"Title Case");
            [self convertToTitleCase];
            break;
            
        default:
            break;
    }
}

- (NSString*)inString
{
    return self.inputTextField.stringValue;
}

- (void)convertToCamelCase
{
    [self.outputTextField setStringValue:[KKConverter CamelCaseString:self.inString]];
}

- (void)convertToSentenceCase
{
    [self.outputTextField setStringValue:[KKConverter SentenceCaseString:self.inString]];
}

- (void)convertToTitleCase
{
    [self.outputTextField setStringValue:[KKConverter TitleCaseString:self.inString]];
}


@end
