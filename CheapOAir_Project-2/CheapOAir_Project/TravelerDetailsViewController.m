//
//  TravelerDetailsViewController.m
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/05/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "TravelerDetailsViewController.h"
#import "PrintTravelerInfoViewController.h"
#import "HistoryTableViewController.h"
#import "MainSearchViewController.h"



@interface TravelerDetailsViewController ()

@end

@implementation TravelerDetailsViewController
@synthesize valueString,delegate;

    NSString * title;
    NSString * fname,*mname;

    NSString * lname;
    NSString *historyStr;
    NSString *email;
@synthesize titleText,fnameText,mnameText,lnameText,genderText,emailText,mealText,salesFromPriceVC ;
//@synthesize navbar;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
   [self.birthDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    NSLog(@"%@ in did load traveler", salesFromPriceVC);
 
  
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    NSLog(@"date birth is: %@", strDate);
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"travelerToprintinfo"])
    {
        PrintTravelerInfoViewController *destinationvc = segue.destinationViewController;
        
        //NSLog(@"%@", inputString);
        
        //pass data from travelersDetailViewController to print Travelers Info
        destinationvc.titlestring=title;
        destinationvc.fnamestring = fname;
        destinationvc.mnamestring = mname;
        destinationvc.lnamestring = lname;
        destinationvc.emailstring= email;
        destinationvc.genderstring= genderText.text;
        destinationvc.mealstring= mealText.text;
        
        //Pass data from price detail view to print travleres Info
        destinationvc.salesFromTravelVC = salesFromPriceVC;
        destinationvc.srcFromTravelVC = _srcFromPriceVC;
        destinationvc.destFromTravelVC = _destFromPriceVC;
        destinationvc.datestrFromTravelVC = _datestrFromPriceVC;
        destinationvc.returndatestrFromTravelVC = _returndatestrFromPriceVC;
        destinationvc.travelersStrFromTravelVC=_travelersStrFromPriceVC;
        destinationvc.classsStrFromTravelVC = _classsStrFromPriceVC;
        
    }
  
    
}


- (IBAction)bookTickets:(id)sender {
  title = titleText.text;
   fname = fnameText.text;
    mname = mnameText.text;
   lname = lnameText.text;
   email = emailText.text;
    historyStr = [NSString stringWithFormat: @"%@ %@ \n%@", fnameText.text,lnameText.text,salesFromPriceVC];
    NSLog(@"histstr: %@", historyStr);
    valueString = historyStr;
  // UIWindow *window = [UIApplication sharedApplication].keyWindow;
  //  UIViewController *rootViewController = window.rootViewController;
 //   UITabBarController *tabBar = (UITabBarController *)self.tabBarController;
   MainSearchViewController *svc = [[MainSearchViewController alloc]init];
    //HistoryTableViewController *htc=[self.tabBarController.viewControllers objectAtIndex:1];
                                     //[self.tabBarController.viewControllers objectAtIndex:1];
  self.delegate = svc;
  
  [[self delegate]sendString:valueString];
   // HistoryTableViewController *htc = ((UITabBarController *)self.parentViewController).viewControllers[1];//[[HistoryTableViewController alloc]init];
  //  [htc sendString:valueString];
    
    // [self dismissViewControllerAnimated:YES completion:nil];
   [self performSegueWithIdentifier:@"travelerToprintinfo" sender:self];
}

- (IBAction)backButtonAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
