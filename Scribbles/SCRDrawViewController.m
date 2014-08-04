//
//  SCRDrawViewController.m
//  Scribbles
//
//  Created by Arthur Boia on 8/4/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "SCRDrawViewController.h"
#import "SCRDrawView.h"
#import "SCRLineWidthSlider.h"

@interface SCRDrawViewController ()

@end

@implementation SCRDrawViewController
{
    UIButton * mainButton;
    UIView * lineWidthSlider;
    SCRLineWidthSlider* sliderView;
    UIButton * switchButton;
    UIButton * switchButton2;
}

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
    
    
    UIButton * orangeButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 450 , 26, 26)];
    orangeButton.backgroundColor = [UIColor colorWithRed:0.925f green:0.498f blue:0.133f alpha:1.0f];
    orangeButton.layer.cornerRadius = 13;
    [orangeButton addTarget:self action:@selector(colorButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:orangeButton];
    
    UIButton * redButton = [[UIButton alloc] initWithFrame:CGRectMake(117, 417 , 26, 26)];
    redButton.backgroundColor = [UIColor colorWithRed:0.988f green:0.075f blue:0.392f alpha:1.0f];
    redButton.layer.cornerRadius = 13;
    [redButton addTarget:self action:@selector(colorButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redButton];
    
    UIButton * purpleButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 400 , 26, 26)];
    purpleButton.backgroundColor = [UIColor colorWithRed:0.255f green:0.063f blue:0.569f alpha:1.0f];
    purpleButton.layer.cornerRadius = 13;
    [purpleButton addTarget:self action:@selector(colorButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:purpleButton];
    
    UIButton * blueButton = [[UIButton alloc] initWithFrame:CGRectMake(187, 417 , 26, 26)];
    blueButton.backgroundColor = [UIColor colorWithRed:0.051f green:0.329f blue:0.831f alpha:1.0f];
    blueButton.layer.cornerRadius = 13;
    [blueButton addTarget:self action:@selector(colorButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blueButton];
    
    UIButton * tealButton = [[UIButton alloc] initWithFrame:CGRectMake(210, 450 , 26, 26)];
    tealButton.backgroundColor = [UIColor colorWithRed:0.173f green:0.996f blue:0.867f alpha:1.0f];
    tealButton.layer.cornerRadius = 13;
    [tealButton addTarget:self action:@selector(colorButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tealButton];
    
    // This guy should be changed when another color button is clicked
    mainButton = [[UIButton alloc] initWithFrame:CGRectMake(145, 435 , 40, 40)];
    mainButton.backgroundColor = [UIColor colorWithRed:0.173f green:0.996f blue:0.867f alpha:1.0f];
    mainButton.layer.cornerRadius = 20;
    [self.view addSubview:mainButton];
    
    
    switchButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 508, 40, 40)];
    [switchButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIImage* scribbleButton = [UIImage imageNamed:@"scribble_button.png"];
    [switchButton setImage:scribbleButton forState:UIControlStateNormal];
    [self.view addSubview:switchButton];
    
    switchButton2 = [[UIButton alloc] initWithFrame:CGRectMake(270, 460, 40, 40)];
    [switchButton2 addTarget:self action:@selector(buttonClicked2) forControlEvents:UIControlEventTouchUpInside];
    UIImage* scribbleButton2 = [UIImage imageNamed:@"lines_button.png"];
    [switchButton2 setImage:scribbleButton2 forState:UIControlStateNormal];
    [self.view addSubview:switchButton2];

    
  
    UIButton * toggleButton2 = [[UIButton alloc] initWithFrame:CGRectMake(26, 521 , 8, 8)];
    toggleButton2.layer.cornerRadius = 4;
    toggleButton2.layer.borderColor = [[UIColor blackColor]CGColor];
    toggleButton2.layer.borderWidth = 1;
    [self.view addSubview:toggleButton2];
    
    UIButton * toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 510 , 30, 30)];
    // toggleButton.backgroundColor = [UIColor darkGrayColor];
    toggleButton.layer.cornerRadius = 15;
    [toggleButton addTarget:self action:@selector(toggleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    toggleButton.layer.borderColor = [[UIColor blackColor]CGColor];
    toggleButton.layer.borderWidth = 1;
    
    [self.view addSubview:toggleButton];
    
    sliderView = [[SCRLineWidthSlider alloc] initWithFrame:CGRectMake(5, 300, 50, 200)];
    [self.view addSubview: sliderView];
    sliderView.hidden = YES;
    
    
    
    

    
    
//    
//    
//    
//    NSArray * colors = @[
//                         [UIColor cyanColor],
//                         [UIColor magentaColor],
//                         [UIColor yellowColor],
//                         [UIColor blackColor]
//                         
//                         ];
//    for(UIColor * color in colors)
//    {
//        NSInteger index = [colors indexOfObject:color];
//        
//        UIButton * colorButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10 + (50 * index), 40, 40)];
//        colorButton.backgroundColor = color;
//        colorButton.layer.cornerRadius = 20;
//        [colorButton addTarget:self action:@selector(changeLineColor:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.view addSubview:colorButton];
//    }

}
-(void) buttonClicked
{
    
}
-(void) buttonClicked2
{
    
}
-(void)colorButtonClicked: (UIButton *) button
{
    SCRDrawView * view = (SCRDrawView *)self.view;
    view.lineColor = button.backgroundColor;
    mainButton.backgroundColor = button.backgroundColor;
    [view setNeedsDisplay];
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
    
}
-(void)toggleButtonClicked
{
    if ([sliderView isHidden])
    
    {
        sliderView.hidden = NO;
    }
    else
    {
        sliderView.hidden = YES;
    }
    
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
