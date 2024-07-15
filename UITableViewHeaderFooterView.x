#import <UIKit/UIKit.h>

%hook UITableViewHeaderFooterView

- (void)layoutSubviews {
    %orig;

    self.contentView.backgroundColor = [UIColor colorWithRed:0.196 green:0.196 blue:0.204 alpha:1];
    self.textLabel.textColor = UIColor.whiteColor;
}

%end
