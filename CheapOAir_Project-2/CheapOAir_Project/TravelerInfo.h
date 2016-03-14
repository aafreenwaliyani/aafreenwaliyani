//
//  TravelerInfo.h
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/9/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TravelerInfo : NSManagedObject

@property (nonatomic, retain) NSDate * departuredate;
@property (nonatomic, retain) NSString * destination;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * middlename;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSDate * returndate;
@property (nonatomic, retain) NSString * source;

@end
