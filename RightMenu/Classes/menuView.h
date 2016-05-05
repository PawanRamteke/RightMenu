//
//  menuView.h
//  UpperSideMenu
//
//  Created by KDMAC-01 on 4/22/16.
//  Copyright © 2016 NISHANT SHUKLA. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate <NSObject>

-(void)removeMenu;

@end

@interface menuView : UIView<UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , strong)UITableView *tblViewMenu;
@property (nonatomic , weak)id <MenuDelegate> delegate;
-(id)initWithFrame:(CGRect)frame andMenuItems:(NSArray *)items;
-(void)setTableViewFrame;
@end
