//
//  ViewController.m
//  CustomisingThePullToAction
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
// Image used courtousy of http://www.visualpharm.com via http://www.iconarchive.com

#import "ViewController.h"

#import <ShinobiEssentials/ShinobiEssentials.h>
#import "CustomVisualizer.h"
#import "CustomStatusView.h"

@interface ViewController () <SEssentialsPullToActionDelegate>

@property UIScrollView *scrollView;
@property SEssentialsPullToAction *pullToAction;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [SEssentials setLicenseKey:@""]; // Trial Users - Add license key here

    /* Create a scroll view. */
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.contentSize = self.scrollView.frame.size;
    [self.view addSubview:self.scrollView];
    
    /* Put some content on the scroll view - this makes it easier for us to see the scroll view scrolling as we are trying to debug. */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.scrollView.bounds), CGRectGetWidth(self.scrollView.bounds), 50)];
    label.text = @"Some content..";
    label.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label];
    
    /* Initialize our Pull to Action. */
    self.pullToAction = [[SEssentialsPullToAction alloc] initWithScrollView:self.scrollView];
    self.pullToAction.delegate = self;
    [self.view addSubview:self.pullToAction];
    
    /* Give it a specific frame & position as our custom visualizer won't be resizing it. */
    self.pullToAction.frame = CGRectMake(0, 0, 50, 50);
    self.pullToAction.center = CGPointMake(CGRectGetMidX(self.view.bounds), 200);
    
    /* Set our custom elements. */
    self.pullToAction.statusView = [[CustomStatusView alloc] initWithFrame:self.pullToAction.bounds];
    self.pullToAction.visualizer = [CustomVisualizer new];
    
    /* Make sure it is hidden initially. */
    self.pullToAction.hidden = YES;
    
    /* Make our PTA clear, so the status view sub-view is the only content. */
    self.pullToAction.backgroundColor = [UIColor clearColor];
}

-(void)pullToActionTriggeredAction:(SEssentialsPullToAction *)pullToAction {
    /* Simulate a mock action that takes three seconds on the background thread. */
    [self.pullToAction performSelector:@selector(actionCompleted) withObject:nil afterDelay:3];
}

@end



