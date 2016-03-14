//
//  PaymentInfo.h
//  CheapOAir_Project
//
//  Created by Waliyani, Aafreen on 12/9/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PaymentInfo : NSManagedObject

@property (nonatomic, retain) NSString * address1;
@property (nonatomic, retain) NSString * address2;
@property (nonatomic, retain) NSNumber * cardnumber;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSNumber * contactnumber;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSDate * expirationdate;
@property (nonatomic, retain) NSString * passengername;
@property (nonatomic, retain) NSString * state;

@end
