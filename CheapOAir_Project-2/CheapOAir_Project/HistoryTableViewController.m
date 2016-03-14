//
//  HistoryTableViewController.m
//  CheapOAir_Project
//
//  Created by Shreyas Makde on 12/5/15.
//  Copyright (c) 2015 UHCL. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "AppDelegate.h"
#import "TravelerInfo.h"
#import "historyTableViewCell.h"

@interface HistoryTableViewController ()

@end

@implementation HistoryTableViewController
@synthesize history, passedStr;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backimg.jpg"]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)sendHistString:(NSString *)value{
     NSLog(@"in hist sendString str");
    
    //  passedStr = value;
    
    NSLog(@"in hist passed str = %@", history);
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //  BOOL flag = [Book fetchBookDetail];
    
    // Fetch the devices from persistent data store
  /*  NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:_managedObjectContext];
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TravelerInfo"];
    [fetchRequest setEntity:<#(NSEntityDescription *)#>;*/
    
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* _managedObjectContext;
    _managedObjectContext = appDelegate.managedObjectContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TravelerInfo" inManagedObjectContext:_managedObjectContext];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //my code previous
    /* previous NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"duedate" ascending:YES];
     NSArray *sortDescriptors =[NSArray arrayWithObject:sortDescriptor];
     */ //previous
    
  /*  NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"source" ascending:YES];
     NSArray *sortDescriptors =[NSArray arrayWithObject:sortDescriptor];
     
     [fetchRequest setSortDescriptors:sortDescriptors];
     // Fetch the records and handle an error
      NSError *error;*/
     
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstname" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    //  NSArray *sortedArray = [sortDescriptors sortedArrayUsingSelector:@selector(compare:)];
    [request setSortDescriptors:sortDescriptors];
    // Fetch the records and handle an error
    
    
    NSError *error;
   
     self.history = [[_managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    
    
     NSLog(@"Record fetched");
    [self.tableView reloadData];
}
     


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.history.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"myCell";
    
    historyTableViewCell *cell = (historyTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSManagedObject *newtraveler = [self.history objectAtIndex:indexPath.row];
    
    NSString *firstNameLabelStr = [newtraveler valueForKey:@"firstname"];
    
    NSString *middleNameLabelStr= [newtraveler valueForKey:@"middlename"];
    
    NSString *lastNameLabelStr = [newtraveler valueForKey:@"lastname"];
    
    NSString *emailLabelStr= [newtraveler valueForKey:@"email"];
    
    NSString *sourceLabelStr= [newtraveler valueForKey:@"source"];
    
    NSString *destinationLabelStr= [newtraveler valueForKey:@"destination"];
    
    NSString *departDateLabelStr= [newtraveler valueForKey:@"departuredate"];
    
    NSString *returnDateLabelStr= [newtraveler valueForKey:@"returndate"];
    
    NSString *priceLabelStr= [newtraveler valueForKey:@"price"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *date = [formatter stringFromDate:[newtraveler valueForKey:@"departuredate"]];
    
    // [cell.detailTextLabel setText:date];
    
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    
    [formatter1 setDateFormat:@"yyyy-MM-dd"];
    
    NSString *date1 = [formatter stringFromDate:[newtraveler valueForKey:@"returndate"]];
    
    cell.firstNameLabel.text = [newtraveler valueForKey:@"firstname"];
    
    cell.middleNameLabel.text = middleNameLabelStr;
    
    cell.lastNameLabel.text = lastNameLabelStr;
    
    cell.emailLabel.text = emailLabelStr;
    
    cell.destinationLabel.text = [newtraveler valueForKey:@"destination"];
    
    cell.sourceLabel.text =[newtraveler valueForKey:@"source"];
    
    cell.departDateLabel.text = date;
    
    cell.returnDateLabel.text =date1;
    
    cell.priceLabel.text = priceLabelStr;
    
    NSLog(@"%@ %@ %@",firstNameLabelStr,middleNameLabelStr,lastNameLabelStr );
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
