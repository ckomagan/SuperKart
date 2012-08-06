//
//  SuperKartAppDelegate.h
//  SuperKart
//
//  Created by Chan Komagan on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchItem;

@interface SuperKartAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SearchItem *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SearchItem *viewController;

@end
