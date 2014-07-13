//
//  PRCTestViewController.m
//  Management
//
//  Created by sse-23 on 14-7-13.
//  Copyright (c) 2014年 exec. All rights reserved.
//

#import "PRCTestViewController.h"

@interface PRCTestViewController ()

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation PRCTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] initWithObjects:@"aaa",@"bbb", nil];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UITableView *tv = [[UITableView alloc] init];
    
    [self.view addSubview:tv];
    tv.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tv.backgroundColor = [UIColor redColor];
    
    tv.dataSource = self;
    tv.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    
    l.text = [self.data objectAtIndex:indexPath.row];
    
    l.backgroundColor = [UIColor greenColor];
    
    [cell addSubview:l];
    cell.backgroundColor = [UIColor grayColor];
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
