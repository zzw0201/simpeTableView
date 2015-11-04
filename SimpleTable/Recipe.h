//
//  Recipe.h
//  SimpleTable
//
//  Created by ccc on 2015/10/30.
//  Copyright © 2015年 guanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *prepTime;
@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) NSArray *ingredients;


@end
