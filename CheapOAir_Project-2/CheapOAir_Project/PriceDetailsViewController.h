//
//  PriceDetailsViewController.h
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/03/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PriceDetailsViewController : UIViewController

@property (nonatomic, retain) NSString * sales;
@property (strong, nonatomic) IBOutlet UILabel *salesLabel;
@property (strong, nonatomic) IBOutlet UILabel *staticReturnDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *returnDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *travelersLabel;
@property (strong, nonatomic) IBOutlet UILabel *classsLabel;

@property (strong, nonatomic) IBOutlet UILabel *sourceLbl;
@property (strong, nonatomic) IBOutlet UILabel *destLbl;
@property (nonatomic, retain) NSString * src;
@property (nonatomic, retain) NSString * dest;
@property (nonatomic, retain) NSString * returndatestr;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) NSString * datestr;
@property (nonatomic, retain) NSString * i;
@property (nonatomic, retain) NSString * classsStr;
@property (nonatomic, retain) NSString * travelersStr;
- (IBAction)buyNow:(id)sender;
- (IBAction)backBtn:(id)sender;



@end
