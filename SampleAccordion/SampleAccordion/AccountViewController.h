//
//  AccountViewController.h
//  PharmEasy
//
//  Created by Shubhi Sharma on 08/02/17.
//  Copyright © 2017 pharmEasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *accountsTableView;

@end
