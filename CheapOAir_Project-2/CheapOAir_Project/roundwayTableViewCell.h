//
//  roundwayTableViewCell.h
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/8/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface roundwayTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *roundwaySourceLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundwayDestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundwayDepartureDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundwayReturnDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundwayPriceLabel;

@end
