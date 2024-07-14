#import <UIKit/UIKit.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations" // UIWebView was deprecated in iOS 12.0

%hook CustomWebView

- (void)webView:(UIWebView *)webView didFinishLoadForFrame:(id)frame {
    %orig;

    NSString *cssString = @"\
        body { \
            background-color: black; \
            color: white; \
        } \
        .hvid { \
            color: white; \
        } \
        div.lemma:target { \
            background-color: black; \
        } \
        .mark { \
            background-color: #4C4B3D; \
        } \
        .stilruta.mark { \
            background-color: #1B1814; \
        } \
    ";
    NSString *javascriptStringFormat = @"\
        var style = document.createElement('style'); \
        style.innerHTML = '%@'; \
        document.head.appendChild(style); \
    ";
    NSString *javascriptWithCSSString = [NSString stringWithFormat:javascriptStringFormat, cssString];
    [webView stringByEvaluatingJavaScriptFromString:javascriptWithCSSString];
}

%end

#pragma clang diagnostic pop
