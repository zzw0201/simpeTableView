//
//  AboutViewController.m
//  SimpleTable
//
//  Created by ccc on 2015/10/29.
//  Copyright © 2015年 guanglin. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"aoubt.html" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *reqest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:reqest];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
