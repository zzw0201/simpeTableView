//
//  ViewController.m
//  SimpleTable
//
//  Created by ccc on 2015/10/26.
//  Copyright © 2015年 guanglin. All rights reserved.
// 
//TODO: test
//FIXME: fix whther the checkmark show or not using NSMutableDictionary data structure to record.
//???: test
//!!!!: test
#import "ViewController.h"
#import "simpleTableViewCell.h"
#import "RecipeDetailViewController.h"
#import "Recipe.h"
#import "MySearchResultsController.h"


@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *recipes;
    ViewController * __weak weakSelf;
    NSArray *searchResults;
    
  
}

- (void)viewDidLoad {
    [super viewDidLoad];

    weakSelf = self;

//    recipes = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",nil];

//    NSString *path = [[NSBundle mainBundle] pathForResource:@"recipes" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//    recipes = [dict objectForKey:@"Name"];

//改成 Recipe interface 架構 recipes 資料來源
    Recipe *recipe1  = [Recipe new];
    recipe1.name = @"Egg Benedict";
    recipe1.prepTime = @"30 min";
    recipe1.image = @"66.jpg";
    recipe1.ingredients = [NSArray arrayWithObjects:@"2 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe2 = [Recipe new];
    recipe2.name = @"Mushroom Risotto";
    recipe2.prepTime = @"30 min";
    recipe2.image = @"66.jpg";
    recipe2.ingredients = [NSArray arrayWithObjects:@"3 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe * recipe3 = [Recipe new];
    recipe3.name = @"Full BreakFast";
    recipe3.prepTime = @"20 min";
    recipe3.image = @"66.jpg";
    recipe3.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe4 = [ Recipe new];
    recipe4.name = @"Hambuger";
    recipe4.prepTime = @"30 min";
    recipe4.image = @"66.jpg";
    recipe4.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe5 = [ Recipe new];
    recipe5.name = @"5";
    recipe5.prepTime = @"30 min";
    recipe5.image = @"66.jpg";
    recipe5.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe6 = [ Recipe new];
    recipe6.name = @"6";
    recipe6.prepTime = @"30 min";
    recipe6.image = @"66.jpg";
    recipe6.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe7 = [ Recipe new];
    recipe7.name = @"7";
    recipe7.prepTime = @"30 min";
    recipe7.image = @"66.jpg";
    recipe7.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe8 = [ Recipe new];
    recipe8.name = @"8";
    recipe8.prepTime = @"30 min";
    recipe8.image = @"66.jpg";
    recipe8.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe9 = [ Recipe new];
    recipe9.name = @"9";
    recipe9.prepTime = @"30 min";
    recipe9.image = @"66.jpg";
    recipe9.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe10 = [ Recipe new];
    recipe10.name = @"10";
    recipe10.prepTime = @"30 min";
    recipe10.image = @"66.jpg";
    recipe10.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];


    Recipe *recipe11 = [ Recipe new];
    recipe11.name = @"11";
    recipe11.prepTime = @"30 min";
    recipe11.image = @"66.jpg";
    recipe11.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];


    Recipe *recipe12 = [ Recipe new];
    recipe12.name = @"12";
    recipe12.prepTime = @"30 min";
    recipe12.image = @"66.jpg";
    recipe12.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    Recipe *recipe13 = [ Recipe new];
    recipe13.name = @"13";
    recipe13.prepTime = @"30 min";
    recipe13.image = @"66.jpg";
    recipe13.ingredients = [NSArray arrayWithObjects:@"4 fresh English muffins",@"4 eggs",@"4 rashers of back bacon",@"2 egg yolks", nil];

    recipes  = [NSMutableArray new];
    [recipes addObject: recipe1];
    [recipes addObject: recipe2];
    [recipes addObject: recipe3];
    [recipes addObject: recipe4];
    [recipes addObject: recipe5];
    [recipes addObject: recipe6];
    [recipes addObject: recipe7];
    [recipes addObject: recipe8];
    [recipes addObject: recipe9];
    [recipes addObject: recipe10];
    [recipes addObject: recipe11];
    [recipes addObject: recipe12];
    [recipes addObject: recipe13];

    






    //init showcheckmark dictionary
    self.recipeChecked = [[NSMutableDictionary alloc] init];



    //為了避免表格的內容覆蓋到狀態欄
    [self.tableView setContentInset:UIEdgeInsetsMake(20,
                                                    self.tableView.contentInset.left,self.tableView.contentInset.bottom,self.tableView.contentInset.right)];

    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController.searchBar.delegate = self;
    [self.searchController.searchBar sizeToFit];


    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;

    

    




}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark === UITableViewDataSource Delegate Methods ===
#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.searchController.active){
        return searchResults.count;
    }else{
        return [recipes count];
    }



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
    /*
    cell.nameLabel.text = [recipes objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"66.jpg"];
     */
    Recipe *recipe;
    if(self.searchController.active){
         recipe= [searchResults objectAtIndex:indexPath.row];
    }else{
         recipe = [recipes objectAtIndex:indexPath.row];
    }

    cell.nameLabel.text = recipe.name;
    cell.thumbnailImageView.image = [UIImage imageNamed:recipe.image];
    cell.prepTimeLabel.text = recipe.prepTime;


    //更新打勾圖示是否有勾選
//    if([self.recipeChecked valueForKey:[NSString stringWithFormat:@"%ld",indexPath.row]]){
//        cell.accessoryType  = UITableViewCellAccessoryCheckmark;
//    }else{
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
    if([self.recipeChecked valueForKey:recipe.name]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;

}


- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    return indexPath;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Recipe *recipe  = [recipes objectAtIndex:indexPath.row];

    NSString* selectRecipe = recipe.name;
//    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:selectRecipe delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [messageAlert show];

    //取消tableview本身選擇時顯示的灰底顏色,改成白色,但選擇一瞬間還是有灰底顏色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIAlertController* alertMessage = [UIAlertController alertControllerWithTitle:@"My Alert" message:selectRecipe preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){

        [weakSelf dismissViewControllerAnimated:YES completion:nil];

    }];
    [alertMessage addAction:defaultAction];
//[self.view.window.rootViewController presentViewController:alertMessage animated:YES completion:nil];
    [self presentViewController:alertMessage  animated:YES completion:nil];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath: indexPath];
    //顯示打勾的提示
    if(cell.accessoryType == UITableViewCellAccessoryNone){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        [self.recipeChecked setObject:[NSNumber numberWithBool:YES] forKey: [NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        [self.recipeChecked setObject:[NSNumber numberWithBool:YES] forKey:recipe.name];
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
//        [self.recipeChecked removeObjectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row ]];
        [self.recipeChecked removeObjectForKey: recipe.name];
    }



}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [recipes removeObjectAtIndex:indexPath.row];
//    [self.recipeChecked removeObjectForKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
    Recipe* recipe = [recipes objectAtIndex:indexPath.row];
    [self.recipeChecked removeObjectForKey:recipe.name];
    [tableView reloadData];

}
#pragma mark - Notifies the controller that a segue is about to be performed.
- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender{
    if([segue.identifier isEqualToString:@"showRecipeDetail"]){

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RecipeDetailViewController *destViewController =
        segue.destinationViewController;
        Recipe *recipe = [recipes objectAtIndex:indexPath.row];

        destViewController.recipe = recipe;


    }


}
#pragma mark - set the height of the Row for the tableView
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 71;
}
#pragma mark -
#pragma mark === UISearchResultsUpdating ===
#pragma mark -
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    [self filterContentForSearchText:searchController.searchBar.text scope:nil];
    [self.tableView reloadData];
}

-(void) filterContentForSearchText:(NSString *) searchText scope:(NSString *) scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@",searchText];
   searchResults = [recipes copy];
   searchResults = [searchResults filteredArrayUsingPredicate:resultPredicate];

}



@end
