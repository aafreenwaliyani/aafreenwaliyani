//
//  PaymentViewController.h
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/10/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PaymentViewController : UIViewController <UIAlertViewDelegate,MFMailComposeViewControllerDelegate>
//- (IBAction)expirationDatePickerAction:(id)sender;
{
    NSString* _PaymentInfo;
    NSManagedObjectContext* _managedObjectContext;
    UIAlertView *_myAlert;

}
- (IBAction)backButtonAction:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creditCardNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *cvvNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *address1TextField;
@property (strong, nonatomic) IBOutlet UITextField *address2TextField;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;
@property (strong, nonatomic) IBOutlet UITextField *zipTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *contactNumberTextField;


@property (strong, nonatomic) IBOutlet UIDatePicker *expirationDatePicker;


- (IBAction)submit:(id)sender;
@end