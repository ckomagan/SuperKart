//
//  SuperKartViewController.m
//  SuperKart
//
//  Created by Chan Komagan on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SuperKartViewController.h"
#import "SearchItem.h"

@interface SuperKartViewController()
@end

@implementation SuperKartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    zipcode.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
}

-(IBAction)validateTextFields:(id)sender
{
    // make sure all fields are have something in them
    if (zipcode.text.length  > 0) {
        OK.enabled = YES;
    }
    else {
        OK.enabled = NO;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [OK setEnabled:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string { 
    return [string isEqualToString:@""] || 
    ([string stringByTrimmingCharactersInSet:
      [[NSCharacterSet decimalDigitCharacterSet] invertedSet]].length > 0);
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 5) ? NO : YES;
}

- (BOOL)isNumeric:(NSString *)input {
    for (int i = 0; i < [input length]; i++) {
        char c = [input characterAtIndex:i];
        // Allow a leading '-' for negative integers
        if (!((c == '-' && i == 0) || (c >= '0' && c <= '9'))) {
            return NO;
        }
    }
    return YES;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"searchItem"]) {
        SearchItem *searchItem = segue.destinationViewController;
        
        if ([zipcode.text isEqualToString:@""]) {
            errorStatus.text = @"Please enter the zip.";
            return;
        }
        if ([zipcode.text length] > 5) {
            return;
        }
        
        
    searchItem.zip = zipcode.text;  
    }
}

@end
