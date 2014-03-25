//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DetailViewController.h"
#import "DSViewController.h"
#import "WebViewController.h"


@interface DetailViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;

@property (weak, nonatomic) IBOutlet UILabel *hostLabel;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;


@end


@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.rsvpLabel.text = [NSString stringWithFormat:@"%@",self.event[@"yes_rsvp_count"]];
    self.hostLabel.text = self.event[@"group"][@"name"];
    self.descriptionTextField.text = self.event[@"description"];
    
    self.descriptionTextField.scrollEnabled = YES;
    
}


- (IBAction)moreInfoButton:(id)sender {
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    WebViewController *webVC = segue.destinationViewController;
    
    webVC.url = self.event[@"event_url"];
    
//    NSLog(@"%@", webVC.url);
    
}


@end









