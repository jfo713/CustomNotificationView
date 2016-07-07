//
//  ViewController.m
//  CustomNotificationView
//
//  Created by James O'Connor on 6/27/16.
//  Copyright © 2016 James O'Connor. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    UIVisualEffectView *effectView;
    effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    
    notificationView = [[NotificationView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*-1, self.view.frame.size.width, self.view.frame.size.height)];
    notificationView.backgroundColor = [UIColor greenColor];
    notificationView.alpha = .5;
    [notificationView addSubview:effectView];
    
    
    [self.view addSubview:notificationView];
    
    UISwipeGestureRecognizer *notificationViewDownSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedDown:)];
    notificationViewDownSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:notificationViewDownSwipe];

   UISwipeGestureRecognizer *notificationViewUpSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget: self action:@selector(swipedUp:)];
    notificationViewUpSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [self.view addGestureRecognizer:notificationViewUpSwipe];
    
    
   // Do any additional setup after loading the view, typically from a nib.
    
}

-(void) swipedDown: (UISwipeGestureRecognizer *) animator {
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:0.6f options:0 animations:^{notificationView.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2); [self.view layoutIfNeeded];} completion:nil];
}

-(void) swipedUp: (UISwipeGestureRecognizer *) animator {
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:.7 initialSpringVelocity:0.6f options:0 animations:^{notificationView.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height*-.5); [self.view layoutIfNeeded];} completion:nil];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
