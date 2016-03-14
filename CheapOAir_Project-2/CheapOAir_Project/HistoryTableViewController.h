//
//  HistoryTableViewController.h
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/5/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelerDetailsViewController.h"
#import "MainSearchViewController.h"

@interface HistoryTableViewController : UITableViewController <setHistoryRows>
@property (retain, nonatomic) NSMutableArray *history;
@property (strong, nonatomic)  NSString * passedStr;

@end
