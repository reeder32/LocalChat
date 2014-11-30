//
//  ViewController.h
//  LocalChat
//
//  Created by Nick Reeder on 11/20/14.
//  Copyright (c) 2014 Nick Reeder. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *myTextView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextView *myChatViewArea;
@property (weak, nonatomic) IBOutlet UITextField *textInput;

@end

