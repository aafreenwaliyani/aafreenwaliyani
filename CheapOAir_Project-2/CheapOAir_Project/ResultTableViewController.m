//
//  ResultTableViewController.m
//  CheapOAir_Project
//
//  Created by NoviceXcoders on 10/01/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "ResultTableViewController.h"
#import "PriceDetailsViewController.h"
#import "onewayTableViewCell.h"
#import "LoadingStatus.h"

@interface ResultTableViewController ()
{
    
    NSString * salesTotal;
    NSString *date;
    NSString *src;
    NSString *dest;
    
}
@end

@implementation ResultTableViewController
@synthesize  Source,DepartureDate,Destination,Travelers,Class;
NSMutableArray *objects;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
    LoadingStatus *loadingStatus = [LoadingStatus defaultLoadingStatusWithWidth:CGRectGetWidth(self.view.frame)];
    [self.view addSubview:loadingStatus];
    
    // loading/processing photos might take a while -- do it asynchronously
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        objects = [self getResponseData];
        NSLog(@"%@",objects);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [loadingStatus removeFromSuperviewWithFade];
            [self.tableView reloadData];
});
    });
      /*
    //[self.tableView registerClass:[onewayTableViewCell class] forCellReuseIdentifier:@"onewayCellNew"];
    NSString *requestString = [NSString stringWithFormat:
                               @"https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyBsUijlTkzafwDfnz0AeEH8tLcAIV70pEc&fields=kind,trips(tripOption(saleTotal))"];
    
    NSURL *url = [NSURL URLWithString:requestString];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    
    [req addValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    NSError *jsonParsingError = nil;
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"request" ofType:@"json"];
    

  //  [configJson setValue:[NSNumber numberWithInt:row] forKey:@"initial_page"];
    NSError *error = nil; // This so that we can access the error if something goes wrong
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    NSString *contents = [NSString stringWithContentsOfFile:filePath];
    NSLog(@"contents are: %@",contents);
    contents = [contents stringByReplacingOccurrencesOfString:@"BOS"
                                         withString:Source];
    contents = [contents stringByReplacingOccurrencesOfString:@"LAX"
                                                   withString:Destination];
    contents = [contents stringByReplacingOccurrencesOfString:@"2015-12-28"
                                                   withString:DepartureDate];
   
    NSData* newdata = [contents dataUsingEncoding:NSUTF8StringEncoding];
 
  //  [req setHTTPBody:JSONData];
    [req setHTTPBody:newdata];
    /*
    NSString *dataString =@"{\"origin\":\"IAH\", \"destination\":\"BOM\", \"date\":\"2015-12-12\"}";
    
    NSData *requestData = [NSData dataWithBytes:[dataString UTF8String] length:[dataString length]];
    
  [req setHTTPBody:requestData]; : 1 
     : "2"
*/
    
   /*
    NSURLResponse *theResponse = NULL;
    NSError *theError = NULL;
    NSMutableData *theResponseData;
 
    
         theResponseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&theResponse error:&theError];
 
 
    NSRange range = NSMakeRange(0, 67);
    [theResponseData replaceBytesInRange:range withBytes:NULL length:0];
    [theResponseData setLength:[theResponseData length] - 10];
   
   // [theResponseData replaceBytesInRange:NSMakeRange(33, 10) withBytes:NULL length:0];
   
   
    NSLog(@"%@",theResponseData);
    NSString* newStr = [[NSString alloc] initWithData:theResponseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", newStr);
    NSCharacterSet *unwantedChars = [NSCharacterSet characterSetWithCharactersInString:@"\n\"\n},{\n\""];
    NSString *requiredString = [[newStr componentsSeparatedByCharactersInSet:unwantedChars] componentsJoinedByString: @""];
   
   NSLog(@"%@", requiredString);
    
    objects = [requiredString componentsSeparatedByString:@"       "];
    [objects removeObjectAtIndex:0];
   // [objects removeObjectsAtIndexes:0];
    NSLog(@"%@",objects);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    int i = 1;
    for (NSString *str in objects)
    {
        [dict setObject:str forKey:[NSString stringWithFormat:@"sometext%d", i++]];}
   
    NSLog(@"%@",dict);
    
    */
    
}


-(void)viewWillAppear:(BOOL)animated{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return objects.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
     static NSString *onewayCell= @"onewayCellNew";
   onewayTableViewCell *cell = (onewayTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:onewayCell forIndexPath:indexPath];
    
    if (cell == nil) {
        cell =[[onewayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:onewayCell];
        
    }

    // Configure the cell...
    NSLog(@"Source: %@ Destination:%@ DepartureDate:%@",Source,Destination,DepartureDate);
   cell.onewayPriceLabel.text = [objects objectAtIndex:indexPath.row];
    cell.onewaySourceLabel.text = Source;
    cell.onewayDestinationLabel.text = Destination;
  cell.onewayDepartureDateLabel.text = DepartureDate;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/
- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
     salesTotal= [objects objectAtIndex:indexPath.row];
    src = Source;
    dest=Destination;
    date = DepartureDate;
    
   
    [self performSegueWithIdentifier:@"result2priceViewController" sender:self];
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"result2priceViewController"])
    {
        PriceDetailsViewController *destinationvc = segue.destinationViewController;
        NSLog(@"%@", salesTotal);
        destinationvc.sales = salesTotal;
           destinationvc.src = src;
        destinationvc.dest = dest;
        destinationvc.datestr=date;
        destinationvc.travelersStr = Travelers;
        destinationvc.classsStr = Class;
        destinationvc.i = @"1";
        
        
    }
}
-(NSMutableArray *)getResponseData{
    NSString *requestString = [NSString stringWithFormat:
                               @"https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyBsUijlTkzafwDfnz0AeEH8tLcAIV70pEc&fields=kind,trips(tripOption(saleTotal))"];
    
    NSURL *url = [NSURL URLWithString:requestString];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    
    [req addValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    NSError *jsonParsingError = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"request" ofType:@"json"];
    
    
    //  [configJson setValue:[NSNumber numberWithInt:row] forKey:@"initial_page"];
    NSError *error = nil; // This so that we can access the error if something goes wrong
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    NSString *contents = [NSString stringWithContentsOfFile:filePath];
    NSLog(@"contents are: %@",contents);
    contents = [contents stringByReplacingOccurrencesOfString:@"BOS"
                                                   withString:Source];
    contents = [contents stringByReplacingOccurrencesOfString:@"LAX"
                                                   withString:Destination];
    contents = [contents stringByReplacingOccurrencesOfString:@"2015-12-28"
                                                   withString:DepartureDate];
    
    NSData* newdata = [contents dataUsingEncoding:NSUTF8StringEncoding];
    
    //  [req setHTTPBody:JSONData];
    [req setHTTPBody:newdata];
    
    
   
      NSURLResponse *theResponse = NULL;
     NSError *theError = NULL;
     NSMutableData *theResponseData;
     
     
     theResponseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&theResponse error:&theError];
     
     
     NSRange range = NSMakeRange(0, 67);
     [theResponseData replaceBytesInRange:range withBytes:NULL length:0];
     [theResponseData setLength:[theResponseData length] - 10];
    
   
    
   
    NSLog(@"%@",theResponseData);
    NSString* newStr = [[NSString alloc] initWithData:theResponseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", newStr);
    NSCharacterSet *unwantedChars = [NSCharacterSet characterSetWithCharactersInString:@"\n\"\n},{\n\""];
    NSString *requiredString = [[newStr componentsSeparatedByCharactersInSet:unwantedChars] componentsJoinedByString: @""];
    
    NSLog(@"%@", requiredString);
    
    objects = [requiredString componentsSeparatedByString:@"       "];
    [objects removeObjectAtIndex:0];
    // [objects removeObjectsAtIndexes:0];
    NSLog(@"%@",objects);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    int i = 1;
    for (NSString *str in objects)
    {
        [dict setObject:str forKey:[NSString stringWithFormat:@"sometext%d", i++]];}
    
    NSLog(@"%@",dict);
    
    return objects;
}

- (IBAction)backButton:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
