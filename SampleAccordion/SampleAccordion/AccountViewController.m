//
//  AccountViewController.m
//  PharmEasy
//
//  Created by Shubhi Sharma on 08/02/17.
//  Copyright © 2017 pharmEasy. All rights reserved.
//

#import "AccountViewController.h"
#import "AccountsSectionHeaderView.h"
#import "AccountTableViewCell.h"

#define SectionHeaderViewIdentifier = @"accountsHeaderView"

@interface AccountViewController ()
{
    NSMutableArray *accountsMenu;
    NSMutableArray *medicalRecords;
    NSMutableArray *subMenuList;
    int collapsedSection;
    AccountTableViewCell *headerCell;
    AccountTableViewCell *tableCell;
}
@end

@implementation AccountViewController
@synthesize accountsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path = [[NSBundle mainBundle]pathForResource:@"AccountsMenu" ofType:@"plist"];
    accountsMenu = [NSMutableArray arrayWithContentsOfFile:path];
    collapsedSection = -1;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma tableviewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return accountsMenu.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (collapsedSection != -1) {
    
        if (nil!=[[accountsMenu objectAtIndex:section]objectForKey:@"SubItems"]){
        
            if(collapsedSection == section){
           
                subMenuList= [[accountsMenu objectAtIndex:section]objectForKey:@"SubItems"];
            
                return subMenuList.count;
            }else{
                return 0;
            }
            
        }else{
            return 0;
        }
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tableCell = [self.accountsTableView dequeueReusableCellWithIdentifier:@"subSectionCell"];
    NSMutableDictionary *subMenu = [subMenuList objectAtIndex:indexPath.row];
    [tableCell customizeCell:[subMenu objectForKey:@"SubItemName"] accountSubtitle:[subMenu objectForKey:@"SubItemDesc"] accountImage:[subMenu objectForKey:@"SubItemImage"]];
    return tableCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"inside");
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
     headerCell = [tableView dequeueReusableCellWithIdentifier:@"headerCell"];
    
    headerCell.cellTitle.text = [[accountsMenu objectAtIndex:section]objectForKey:@"itemName"];
    
    [headerCell setUserInteractionEnabled:true];
    [headerCell setTag:section];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionTapped:)];
    [headerCell addGestureRecognizer:tapGesture];
    
    return headerCell;
}

- (IBAction)sectionTapped:(UITapGestureRecognizer *)sender {
    
    NSLog(@"section tapped : %d", sender.view.tag);
   
    if(collapsedSection == sender.view.tag){
        collapsedSection = -1;
    }else{
        collapsedSection = sender.view.tag;
    }
    //[self.accountsTableView reloadData];*/
    
    [self.accountsTableView beginUpdates];
    //NSArray *arr = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:1  inSection:sender.view.tag]];
   // [self.accountsTableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self.accountsTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cellType inSection:0],[NSIndexPath indexPathForRow:cellTypeDontHavePrescriptionOrPrescriptionNotes inSection:0]] withRowAnimation:UITableViewRowAnimationFade
    //collapsedSection = sender.view.tag;
    [self.accountsTableView reloadSections:[NSIndexSet indexSetWithIndex:sender.view.tag] withRowAnimation:UITableViewRowAnimationBottom];
    [self.accountsTableView reloadData];
    [self.accountsTableView endUpdates];
}

@end
