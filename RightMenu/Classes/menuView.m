//
//  menuView.m
//  UpperSideMenu
//
//  Created by KDMAC-01 on 4/22/16.
//  Copyright © 2016 NISHANT SHUKLA. All rights reserved.
//

#import "menuView.h"
#define width 150

NSArray *arrayMenu;
NSIndexPath *indexP;
@implementation menuView
@synthesize tblViewMenu;

-(id)initWithFrame:(CGRect)frame andMenuItems:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        tblViewMenu = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.frame), 20,0, 0) style:UITableViewStylePlain];
        tblViewMenu.delegate = self;
        tblViewMenu.dataSource = self;
        tblViewMenu.separatorStyle = UITableViewCellSeparatorStyleNone;
        tblViewMenu.scrollEnabled = NO;
        [self addSubview:tblViewMenu];
        tblViewMenu.layer.cornerRadius = 2.0;
        tblViewMenu.layer.shadowOffset = CGSizeMake(5, 10);
        tblViewMenu.layer.shadowOpacity = 10.0;
        arrayMenu = items;
        [self setTableViewFrame];
        
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(removeMenu)])
    {
        [self.delegate removeMenu];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayMenu.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    indexP = indexPath;
    cell.textLabel.text = [arrayMenu objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNotification *notification = [[NSNotification alloc]initWithName:@"Notification" object:indexPath userInfo:nil];
    
    [[NSNotificationCenter defaultCenter]postNotification:notification];

}



-(void)setTableViewFrame
{
    [UIView animateWithDuration:0.2 animations:^{
        tblViewMenu.frame = CGRectMake(CGRectGetWidth(self.frame)- width-2, 23, width, arrayMenu.count * 50);
    }];
    
    if (tblViewMenu.frame.size.height > 350.0)
    {
        tblViewMenu.frame = CGRectMake(CGRectGetWidth(self.frame)- width-2, 23, width, 350);

        tblViewMenu.scrollEnabled = YES;
    }
}


@end
