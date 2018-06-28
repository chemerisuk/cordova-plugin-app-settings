#import "AppSettingsPlugin.h"

@implementation AppSettingsPlugin {
    NSUserDefaults *defaults;
}

- (void)pluginInitialize {
    NSLog(@"Starting Firebase Analytics plugin");

    defaults = [NSUserDefaults standardUserDefaults];
}

- (void)getString:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        if ([key isKindOfClass:[NSNull class]]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        } else {
            NSString* value = [defaults stringForKey:key];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setString:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    NSString* value = [command.arguments objectAtIndex:1];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        if ([key isKindOfClass:[NSNull class]]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        } else {
            if ([value isKindOfClass:[NSNull class]]) {
                [defaults removeObjectForKey:value];
            } else {
                [defaults setObject:value forKey:key];
            }

            if ([defaults synchronize]) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
            }
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)getNumber:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        if ([key isKindOfClass:[NSNull class]]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        } else {
            double value = [defaults doubleForKey:key];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:value];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setNumber:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    id value = [command.arguments objectAtIndex:1];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        if ([key isKindOfClass:[NSNull class]]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        } else {
            if ([value isKindOfClass:[NSNull class]]) {
                [defaults removeObjectForKey:value];
            } else {
                [defaults setDouble:[value doubleValue] forKey:key];
            }

            if ([defaults synchronize]) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:[value doubleValue]];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
            }
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)getBoolean:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        if ([key isKindOfClass:[NSNull class]]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        } else {
            BOOL value = [defaults boolForKey:key];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:value];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setBoolean:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    BOOL value = [command.arguments objectAtIndex:1];

    [self.commandDelegate runInBackground:^{
        CDVPluginResult* pluginResult = nil;
        if ([key isKindOfClass:[NSNull class]]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        } else {
            [defaults setBool:value forKey:key];

            if ([defaults synchronize]) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:value];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
            }
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
