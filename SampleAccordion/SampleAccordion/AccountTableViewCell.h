//
//  AccountTableViewCell.h
//  PharmEasy
//
//  Created by Shubhi Sharma on 08/02/17.
//  Copyright © 2017 pharmEasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;

-(void)customizeCell:(NSString*)accountTitle accountSubtitle:(NSString*)accountSubTitle accountImage:(NSString*)accountImageName;
@end
