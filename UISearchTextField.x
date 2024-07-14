#import <UIKit/UIKit.h>

%hook UISearchTextField

- (void)layoutSubviews {
    %orig;

    if (self.tag == 1) {
        return;
    }

    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)subview;
            imageView.tintColor = UIColor.whiteColor;
            imageView.image = [imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            self.tag = 1;
            break;
        }
    }
}

%end
