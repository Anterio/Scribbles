//
//  SCRLineWidthSlider.m
//  Scribbles
//
//  Created by Arthur Boia on 8/4/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "SCRLineWidthSlider.h"


@implementation SCRLineWidthSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
     // self.backgroundColor = [UIColor cyanColor];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(25, 0, 1, 200)];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:lineView];
        
        UIButton * largeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 0 , 30, 30)];
        largeButton.backgroundColor = [UIColor darkGrayColor];
        largeButton.layer.cornerRadius = 15;
        [self addSubview:largeButton];
        
        
        
       
            }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
