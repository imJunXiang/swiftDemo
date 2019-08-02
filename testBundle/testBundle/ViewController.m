//
//  ViewController.m
//  testBundle
//
//  Created by 俊祥 on 2019/8/2.
//  Copyright © 2019 俊祥. All rights reserved.
//

#import "ViewController.h"
#import "JXView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JXView *view = [JXView customerView];
    view.center = self.view.center;
   
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"junxiang" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
//    /Users/junxiang/Desktop/练习/testBundle/testBundle/image.bundle/Contents/Resources/avatar_default_big@2x.png
    NSString *imgPath = [bundle pathForResource:@"avatar_default_big@2x" ofType:@"png"];
    
//    view.imageV.image = [UIImage imageNamed:@"image.bundle/Contents/Resources/avatar_default_big.png"];
    view.imageV.image = [UIImage imageWithContentsOfFile:imgPath];
    [self.view addSubview:view];
}


@end
