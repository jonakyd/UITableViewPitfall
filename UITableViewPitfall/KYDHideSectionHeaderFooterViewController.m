//
//  KYDHideSectionHeaderFooterViewController.m
//  UITableViewPitfall
//
//  Created by Jonathan Dang on 2016/3/1.
//  Copyright © 2016年 Kingyao Dang. All rights reserved.
//

#import "KYDHideSectionHeaderFooterViewController.h"

@interface KYDHideSectionHeaderFooterViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KYDHideSectionHeaderFooterViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Make cell/sectionHeader/sectionFooter support autolayout
  self.tableView.estimatedRowHeight = 80.0;
  self.tableView.estimatedSectionHeaderHeight = 80.0;
  self.tableView.estimatedSectionFooterHeight = 80.0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"KYDReuseIdentifier"] ?: [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KYDReuseIdentifier"];

  tableViewCell.textLabel.text = @"Dummy cell";
  return tableViewCell;
}

#pragma mark - UITableViewDelegate

// Required, return height zero
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  return 0;
}

// Required, return height zero
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  return 0;
}

@end