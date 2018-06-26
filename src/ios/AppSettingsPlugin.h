#import <Cordova/CDV.h>

@interface AppSettingsPlugin : CDVPlugin

- (void)getString:(CDVInvokedUrlCommand*)command;
- (void)setString:(CDVInvokedUrlCommand*)command;

@end
