//
//  RoundwayResultTableViewController.h
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/8/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundwayResultTableViewController : UITableViewController

@property (nonatomic, retain) NSString* TwoSource;
@property (nonatomic, retain) NSString* TwoDestination;
@property (nonatomic, retain) NSString* TwoDepartureDate;
@property (nonatomic, retain) NSString* TwoReturnDate;
@property (nonatomic, retain) NSString* TwoTravelers;
@property (nonatomic, retain) NSString* TwoClass;

- (IBAction)backButtonTwoWay:(id)sender;


@end
