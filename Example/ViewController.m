//
//  ViewController.m
//  WCSDateRange Example
//
//  Created by Aaron Wright on 6/24/18.
//  Copyright © 2018 Wrights Creative Services, L.L.C. All rights reserved.
//
//  http://www.wrightscsapps.com
//

#import "WCSDateRange.h"
#import "ViewController.h"

@interface ViewController () <UITabBarDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * tableData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WCSDateRange * range = [WCSDateRange new];
    
    self.tableData = [NSMutableArray new];
    
    NSMutableArray * sectionData = [NSMutableArray new];
    /// Date Range String
    {
        range.dateRange = WCSDateRangeTypeToday;
        [sectionData addObject:@{@"title":@"Today",@"value":range.rangeString}];
        
        range.dateRange = WCSDateRangeTypeWeek;
        [sectionData addObject:@{@"title":@"This Week",@"value":range.rangeString}];
        
        range.dateRange = WCSDateRangeTypeMonth;
        [sectionData addObject:@{@"title":@"This Month",@"value":range.rangeString}];
    }
    [self.tableData addObject:@{@"section":@"Date Range String", @"rows":sectionData}];
    
    sectionData = [NSMutableArray new];
    /// Date Range Format
    {
        range.dateRange = WCSDateRangeTypeMonth;
        [sectionData addObject:@{@"title":@"Default",@"value":range.rangeString}];
        
        /*!
         * Format should be set first, before dateRange */
        
        range.format = WCSDateRangeFormatSimple;
        range.dateRange = WCSDateRangeTypeMonth;
        [sectionData addObject:@{@"title":@"Simple",@"value":range.rangeString}];
        
        range.format = WCSDateRangeFormatFull;
        range.dateRange = WCSDateRangeTypeMonth;
        [sectionData addObject:@{@"title":@"Full",@"value":range.rangeString}];
        
        range.format = WCSDateRangeFormatTimeOnly;
        range.dateRange = WCSDateRangeTypeMonth;
        [sectionData addObject:@{@"title":@"Time Only",@"value":range.rangeString}];
    }
    [self.tableData addObject:@{@"section":@"Date Range Format", @"rows":sectionData}];
    
    sectionData = [NSMutableArray new];
    /// Date Range Read-Only
    {
        range.dateRange = WCSDateRangeTypeMonth;
        [sectionData addObject:@{@"title":@"From",@"value":[NSString stringWithFormat:@"%@", range.from]}];
        [sectionData addObject:@{@"title":@"To",@"value":[NSString stringWithFormat:@"%@", range.to]}];
    }
    [self.tableData addObject:@{@"section":@"Read-Only (Month NSDate example)", @"rows":sectionData}];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tableData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData[section][@"rows"] count];
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.tableData[section][@"section"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary * cellData = self.tableData[indexPath.section][@"rows"][indexPath.row];
    
    cell.textLabel.text = cellData[@"title"];
    cell.detailTextLabel.text = cellData[@"value"];
    
    return cell;
}

@end
