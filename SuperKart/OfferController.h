//
//  OfferController.h
//  SuperKart
//
//  Created by Chan Komagan on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferController : UIViewController <UITableViewDelegate, UITextFieldDelegate>
{
    IBOutlet UILabel *zipcode;
    IBOutlet UILabel *itemText;
    IBOutlet UILabel *errorStatus;
    IBOutlet UITableViewCell *offerList;
}

@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *item;
@property (nonatomic, strong) NSString *nsURL;

@end
