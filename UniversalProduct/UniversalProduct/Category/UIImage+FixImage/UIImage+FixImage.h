//
//  UIImage+FixImage.h
//  GLPFinance
//
//  Created by 鲍利成 on 2016/12/16.
//  Copyright © 2016年 鲍利成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FixImage)
- (UIImage *)fixOrientationWithSize:(CGSize)size;

-(UIImage *)scaledToFillSize:(CGSize)size;
@end
