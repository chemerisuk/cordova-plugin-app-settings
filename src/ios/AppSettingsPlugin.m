#import "AppSettingsPlugin.h"

@implementation AppSettingsPlugin {
    NSUserDefaults *defaults;
}

- (void)pluginInitialize {
    NSLog(@"Starting Firebase Analytics plugin");

    defaults = [NSUserDefaults standardUserDefaults];
}

- (void)getString:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
        NSString* key = [command.arguments objectAtIndex:0];

        CDVPluginResult* pluginResult = nil;
        if (key) {
            NSString* value = [defaults stringForKey:key];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setString:(CDVInvokedUrlCommand *)command {
    [self.commandDelegate runInBackground:^{
        NSString* key = [command.arguments objectAtIndex:0];
        NSString* value = [command.arguments objectAtIndex:1];
        CDVPluginResult* pluginResult = nil;
        if (key) {
            if (value) {
                [defaults setObject:value forKey:key];
            } else {
                [defaults removeObjectForKey:value];
            }

            BOOL success = [defaults synchronize];
            if (success) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
            }
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
