//
//  UIFont+ChangeSystemFont.m
//  AirBrush
//
//  Created by albus on 2017/10/9.
//  Copyright © 2017年 Hippo. All rights reserved.
//

#import "UIFont+ChangeSystemFont.h"
#import <objc/runtime.h>

@implementation UIFont (ChangeSystemFont)

+(void)load
{
    Method newMethod = class_getClassMethod([self class], @selector(changedSystemFontOfSize:));
    Method oldMethod = class_getClassMethod([self class], @selector(systemFontOfSize:));
    
    //exchange method
    method_exchangeImplementations(newMethod, oldMethod);
}

+ (UIFont *)changedSystemFontOfSize:(CGFloat)fontSize;
{
    // Usage: replace the font family name with what you want, for example, you can replace font family name with "Arial Rounded MT Bold" like the following codes.
    NSString* newSystemFontName = @"Arial Rounded MT Bold";
    return [UIFont fontWithName:newSystemFontName size:fontSize];
}

@end
