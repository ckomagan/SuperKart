//
//  OfferController.m
//  SuperKart
//
//  Created by Chan Komagan on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OfferController.h"
# import "SearchItem.h"

@interface OfferController()
    @property (nonatomic, strong) NSString *itemName;
    @property (nonatomic, strong) NSMutableData *responseData;
@end 


@implementation OfferController

@synthesize zip;
@synthesize item;
@synthesize nsURL;
@synthesize itemName;
@synthesize responseData;

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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    itemText.text = item;
    zipcode.text = zip;
    offerList.textLabel.text = @"Milk";
    offerList.detailTextLabel.text = @"Whole Foods";
    
    nsURL = [@"http://www.komagan.com/KidsIQ/index.php?format=json&item_name=" stringByAppendingFormat:@"%d ", itemName];
        
    NSError *error = nil;
    self.responseData = [NSMutableData data];
    
    NSURLRequest *aRequest = [NSURLRequest requestWithURL:[NSURL URLWithString: nsURL]];
    NSLog(@"request established");
    
    NSData *aResponse = [NSURLConnection sendSynchronousRequest:aRequest returningResponse:nil error:nil];
    [[NSURLConnection alloc] initWithRequest:aRequest delegate:self];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {        
    [self.responseData appendData:data]; 
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {    
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %d bytes of data",[self.responseData length]);
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    NSMutableArray *answers = [[NSMutableArray alloc] init];
    
   
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
