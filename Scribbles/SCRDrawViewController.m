//
//  SCRDrawViewController.m
//  Scribbles
//
//  Created by Arthur Boia on 8/4/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "SCRDrawViewController.h"
#import "SCRDrawView.h"

@interface SCRDrawViewController ()

@end

@implementation SCRDrawViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)   {
        
        self.view= [[SCRDrawView alloc] initWithFrame:self.view.frame];
        
        
                }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    NSArray * colors = @[
                         [UIColor cyanColor],
                         [UIColor magentaColor],
                         [UIColor yellowColor],
                         [UIColor blackColor]
                         
                         ];
    for(UIColor * color in colors)
    {
        NSInteger index = [colors indexOfObject:color];
        
        UIButton * colorButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10 + (50 * index), 40, 40)];
        colorButton.backgroundColor = color;
        colorButton.layer.cornerRadius = 20;
        [colorButton addTarget:self action:@selector(changeLineColor:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:colorButton];
    }
    
    
  
}

-(void)changeLineColor: (UIButton *) button
{
    SCRDrawView * view = (SCRDrawView *)self.view;
    view.lineColor = button.backgroundColor;
    [view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL) prefersStatusBarHidden {return YES;}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
