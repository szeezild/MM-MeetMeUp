//
//  WebViewController.m
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()


@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIButton *forwardButton;


@end

@implementation WebViewController





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.url != nil) {
        
        NSURL *url = [NSURL URLWithString:self.url];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [self.myWebView loadRequest:request];
    }


}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if ([self.myWebView canGoBack]) {
        self.backButton.enabled = YES;
    } else {
        self.backButton.enabled = NO;
    }
    
    
    if ([self.myWebView canGoForward]) {
        self.forwardButton.enabled = YES;
    } else{
        self.forwardButton.enabled = NO;
    }
}



- (IBAction)onBackButtonPressed:(id)sender {
    
    [self.myWebView goBack];
    
    
}

- (IBAction)onForwardButtonPressed:(id)sender {
    
    [self.myWebView goForward];
    
}

@end
