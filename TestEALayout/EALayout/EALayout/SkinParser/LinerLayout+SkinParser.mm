//
//  LinerLayout+SkinParser.mm
//  EALayout
//
//  Created by easycoding on 15/7/17.
//  Copyright (c) 2015年 www.easycoding.top. All rights reserved.
//

#import "LinerLayout+SkinParser.h"

@implementation LinerLayout(SkinParser)

DefineParseFun(subviewsLayout)
{
    NSInteger mask;
    setLayoutStyle(self->style[0], (NSString*)value[sp_s], &mask);
    self->style[0].asstag = [value[sp_asstag] intValue];
    self->style[0].align = [value[sp_align] boolValue];
}

DefineParseFun(sizeMode)
{
    if (isNSNumber(value))
    {
        self->sizeMode = (LayoutSizeMode)[value integerValue];
    }
    else if isNSString(value)
    {
        NSString* str = value;
        NSArray* array = [str componentsSeparatedByString:@","];
        self->sizeMode = ESizeFixed;
        for(NSString* s in array)
        {
            if([s isEqualToString:@"w"])
            {
                self->sizeMode = (LayoutSizeMode)(self->sizeMode | ESizeFillWidth);
            }
            else if([s isEqualToString:@"h"])
            {
                self->sizeMode = (LayoutSizeMode)(self->sizeMode | ESizeFillHeight);
            }
        }
    }
}

@end
