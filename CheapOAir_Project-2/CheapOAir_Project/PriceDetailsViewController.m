//
//  PriceDetailsViewController.m
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/03/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "PriceDetailsViewController.h"
#import "TravelerDetailsViewController.h"

@interface PriceDetailsViewController ()

@end

@implementation PriceDetailsViewController
@synthesize sales,datestr,src,dest,i,returnDateLabel,staticReturnDateLabel,returndatestr,travelersStr,classsStr ;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
    if ([i  isEqual: @"1"]) {
        [returnDateLabel setHidden:YES];
        [staticReturnDateLabel setHidden:YES];
        
    }
    else
    {
        returnDateLabel.text=returndatestr;
    
    }
    _travelersLabel.text = travelersStr;
    _classsLabel.text=classsStr;
    _salesLabel.text = sales;
    _dateLabel.text = datestr;
    _sourceLbl.text = src;
    _destLbl.text=dest;
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller
    if ([segue.identifier isEqualToString:@"pricedetailTotravelerdetail"])
    {
        TravelerDetailsViewController *destinationvc = segue.destinationViewController;
       
        destinationvc.salesFromPriceVC = sales;
        destinationvc.srcFromPriceVC = src;
        destinationvc.destFromPriceVC = dest;
        destinationvc.datestrFromPriceVC = datestr;
        destinationvc.returndatestrFromPriceVC = returndatestr;
        destinationvc.travelersStrFromPriceVC=travelersStr;
        destinationvc.classsStrFromPriceVC = classsStr;
         NSLog(@" in Price detail %@", sales);
        
    }

}


- (IBAction)buyNow:(id)sender {
    sales = _salesLabel.text;
    [self performSegueWithIdentifier:@"pricedetailTotravelerdetail" sender:self];
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
