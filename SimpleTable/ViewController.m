//
//  ViewController.m
//  SimpleTable
//
//  Created by ccc on 2015/10/26.
//  Copyright © 2015年 guanglin. All rights reserved.
//

#import "ViewController.h"
#import "simpleTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray *recipes;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    recipes = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",nil];
    //為了避免表格的內容覆蓋到狀態欄
    [self.tableView setContentInset:UIEdgeInsetsMake(20,
                                                    self.tableView.contentInset.left,self.tableView.contentInset.bottom,self.tableView.contentInset.right)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [recipes count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    simpleTableViewCell *cell = (simpleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)  {
//        cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault
//                                       reuseIdentifier:simpleTableIdentifier];
//    }
    if(cell == nil) {
        cell = [[simpleTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
//    cell.textLabel.text = recipes[indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"66.jpg"];
    cell.nameLabel.text = [recipes objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"66.jpg"];

    return cell;

}


@end
