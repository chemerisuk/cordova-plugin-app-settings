#import <Cordova/CDV.h>

@interface AppSettingsPlugin : CDVPlugin

- (void)getString:(CDVInvokedUrlCommand*)command;
- (void)setString:(CDVInvokedUrlCommand*)command;
- (void)getNumber:(CDVInvokedUrlCommand*)command;
- (void)setNumber:(CDVInvokedUrlCommand*)command;
- (void)getBoolean:(CDVInvokedUrlCommand*)command;
- (void)setBoolean:(CDVInvokedUrlCommand*)command;

@end
