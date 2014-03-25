//
//  DetailViewController.h
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController  <UIWebViewDelegate>


@property NSDictionary *event;

@property NSString *hyperlink;


@end
