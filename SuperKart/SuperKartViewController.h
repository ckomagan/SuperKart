//
//  SuperKartViewController.h
//  SuperKart
//
//  Created by Chan Komagan on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperKartViewController : UIViewController {
    IBOutlet UITextField *zipcode;
    IBOutlet UILabel *errorStatus;
    IBOutlet UIButton *OK;
}

-(IBAction)validateTextFields:(id)sender;

@end
