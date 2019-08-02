//
//  JXView.m
//  image
//
//  Created by 俊祥 on 2019/8/2.
//  Copyright © 2019 俊祥. All rights reserved.
//

#import "JXView.h"

@implementation JXView
+(instancetype)customerView {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"junxiang" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    return [[bundle loadNibNamed:@"JXView" owner:self options:nil] firstObject];
}
@end
