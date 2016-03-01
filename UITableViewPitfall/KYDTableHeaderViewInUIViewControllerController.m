//
//  KYDTableHeaderViewInUIViewControllerController.m
//  UITableViewPitfall
//
//  Created by Jonathan Dang on 2016/3/1.
//  Copyright © 2016年 Kingyao Dang. All rights reserved.
//

#import <PureLayout/PureLayout.h>
#import "KYDTableHeaderViewInUIViewControllerController.h"

@interface KYDTableHeaderViewInUIViewControllerController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KYDTableHeaderViewInUIViewControllerController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Init table header view
  // Wrapper to rely on margin padding
  UIView *tableHeaderView = [UIView newAutoLayoutView];
  UILabel *label = [UILabel newAutoLayoutView];

  tableHeaderView.backgroundColor = [UIColor greenColor];
  label.numberOfLines = 0;
  label.backgroundColor = [UIColor redColor];
  label.text = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  // Add subview
  [tableHeaderView addSubview:label];
  self.tableView.tableHeaderView = tableHeaderView;

  // Add constraint after add subview
  // Pin label to wrapper view
  [label autoPinEdgesToSuperviewMargins];

  // Optional, Pin wrapper view to super view top for probably have navigation bar and which will hide table header view
  [tableHeaderView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];

  // Required, to let label text auto linebreak
  [tableHeaderView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.tableView];

  // Re-set table header view
  [tableHeaderView setNeedsLayout];
  [tableHeaderView layoutIfNeeded];
  self.tableView.tableHeaderView = tableHeaderView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"KYDReuseIdentifier"] ?: [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KYDReuseIdentifier"];

  tableViewCell.textLabel.text = @"Dummy cell";
  return tableViewCell;
}

@end