//
//  ViewController.h
//  SimpleTable
//
//  Created by ccc on 2015/10/26.
//  Copyright © 2015年 guanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableDictionary* recipeChecked;


@end

