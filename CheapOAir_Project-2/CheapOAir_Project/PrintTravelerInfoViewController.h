//
//  PrintTravelerInfoViewController.h
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/06/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrintTravelerInfoViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *titlelbl;
@property (strong, nonatomic) IBOutlet UILabel *emaillbl;
@property (strong, nonatomic) IBOutlet UILabel *lnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *mnamelbl;

@property (strong, nonatomic) IBOutlet UILabel *fnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *genderlbl;
//travelers flight details IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *mealLabel;
@property (strong, nonatomic) IBOutlet UILabel *travellersLabel;
@property (strong, nonatomic) IBOutlet UILabel *classLabel;
@property (strong, nonatomic) IBOutlet UILabel *departuredateLabel;
@property (strong, nonatomic) IBOutlet UILabel *returndateLabel;



//from Travelers detail view controller
@property (nonatomic, retain) NSString *titlestring; //title
@property (nonatomic, retain) NSString *emailstring; //email
@property (nonatomic, retain) NSString *fnamestring; //first name
@property (nonatomic, retain) NSString *mnamestring; //middle name
@property (nonatomic, retain) NSString *lnamestring; //last name
@property (nonatomic, retain) NSString *genderstring; //gender
@property (nonatomic, retain) NSString *mealstring; //meal
@property (strong, nonatomic) IBOutlet  UILabel *staticReturnDateLabel;

//From Travel View Controller
@property (nonatomic, retain) NSString * salesFromTravelVC; //Price
@property (nonatomic, retain) NSString * classsStrFromTravelVC; //Class
@property (nonatomic, retain) NSString * travelersStrFromTravelVC; //Travelers
@property (nonatomic, retain) NSString * datestrFromTravelVC; //DepartureDate
@property (nonatomic, retain) NSString * returndatestrFromTravelVC; //ReturnDate
@property (nonatomic, retain) NSString * srcFromTravelVC; //Source
@property (nonatomic, retain) NSString * destFromTravelVC; //Destination

- (IBAction)Continue:(id)sender;
- (IBAction)backButtonAction:(UIButton *)sender;


@end
