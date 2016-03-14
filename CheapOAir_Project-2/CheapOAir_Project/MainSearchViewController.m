//
//  MainSearchViewController.m
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/01/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "MainSearchViewController.h"
#import "onewayTableViewCell.h"
#import "ResultTableViewController.h"
#import "HistoryTableViewController.h"
#import "RoundwayResultTableViewController.h"

@interface MainSearchViewController ()

@end

@implementation MainSearchViewController
@synthesize  roundTripie,segmentedControl;
@synthesize history, passedStr,histString;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];

   
    [self.onewayDatePicker addTarget:self action:@selector(dateOnewayPickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.twowayDatePickerDepart addTarget:self action:@selector(dateTwoWayDepartPickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.twowayDatePickerReturn addTarget:self action:@selector(dateTwoWayReturnPickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view.
}

- (void)dateOnewayPickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate1 = [dateFormatter stringFromDate:datePicker.date];
   // NSLog(@"date oneway is: %@", strDate1);
    _onewayDepartureDateTextField.text = strDate1;
     NSLog(@"date oneway is: %@", _onewayDepartureDateTextField.text);
    
}
- (void)dateTwoWayDepartPickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate2 = [dateFormatter1 stringFromDate:datePicker.date];
   // NSLog(@"date two depart is: %@", strDate2);
    _roundwayDepartureTextField.text = strDate2;
    
}
- (void)dateTwoWayReturnPickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate3 = [dateFormatter2 stringFromDate:datePicker.date];
   // NSLog(@"date two return is: %@", strDate3);
    _roundwayReturnTextField.text = strDate3;
    
}
/*-(void)viewDidDisappear:(BOOL)animated{
    HistoryTableViewController *htc=[self.tabBarController.viewControllers objectAtIndex:1];
    //[self.tabBarController.viewControllers objectAtIndex:1];
    self.delegate = htc;
    
    [[self delegate]sendHistString:histString];
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sendString:(NSString *)value{
    NSLog(@"in sendString str");
    if(history !=nil){
        [history addObject:value];
        histString = value;
        HistoryTableViewController *htc=[self.tabBarController.viewControllers objectAtIndex:1];
        //[self.tabBarController.viewControllers objectAtIndex:1];
        self.delegate = htc;
        
        [[self delegate]sendHistString:histString];
    }
    else{
        history = [[NSMutableArray alloc]init];
        [history addObject:value];
        histString = value;
        HistoryTableViewController *htc=[self.tabBarController.viewControllers objectAtIndex:1];
        //[self.tabBarController.viewControllers objectAtIndex:1];
        self.delegate = htc;
        
        [[self delegate]sendHistString:histString];
    }
    //  passedStr = value;
    
    NSLog(@"passed str = %@", history);
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([[segue identifier] isEqualToString:@"menu2resultViewController"])
    {
        
        //Get reference to ResultTableViewController VC
         UINavigationController *nav = [segue destinationViewController];
        ResultTableViewController *rvc = (ResultTableViewController *)nav.topViewController;
     //  ResultTableViewController *rvc = [segue destinationViewController];
        rvc.Source = _onewaySourceTextField.text;
        rvc.Destination = _onewayDestinationTextField.text;
        rvc.DepartureDate = _onewayDepartureDateTextField.text;
        rvc.Travelers = _onewayTravelersTextField.text;
        rvc.Class = _onewayClassTextField.text;
        
       }
    if ([[segue identifier] isEqualToString:@"menu2roundwayResultViewController"])
    {
        
        //Get reference to ResultTableViewController VC
        UINavigationController *nav1 = [segue destinationViewController];
        RoundwayResultTableViewController *rrvc = (RoundwayResultTableViewController *)nav1.topViewController;
       // RoundwayResultTableViewController *rrvc = [segue destinationViewController];
        rrvc.TwoSource = _roundwaySourceTextField.text;
        rrvc.TwoDestination = _roundwayDestinationTextField.text;
        rrvc.TwoDepartureDate = _roundwayDepartureTextField.text;
        rrvc.TwoReturnDate = _roundwayReturnTextField.text;
        rrvc.TwoTravelers=_roundwayTravelersTextField.text;
        rrvc.TwoClass=_roundwayClassTextField.text;
    }
    
    
    
    // Pass the selected object to the new view controller.
  /*  if ([segue.identifier isEqualToString:@"main2resultViewController"])
    {
        PrintTravelerInfoViewController *destinationvc = segue.destinationViewController;
        
        //NSLog(@"%@", inputString);
        destinationvc.titlestring=title;
        destinationvc.fnamestring = fname;
        destinationvc.lnamestring = lname;
        destinationvc.emailstring= email;
        
        
        
    }

    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.roundTripie.hidden = NO;
            self.oneWayView.hidden = YES ;
            break;
        case 1:
            self.roundTripie.hidden = YES;
            self.oneWayView.hidden = NO;
            break;
        default:
            break;
    }*/

}


- (IBAction)segmentedValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.roundTripie.hidden = NO;
            self.onewayView.hidden = YES ;
            break;
        case 1:
            self.roundTripie.hidden = YES;
            self.onewayView.hidden = NO;
            break;
        default:
            break;
    }
}

//Search Button event for oneway
- (IBAction)searchViewButtonPressed:(id)sender {
    //source=_onewaySourceTextField.text;
    //destination = _onewayDestinationTextField.text;
    
    [self performSegueWithIdentifier:@"menu2resultViewController" sender:self];
   
}


//Search Button event for Roundway
- (IBAction)searchViewButtonPressed1:(id)sender {
    [self performSegueWithIdentifier:@"menu2roundwayResultViewController" sender:self];

}
@end
