//
//  CustomVisualizer.m
//  CustomizingThePullToAction
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

#import "CustomVisualizer.h"

#import <ShinobiEssentials/SEssentialsPullToAction.h>
#import "CustomStatusView.h"

@implementation CustomVisualizer

-(void)pullToAction:(SEssentialsPullToAction *)pullToAction layoutStatusView:(UIView<SEssentialsPullToActionStatusView> *)statusView {
}

-(void)pullToAction:(SEssentialsPullToAction *)pullToAction pulledAmountChanged:(CGFloat)pulledAmount {
    /* Forward changes in pull amount to the status view, allowing it to update visually to show the user how close they
     are to triggering their action. */
    [pullToAction.statusView updateForPulledAmountChanged:pulledAmount pullThreshold:pullToAction.pullThreshold];
}

-(void)pullToActionActionCompleted:(SEssentialsPullToAction *)pullToAction {
    CustomStatusView *statusView = (CustomStatusView *)pullToAction.statusView;
    [statusView stopSpinning];
    
    /* Let the Pull to Action control know that we are done visually transitioning (such as animations) from
     Executing -> Idle, so that the control can change it's state and begin to execute the action.*/
    [pullToAction resetToIdle];
}

-(void)pullToActionTriggeredAction:(SEssentialsPullToAction *)pullToAction {
    /* Let the Pull to Action control know that we are done visually transitioning (such as animations) from 
     Triggered -> Executing, so that the control can change it's state and begin to execute the action.*/
    [pullToAction executeAction];
    
    CustomStatusView *statusView = (CustomStatusView *)pullToAction.statusView;
    [statusView startSpinning];
}

-(void)pullToAction:(SEssentialsPullToAction *)pullToAction didChangeFromState:(SEssentialsPullToActionState)oldState toState:(SEssentialsPullToActionState)newState {
    /* Hide the pull to action in its idle state. */
    switch (newState) {
        case SEssentialsPullToActionStateIdle:
            pullToAction.hidden = YES;
            break;
            
        default:
            pullToAction.hidden = NO;
            break;
    }
}

@end