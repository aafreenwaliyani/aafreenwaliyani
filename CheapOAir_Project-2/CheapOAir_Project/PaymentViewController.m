//
//  PaymentViewController.m
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/10/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "PaymentViewController.h"
#import "PaymentInfo.h"
#import "AppDelegate.h"
#import "MainSearchViewController.h"

@interface PaymentViewController ()
{
    NSString *formatedDate;
    NSDate * date;
}

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
    
    _myAlert = [[UIAlertView alloc] initWithTitle:@"Thank you for booking. Your Flight is booked!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    _managedObjectContext = appDelegate.managedObjectContext;

    // Do any additional setup after loading the view.
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    [self.expirationDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    formatedDate  = [dateFormatter stringFromDate:datePicker.date];
    // self.selectedDate.text = strDate;
    NSLog(@"fdate: %@",formatedDate);
}


- (IBAction)submit:(id)sender {
    NSLog(@"fdate11: %@",formatedDate);
    
    PaymentInfo *paymentObj = (PaymentInfo *)[NSEntityDescription insertNewObjectForEntityForName:@"PaymentInfo" inManagedObjectContext:_managedObjectContext];
    [paymentObj setPassengername:_nameTextField.text];
    [paymentObj setAddress1:_address1TextField.text];
    [paymentObj setAddress2:_address2TextField.text];
    [paymentObj setCity:_cityTextField.text];
    [paymentObj setState:_stateTextField.text];
    
    
   // [paymentObj setCardnumber:_creditCardNumberTextField.text];
   // [paymentObj setContactnumber:_contactNumberTextField.text];
     
    NSError *error;if(![_managedObjectContext save:&error])
    {
        // Handle the error.
    }
    else
    {
        // Successfully added the record.
    }
   /* NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = @"Your Ticket is booked!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"aafreen.waliyani123@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    [self presentViewController:mc animated:YES completion:NULL];*/
    [_myAlert show];
    
    
   
}
/*
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [_myAlert show];
    
      [self dismissViewControllerAnimated:YES completion:NULL];
}
*/
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // [self dismissViewControllerAnimated:YES completion:nil];
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainSearchViewController *add = [storyboard instantiateViewControllerWithIdentifier:@"Tabbar"];
    [self presentViewController:add animated:YES completion:nil];
    
    // [self.navigationController popToRootViewControllerAnimated:YES];
    
}

/*- (IBAction)expirationDatePickerAction:(id)sender {
 
 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
 
 [dateFormatter setDateFormat:@"dd-MM-yyyy"];
 
 NSString *formatedDate = [dateFormatter stringFromDate:self.expirationDatePicker.date];
 NSLog(@"fdate: %@",formatedDate);
 
 //self.selectedDate.text =formatedDate;
 
 }*/



- (IBAction)backButtonAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

