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
    BOOL recipeChecked[11];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    recipes = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",nil];
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
    //更新打勾圖示是否有勾選
    if(recipeChecked[indexPath.row]){
        cell.accessoryType =UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType =UITableViewCellAccessoryNone;
    }


    return cell;

}


- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    return indexPath;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString* selectRecipe = [recipes  objectAtIndex:indexPath.row ];
//    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:selectRecipe delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [messageAlert show];

    //取消tableview本身選擇時顯示的灰底顏色,改成白色,但選擇一瞬間還是有灰底顏色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIAlertController* alertMessage = [UIAlertController alertControllerWithTitle:@"My Alert" message:selectRecipe preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){

    }];
    [alertMessage addAction:defaultAction];
    [self presentViewController:alertMessage  animated:YES completion:nil];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    //顯示打勾的提示
    if(recipeChecked[indexPath.row]){
         cell.accessoryType = UITableViewCellAccessoryNone;
        //取消哪一行顯示打勾
        recipeChecked[indexPath.row] = NO;
        
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //記入哪一行顯示打勾
        recipeChecked[indexPath.row] = YES;
    }





}



@end
