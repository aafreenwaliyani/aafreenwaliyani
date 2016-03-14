//
//  ResultTableViewController.h
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/01/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController

- (IBAction)backButton:(id)sender;
@property (nonatomic, retain) NSString* Source;
@property (nonatomic, retain) NSString* Destination;
@property (nonatomic, retain) NSString* DepartureDate;
@property (nonatomic, retain) NSString* Travelers;
@property (nonatomic, retain) NSString* Class;
@end
