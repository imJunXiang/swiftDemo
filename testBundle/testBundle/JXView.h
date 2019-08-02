//
//  JXView.h
//  image
//
//  Created by 俊祥 on 2019/8/2.
//  Copyright © 2019 俊祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
+(instancetype)customerView;
@end

NS_ASSUME_NONNULL_END
