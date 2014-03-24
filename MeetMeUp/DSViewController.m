//
//  DSViewController.m
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DSViewController.h"
#import "Event.h"

@interface DSViewController () <UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *myTableView;
   
    NSArray *meetUps;
    
}

@end

@implementation DSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=675c7470222665331c3a54136713442"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError *error;
        
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        // set meetings array to data
        meetUps = jsonData[@"results"];
        
        [myTableView reloadData];
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return meetUps.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newMeetingCell"];
    
    
    self.meetings = meetUps[indexPath.row];
    
    
    cell.textLabel.text = self.meetings[@"name"];
    
    cell.detailTextLabel.text = self.meetings[@"venue"][@"address_1"];
    
    
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    
    NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
    
    Event *thisEvent = [meetUps objectAtIndex:indexPath.row];
    
    DetailViewController *newVC = segue.destinationViewController;
    
    newVC.event = thisEvent;
    
    
}



@end
