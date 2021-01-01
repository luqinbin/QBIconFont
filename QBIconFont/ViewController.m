//
//  ViewController.m
//  QBIconFont
//
//  Created by 覃斌 卢    on 2020/3/10.
//  Copyright © 2020 覃斌 卢   . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"familyName:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"  fontName:'%@'",fontName);
        }
        NSLog(@"***********");
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 150, 150)];
    NSString *fontClassName = @"all";
    imageView.image = [QBIconFont iconWithFontClassName:fontClassName fontSize:50 color:UIColor.blueColor inset:UIEdgeInsetsMake(0, 0, 0, 0) backgroundColor:[UIColor grayColor]];
    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.backgroundColor = UIColor.brownColor;
}


@end
