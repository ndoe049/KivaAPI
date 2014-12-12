//
//  MasterViewController.m
//  KivaAPI
//
//  Created by Nathan Doe on 12/7/14.
//  Copyright (c) 2014 Nathaniel Doe. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "KivaAPI.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_objects = [[NSMutableArray alloc] init];
	
//	KivaLoanRequest *request = [KivaLoanRequest newestLoans];
//	[KivaRequestManager sendLoanRequest:request withCompletionHandler:^(BOOL success, NSArray *loans, NSError *error) {
//		if (success) {
//			[_objects removeAllObjects];
//			for (KivaLoan *loan in loans) {
//				[_objects addObject:loan];
//				NSLog(@"%@", loan);
//			}
//			
//			[self.tableView reloadData];
//		} else {
//			NSLog(@"%@", error);
//		}
//	}];
	
	KivaLoanRequest *request = [KivaLoanRequest multipleLoanDetails:[NSArray arrayWithObjects:@"2930", @"2931", nil]];
	[KivaRequestManager sendLoanRequest:request withCompletionHandler:^(BOOL success, NSArray *loans, NSError *error) {
	
	}];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    [[segue destinationViewController] setDetailItem:object];
	}
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	KivaLoan *object = self.objects[indexPath.row];
	cell.textLabel.text = [object name];
	cell.detailTextLabel.text = [[object loanAmount] stringValue];
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	    [self.objects removeObjectAtIndex:indexPath.row];
	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}

@end
