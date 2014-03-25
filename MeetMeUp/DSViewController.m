//
//  DSViewController.m
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DSViewController.h"
#import "DetailViewController.h"


@interface DSViewController () <UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UITableView *myTableView;
   
    NSArray *meetings;
    
}

@end

@implementation DSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=675c7470222665331c3a54136713442"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError *error;
        
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        // set meetings array to data
        meetings = jsonData[@"results"];
        
        [myTableView reloadData];
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return meetings.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newMeetingCell"];
    
    NSDictionary *event = meetings[indexPath.row];
    
    cell.textLabel.text = event[@"name"];
    
    cell.detailTextLabel.text = event[@"venue"][@"address_1"];
    
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {
    
    NSIndexPath *indexPath = [myTableView indexPathForCell:sender];
    
    NSDictionary *event = meetings[indexPath.row];
    
    DetailViewController *newVC = segue.destinationViewController;
    
    newVC.title = event[@"name"];
    
    
    newVC.rsvpLabel.text = [NSString stringWithFormat:@"%@",event[@"yes_rsvp_count"]];
    
    newVC.hostLabel.text = event[@"group"][@"name"];
    
    newVC.descriptionTextField.text = event[@"description"];
    
    

    
}


//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender
//{
//    //get the index path for the cell selected
//    NSIndexPath* indexPath = [myTableView indexPathForCell:sender];
//    NSDictionary *event = events[indexPath.row];
//    
//    //get a reference to the view controller to pass details
//    EventDetailsViewController *viewController = segue.destinationViewController;
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    
//    //
//    NSDictionary *group = event[@"group"];
//    viewController.title = event[@"name"];
//    viewController.rsvpCountTextField.text = [NSString stringWithFormat:@"%@",event[@"yes_rsvp_count"]];
//    
//    viewController.descriptionTextView.text = event[@"description"];
//    viewController.eventHostingGroupTextView.text = group[@"name"];
//    viewController.url = event[@"event_url"];
//    viewController.urlName = group[@"urlname"];
//    viewController.eventID = event[@"id"];
//    
//}




@end
