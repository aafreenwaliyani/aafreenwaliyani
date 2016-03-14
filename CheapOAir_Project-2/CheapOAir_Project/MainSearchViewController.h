//
//  MainSearchViewController.h
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/01/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelerDetailsViewController.h"

@protocol setHistoryRows <NSObject>
-(void)sendHistString:(NSString*)value;

@end

@interface MainSearchViewController : UIViewController <setRows>
{
    NSString *source,*destination,*departureDate;
}
@property (strong, nonatomic) IBOutlet UIView *roundTripie;
@property (strong, nonatomic) IBOutlet UIView *onewayView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentedValueChanged:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *serachButton2;
@property (strong, nonatomic) IBOutlet UIButton *searchButton1;
- (IBAction)searchViewButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *searchViewButttonPressed1;
- (IBAction)searchViewButtonPressed1:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *onewaySourceTextField;
@property (strong, nonatomic) IBOutlet UITextField *onewayDestinationTextField;
@property (strong, nonatomic) IBOutlet UITextField *onewayDepartureDateTextField;
@property (strong, nonatomic) IBOutlet UITextField *onewayTravelersTextField;
@property (strong, nonatomic) IBOutlet UITextField *onewayClassTextField;

@property (retain, nonatomic) NSMutableArray *history;
@property (strong, nonatomic)  NSString * passedStr;

@property(retain)id <setHistoryRows> delegate;
@property (strong, nonatomic) NSString *histString;


//roundway IBOutlets
@property (strong, nonatomic) IBOutlet UITextField *roundwaySourceTextField;
@property (strong, nonatomic) IBOutlet UITextField *roundwayDestinationTextField;
@property (strong, nonatomic) IBOutlet UITextField *roundwayDepartureTextField;

@property (strong, nonatomic) IBOutlet UITextField *roundwayReturnTextField;
@property (strong, nonatomic) IBOutlet UITextField *roundwayClassTextField;
@property (strong, nonatomic) IBOutlet UITextField *roundwayTravelersTextField;


@property (strong, nonatomic) IBOutlet UIDatePicker *onewayDatePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *twowayDatePickerReturn;

@property (strong, nonatomic) IBOutlet UIDatePicker *twowayDatePickerDepart;



@end
