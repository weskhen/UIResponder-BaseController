//
//  UIResponder+BaseController.h
//  ResponderBaseController
//
//  Created by wujian on 6/27/16.
//  Copyright © 2016 wesk痕. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIViewController;

@interface UIResponder (BaseController)

@property (nonatomic, weak)  UIViewController *baseController;

@end
