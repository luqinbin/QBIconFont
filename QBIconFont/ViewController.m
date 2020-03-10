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
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 60, 60)];
    imageView.image = [QBIconFont iconWithUnicodeName:@"\U0000e6eb" fontSize:40 color:UIColor.blueColor];
    [self.view addSubview:imageView];
}


@end
