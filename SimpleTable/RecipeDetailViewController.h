//
//  RecipeDetailViewController.h
//  SimpleTable
//
//  Created by ccc on 2015/10/29.
//  Copyright © 2015年 guanglin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface RecipeDetailViewController : UIViewController
//@property (nonatomic,weak) IBOutlet UILabel *recipeLabel;
//@property (nonatomic,weak) NSString *recipeName;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;
@property (nonatomic,strong) Recipe *recipe;


@end
