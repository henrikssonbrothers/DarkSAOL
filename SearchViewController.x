#import <UIKit/UIKit.h>
#import "SearchViewController.h"

%hook SearchViewController

- (void)viewDidLoad {
    %orig;

    self.listTableView.backgroundColor = UIColor.blackColor;
    self.searchTableView.backgroundColor = UIColor.blackColor;

    self.searchBar.searchTextField.backgroundColor = UIColor.blackColor;
    self.searchBar.searchTextField.textColor = UIColor.whiteColor;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = %orig;

    cell.backgroundColor = UIColor.blackColor;
    cell.textLabel.textColor = UIColor.whiteColor;

    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = UIColor.darkGrayColor;

    return cell;
}

%end
