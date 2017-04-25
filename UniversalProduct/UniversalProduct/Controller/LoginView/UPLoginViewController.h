//
//  UPLoginViewController.h
//  UniversalProduct
//
//  Created by 鲍利成 on 2017/4/24.
//  Copyright © 2017年 鲍利成. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UPLoginViewProtocol <NSObject>
-(void)loginSuccess;
@end
@interface UPLoginViewController : UIViewController
@property(nonatomic, assign) id<UPLoginViewProtocol> delegate;
@end
