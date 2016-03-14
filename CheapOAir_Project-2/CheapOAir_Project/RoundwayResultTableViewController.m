//
//  RoundwayResultTableViewController.m
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/8/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "RoundwayResultTableViewController.h"
#import "PriceDetailsViewController.h"
#import "roundwayTableViewCell.h"
#import "LoadingStatus.h"
@interface RoundwayResultTableViewController ()
{
    
    NSString * twosalesTotal;
    NSString *twodate;
    NSString *tworeturndate;
    NSString *twosrc;
    NSString *twodest;
}
@end

@implementation RoundwayResultTableViewController
@synthesize  TwoSource,TwoDepartureDate,TwoDestination,TwoReturnDate,TwoClass,TwoTravelers;
NSMutableArray *twoobjects;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
    
    
    LoadingStatus *loadingStatus = [LoadingStatus defaultLoadingStatusWithWidth:CGRectGetWidth(self.view.frame)];
    [self.view addSubview:loadingStatus];
    
    // loading/processing photos might take a while -- do it asynchronously
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        twoobjects = [self getResponseData];
        NSLog(@"%@",twoobjects);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [loadingStatus removeFromSuperviewWithFade];
            [self.tableView reloadData];
        });
    });

    
    
    
    
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

    return twoobjects.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *onewayCell= @"roundwayCell";
    roundwayTableViewCell *cell = (roundwayTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:onewayCell forIndexPath:indexPath];
 
    
    if (cell == nil) {
        cell =[[roundwayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                         reuseIdentifier:onewayCell];
        
    }
    
    // Configure the cell...
    NSLog(@"Source: %@ Destination:%@ DepartureDate:%@ ReturnDate: %@",TwoSource,TwoDestination,TwoDepartureDate,TwoReturnDate);
    cell.roundwayPriceLabel.text = [twoobjects objectAtIndex:indexPath.row];
    cell.roundwaySourceLabel.text = TwoSource;
    cell.roundwayDestinationLabel.text = TwoDestination;
    cell.roundwayDepartureDateLabel.text = TwoDepartureDate;
    cell.roundwayReturnDateLabel.text = TwoReturnDate;
    
        return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    twosalesTotal= [twoobjects objectAtIndex:indexPath.row];
    twosrc = TwoSource;
    twodest=TwoDestination;
    twodate = TwoDepartureDate;
    tworeturndate = TwoReturnDate;
    [self performSegueWithIdentifier:@"roundwayresult2priceViewController" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"roundwayresult2priceViewController"])
    {
        PriceDetailsViewController *destinationvc = segue.destinationViewController;
        NSLog(@"%@", twosalesTotal);
        destinationvc.sales = twosalesTotal;
        destinationvc.src = twosrc;
        destinationvc.dest = twodest;
        destinationvc.datestr=twodate;
        destinationvc.returndatestr = tworeturndate;
        destinationvc.travelersStr = TwoTravelers;
        destinationvc.classsStr = TwoClass;
        destinationvc.i= @"2";
        
        
    }
}

-(NSMutableArray *)getResponseData{

    NSString *requestString = [NSString stringWithFormat:@"https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyBsUijlTkzafwDfnz0AeEH8tLcAIV70pEc&fields=kind,trips(tripOption(saleTotal))"];
    
    
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
                                                   withString:TwoSource];
    contents = [contents stringByReplacingOccurrencesOfString:@"LAX"
                                                   withString:TwoDestination];
    contents = [contents stringByReplacingOccurrencesOfString:@"2015-12-28"
                                                   withString:TwoDepartureDate];
    
    contents = [contents stringByReplacingOccurrencesOfString:@"2015-12-25"
                                                   withString:TwoReturnDate];
    
    NSData* newdata = [contents dataUsingEncoding:NSUTF8StringEncoding];
    
    //  [req setHTTPBody:JSONData];
    [req setHTTPBody:newdata];
    /*
     NSString *dataString =@"{\"origin\":\"IAH\", \"destination\":\"BOM\", \"date\":\"2015-12-12\"}";
     
     NSData *requestData = [NSData dataWithBytes:[dataString UTF8String] length:[dataString length]];
     
     [req setHTTPBody:requestData];
     */
    NSURLResponse *theResponse = NULL;
    NSError *theError = NULL;
    NSMutableData *theResponseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&theResponse error:&theError];
    
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
    
    twoobjects = [requiredString componentsSeparatedByString:@"       "];
    [twoobjects removeObjectAtIndex:0];
    // [objects removeObjectsAtIndexes:0];
    NSLog(@"%@",twoobjects);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    int i = 1;
    for (NSString *str in twoobjects)
    {
        [dict setObject:str forKey:[NSString stringWithFormat:@"sometext%d", i++]];}
    
    NSLog(@"%@",dict);
    return twoobjects;


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
*//*
- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    salesTotal= [objects objectAtIndex:indexPath.row];
    src = Source;
    dest=Destination;
    date = DepartureDate;
    [self performSegueWithIdentifier:@"roundwayresult2priceViewController" sender:self];
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonTwoWay:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}
@end
