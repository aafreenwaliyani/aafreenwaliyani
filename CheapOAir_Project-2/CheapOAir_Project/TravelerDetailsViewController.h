//
//  TravelerDetailsViewController.h
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/05/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol setRows <NSObject>
-(void)sendString:(NSString*)value;

@end

@interface TravelerDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextField *titleText;
@property (strong, nonatomic) IBOutlet UILabel *fnameLabel;
@property (strong, nonatomic) IBOutlet UITextField *fnameText;
@property (strong, nonatomic) IBOutlet UILabel *mnameLabel;
@property (strong, nonatomic) IBOutlet UITextField *mnameText;
@property (strong, nonatomic) IBOutlet UILabel *lnameLabel;
@property (strong, nonatomic) IBOutlet UITextField *lnameText;
@property (strong, nonatomic) IBOutlet UIDatePicker *bdateLabel;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
@property (strong, nonatomic) IBOutlet UITextField *genderText;
@property (strong, nonatomic) IBOutlet UILabel *mealLabel;
@property (strong, nonatomic) IBOutlet UITextField *mealText;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (nonatomic,retain) UINavigationItem *navbar;
@property (strong, nonatomic) IBOutlet UIDatePicker *birthDatePicker;


@property(retain)id <setRows> delegate;
@property (strong, nonatomic) NSString *valueString;

//From Price View Controller
@property (nonatomic, retain) NSString * salesFromPriceVC; //Price
@property (nonatomic, retain) NSString * classsStrFromPriceVC; //Class
@property (nonatomic, retain) NSString * travelersStrFromPriceVC; //Travelers
@property (nonatomic, retain) NSString * datestrFromPriceVC; //DepartureDate
@property (nonatomic, retain) NSString * returndatestrFromPriceVC; //ReturnDate
@property (nonatomic, retain) NSString * srcFromPriceVC; //Source
@property (nonatomic, retain) NSString * destFromPriceVC; //Destination
//Methods
- (IBAction)bookTickets:(id)sender;
- (IBAction)backButtonAction:(UIButton *)sender;

@end
