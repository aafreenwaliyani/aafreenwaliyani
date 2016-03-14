//
//  onewayTableViewCell.h
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/6/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface onewayTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *onewaySourceLabel;

@property (strong, nonatomic) IBOutlet UILabel *onewayDestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *onewayDepartureDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *onewayPriceLabel;

@end
