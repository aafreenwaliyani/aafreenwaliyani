//
//  PrintTravelerInfoViewController.m
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/06/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "PrintTravelerInfoViewController.h"
#import "TravelerInfo.h"
#import "AppDelegate.h"

@interface PrintTravelerInfoViewController ()

@end

@implementation PrintTravelerInfoViewController{
   
}
@synthesize titlelbl,emaillbl,lnamelbl,fnamelbl,travellersLabel,classLabel,sourceLabel,destinationLabel,genderlbl,priceLabel,mealLabel,departuredateLabel,returndateLabel
,staticReturnDateLabel;
@synthesize titlestring,fnamestring,lnamestring,emailstring,mnamestring,genderstring,srcFromTravelVC,destFromTravelVC,salesFromTravelVC,travelersStrFromTravelVC,classsStrFromTravelVC,datestrFromTravelVC,returndatestrFromTravelVC,mealstring;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
    // Do any additional setup after loading the view.
    self.titlelbl.text= titlestring;
    self.fnamelbl.text= fnamestring;
    self.mnamelbl.text=mnamestring;
    self.lnamelbl.text=lnamestring;
    self.emaillbl.text=emailstring;
    genderlbl.text=genderstring;
   
    
    sourceLabel.text = srcFromTravelVC;
    destinationLabel.text= destFromTravelVC;
    priceLabel.text = salesFromTravelVC;
    mealLabel.text = mealstring;
    travellersLabel.text = travelersStrFromTravelVC;
    classLabel.text = classsStrFromTravelVC;
    departuredateLabel.text = datestrFromTravelVC;
    
    if ([returndatestrFromTravelVC isEqual:nil]) {
        [returndateLabel setHidden:YES];
        [staticReturnDateLabel setHidden:YES];
    }
    else{
    returndateLabel.text = returndatestrFromTravelVC;
        
    }
        NSLog(@"in did load Print Travel");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Continue:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newtraveler = [NSEntityDescription insertNewObjectForEntityForName:@"TravelerInfo" inManagedObjectContext:context];
    [newtraveler setValue:self.sourceLabel.text forKey:@"source"];
    [newtraveler setValue:self.destinationLabel.text forKey:@"destination"];
    [newtraveler setValue:self.priceLabel.text forKey:@"price"];
   // [newtraveler setValue:self.subjectText.text forKey:@"returndate"];
   // [newtraveler setValue:self.subjectText.text forKey:@"departuredate"];
    [newtraveler setValue:fnamestring forKey:@"firstname"];
    [newtraveler setValue:lnamestring forKey:@"lastname"];
    [newtraveler setValue:mnamestring forKey:@"middlename"];
    [newtraveler setValue:emailstring forKey:@"email"];
    
    NSString *departdate = departuredateLabel.text;
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateformatter dateFromString:departdate];
    date = [NSDate dateWithTimeIntervalSinceReferenceDate:floor([date timeIntervalSinceReferenceDate])];
    [newtraveler setValue:date forKey:@"departuredate"];
    
    if ([returndatestrFromTravelVC isEqual:nil]) {
       [newtraveler setValue:nil forKey:@"returndate"];
    }
    else{
        NSString *returndate = returndateLabel.text;
        NSDateFormatter *dateformatter1 = [[NSDateFormatter alloc] init];
        [dateformatter1 setDateFormat:@"yyyy-MM-dd"];
        NSDate *rdate = [dateformatter1 dateFromString:returndate];
        rdate = [NSDate dateWithTimeIntervalSinceReferenceDate:floor([rdate timeIntervalSinceReferenceDate])];
        [newtraveler setValue:rdate forKey:@"returndate"];
    }
   

 NSError *error = nil;
 // Save the object to persistent store
 if (![context save:&error]) {
 NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
 }


    [self performSegueWithIdentifier:@"printTravelView2PaymentViewController" sender:self];
}

- (IBAction)backButtonAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
