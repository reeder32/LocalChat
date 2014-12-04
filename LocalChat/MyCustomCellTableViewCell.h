//
//  MyCustomCellTableViewCell.h
//  LocalChat
//
//  Created by Nick Reeder on 12/3/14.
//  Copyright (c) 2014 Nick Reeder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *myPrototypeCell;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end
