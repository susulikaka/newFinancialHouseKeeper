//
//  UIViewController+tap.m
//  FinancialHouseKeeper
//
//  Created by rimi on 15/9/30.
//  Copyright (c) 2015年 lili. All rights reserved.
//

#import "UIViewController+tap.h"

@implementation UIViewController (tap)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder]touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesCancelled:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self nextResponder] touchesMoved:touches withEvent:event];
}

@end
