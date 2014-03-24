//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DetailViewController.h"
#import "DSViewController.h"


@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *rsvpLabel;

@property (weak, nonatomic) IBOutlet UILabel *hostLabel;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;

@property (weak, nonatomic) IBOutlet UILabel *forMoreInfoLabel;


@end


@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.rsvpLabel.text = [NSString stringWithFormat:@"%@", self.event.rsvp[@"yes_rsvp_count"]];
//    
//    self.hostLabel.text = self.event.host;
//    self.descriptionTextField.text = self.event.description;
//    self.forMoreInfoLabel.text = self.event.moreInfo;
//    
    
    
    
}



@end









