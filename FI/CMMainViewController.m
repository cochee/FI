//
//  CMMainViewController.m
//  FI
//
//  Created by zcm on 14/08/2017.
//  Copyright © 2017 zcm. All rights reserved.
//

#import "CMMainViewController.h"
#import "CMContact.h"
#import "CMContactGroup.h"

@interface CMMainViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    UITableView *_tabView;
    NSMutableArray *_contacts;//联系人模型
    NSIndexPath *_selectedIndexPath;//当前选中的组合行
}

@end

@implementation CMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];

    _tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    [self.view addSubview:_tabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    _contacts = [[NSMutableArray alloc] init];
    CMContact *contact1 = [CMContact initWithFirstName:@"zhang" andLastName:@"chenming" andPhoneNumber:@"18500131234"];
    CMContact *contact2 = [CMContact initWithFirstName:@"zhang" andLastName:@"Tom" andPhoneNumber:@"18500131237"];
    CMContactGroup *group1 = [CMContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact1, contact2, nil]];
    [_contacts addObject:group1];


    CMContact *contact3 = [CMContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
    CMContact *contact4 = [CMContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
    CMContact *contact5 = [CMContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
    CMContactGroup *group2 = [CMContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3, contact4, contact5, nil]];
    [_contacts addObject:group2];


    CMContact *contact6 = [CMContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
    CMContact *contact7 = [CMContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];

    CMContactGroup *group3 = [CMContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6, contact7, nil]];
    [_contacts addObject:group3];


    CMContact *contact8 = [CMContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
    CMContact *contact9 = [CMContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
    CMContact *contact10 = [CMContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
    CMContact *contact11 = [CMContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
    CMContact *contact12 = [CMContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
    CMContactGroup *group4 = [CMContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8, contact9, contact10, contact11, contact12, nil]];
    [_contacts addObject:group4];


    CMContact *contact13 = [CMContact initWithFirstName:@"Xhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
    CMContact *contact14 = [CMContact initWithFirstName:@"Xhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
    CMContact *contact15 = [CMContact initWithFirstName:@"Xhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
    CMContactGroup *group5 = [CMContactGroup initWithName:@"X" andDetail:@"With names beginning with X" andContacts:[NSMutableArray arrayWithObjects:contact13, contact14, contact15, nil]];
    [_contacts addObject:group5];

}

#pragma mark 返回分组数

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"计算分组数");
    return _contacts.count;
}


#pragma mark 返回每组行数

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"计算每组(组%li)行数", section);
    CMContactGroup *group = _contacts[section];
    return group.contacts.count;
}

#pragma mark 返回每行的单元格

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"生成单元格（组：%li,行%li）", indexPath.section, indexPath.row);
    CMContactGroup *group = _contacts[indexPath.section];
    CMContact *contact = group.contacts[indexPath.row];

    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierForFistRow = @"UITableViewCellIdentifierKeyWithSwitch";
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierForFistRow];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }

    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFistRow];
            UISwitch *sw = [[UISwitch alloc] init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        } else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    }

    if (indexPath.row == 0) {
        ((UISwitch *) cell.accessoryView).tag = indexPath.section;
    }

//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
//    }

//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    NSLog(@"cell:%@", cell);

    return cell;
}

#pragma mark 切换开关转化事件

- (void)switchValueChange:(UISwitch *)sw {
    NSLog(@"section:%i,switch:%i", sw.tag, sw.on);
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSLog(@"生成组（组%li）名称", section);
    CMContactGroup *group = _contacts[section];
    return group.name;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"生成尾部（组%li）详情", section);
    CMContactGroup *group = _contacts[section];
    return group.detail;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSLog(@"生成组索引");
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for (CMContactGroup *group in _contacts) {
        [indexs addObject:group.name];
    }
    return indexs;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndexPath = indexPath;
    CMContactGroup *group = _contacts[indexPath.section];
    CMContact *contact = group.contacts[indexPath.row];

    //创建弹出窗口
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.text = contact.phoneNumber;
    [alert show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        CMContactGroup *group = _contacts[_selectedIndexPath.section];
        CMContact *contact = group.contacts[_selectedIndexPath.row];
        contact.phoneNumber = textField.text;

//        [_tabView reloadData];
        NSArray *indexPaths = @[_selectedIndexPath];
        [_tabView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];

    }


}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
