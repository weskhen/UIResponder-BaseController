//
//  UIResponder+BaseController.m
//  ResponderBaseController
//
//  Created by wujian on 6/27/16.
//  Copyright © 2016 wesk痕. All rights reserved.
//

#import "UIResponder+BaseController.h"
#import <objc/runtime.h>

@implementation UIResponder (BaseController)

- (void)setBaseController:(UIViewController *)baseController
{
    objc_setAssociatedObject(self, @selector(baseController), baseController, OBJC_ASSOCIATION_ASSIGN);
}

- (UIViewController *)baseController
{
    id curController = objc_getAssociatedObject(self, @selector(baseController));
    if (curController == nil) {
        curController = self;
        while (![curController isKindOfClass:[UIViewController class]]) {
            if ([curController nextResponder]) {
                curController = [curController nextResponder];
            }
            else
            {
                curController = nil;
                break;
            }
        }
    }
    return curController;
}

@end
