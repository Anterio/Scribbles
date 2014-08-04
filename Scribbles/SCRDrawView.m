//  SCRDrawView.m
//  Scribbles
//
//  Created by Arthur Boia on 8/4/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.

#import "SCRDrawView.h"

@implementation SCRDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)   {
        
        self.scribbles = [@[] mutableCopy];
        self.lineColor = [UIColor darkGrayColor];
        self.backgroundColor = [UIColor whiteColor];
        
                }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    //this grabs out context layer to draw on
    CGContextRef context = UIGraphicsGetCurrentContext();
    //this sets stroke or fill colors that follow
    [[UIColor whiteColor] set];
    [self.lineColor set];
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    for (NSDictionary * scribble in self.scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"] intValue]);
        NSArray * points = (NSArray *) scribble[@"points"];
        UIColor * lineColor = scribble [@"color"]; [lineColor set];
        
        if(points.count > 0)
        {
            CGPoint startPoint = [points [0] CGPointValue];
            CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        }
        
        for (NSValue * pointVal in points)
        {
            CGPoint point = [pointVal CGPointValue];
            CGContextAddLineToPoint(context, point.x, point.y);
        }
            CGContextStrokePath(context);
    }

 
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int random = arc4random_uniform(20) + 5;
   
    
    self.currentScribble = [@{
                              @"color":self.lineColor,
                              @"points": [@[] mutableCopy],
                              @"width": @(random),
                              }mutableCopy];
    [self.scribbles addObject:self.currentScribble];
    [self scribbleWithTouches:touches];
    
}
-(void)touchesMoved:(NSSet *) touches withEvent:(UIEvent *)event
{
    [self scribbleWithTouches:touches];
}
-(void)scribbleWithTouches:(NSSet *) touches
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        [self.currentScribble [@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
    [self setNeedsDisplay];
}

@end
