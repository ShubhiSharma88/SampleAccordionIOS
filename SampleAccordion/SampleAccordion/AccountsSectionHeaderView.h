//
//  AccountsSectionHeaderView.h
//  PharmEasy
//
//  Created by Shubhi Sharma on 08/02/17.
//  Copyright © 2017 pharmEasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountsSectionHeaderView : UITableViewHeaderFooterView
-(void)setSectionDetails:(NSMutableDictionary*)sectionDetails;
@property (weak, nonatomic) IBOutlet UILabel *sectionTitleLbl;

@property (weak, nonatomic) IBOutlet UIImageView *sectionArrowImgView;

@end
