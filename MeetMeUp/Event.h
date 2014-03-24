//
//  Event.h
//  MeetMeUp
//
//  Created by Dan Szeezil on 3/24/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSNumber *rsvp;
@property (strong, nonatomic) NSString *host;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *moreInfo;


@end
