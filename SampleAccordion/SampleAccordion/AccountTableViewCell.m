//
//  AccountTableViewCell.m
//  PharmEasy
//
//  Created by Shubhi Sharma on 08/02/17.
//  Copyright © 2017 pharmEasy. All rights reserved.
//

#import "AccountTableViewCell.h"

@implementation AccountTableViewCell
@synthesize cellTitle;

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)customizeCell:(NSString*)accountTitle accountSubtitle:(NSString*)accountSubTitle accountImage:(NSString*)accountImageName {
    
    cellTitle.text = accountTitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
