//
//  AccountsSectionHeaderView.m
//  PharmEasy
//
//  Created by Shubhi Sharma on 08/02/17.
//  Copyright © 2017 pharmEasy. All rights reserved.
//

#import "AccountsSectionHeaderView.h"

@implementation AccountsSectionHeaderView

@synthesize sectionTitleLbl;
@synthesize sectionArrowImgView;

-(void)setSectionDetails:(NSMutableDictionary*)sectionDetails{

    sectionTitleLbl.text = [sectionDetails objectForKey:@"itemName"];
}

@end
