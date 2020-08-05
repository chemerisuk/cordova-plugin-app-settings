#import "AppSettingsPlugin.h"

@implementation AppSettingsPlugin

- (void)pluginInitialize {
    NSLog(@"Starting Firebase Analytics plugin");

    self.defaults = [NSUserDefaults standardUserDefaults];
}

- (void)getString:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    [self doWithValidKey:key command:command method:^{
        NSString* value = [self.defaults stringForKey:key];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setString:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    [self doWithValidKey:key command:command method:^{
        NSString* value = [command.arguments objectAtIndex:1];

        if ([value isKindOfClass:[NSNull class]]) {
            [self.defaults removeObjectForKey:key];
        } else {
            [self.defaults setObject:value forKey:key];
        }

        CDVPluginResult* pluginResult = nil;
        if ([self.defaults synchronize]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)getNumber:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    [self doWithValidKey:key command:command method:^{
        double value = [self.defaults doubleForKey:key];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:value];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setNumber:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    [self doWithValidKey:key command:command method:^{
        id value = [command.arguments objectAtIndex:1];

        if ([value isKindOfClass:[NSNull class]]) {
            [self.defaults removeObjectForKey:key];
        } else {
            [self.defaults setDouble:[value doubleValue] forKey:key];
        }

        CDVPluginResult* pluginResult = nil;
        if ([self.defaults synchronize]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:[value doubleValue]];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)getBoolean:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    [self doWithValidKey:key command:command method:^{
        BOOL value = [self.defaults boolForKey:key];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:value];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)setBoolean:(CDVInvokedUrlCommand *)command {
    NSString* key = [command.arguments objectAtIndex:0];
    [self doWithValidKey:key command:command method:^{
        BOOL value = [command.arguments objectAtIndex:1];

        [self.defaults setBool:value forKey:key];

        CDVPluginResult* pluginResult = nil;
        if ([self.defaults synchronize]) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:value];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Synchronization failed"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)doWithValidKey:(NSString*)key command:(CDVInvokedUrlCommand *)command method:(void (^)(void))block {
    if ([key isKindOfClass:[NSNull class]]) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Key must not be blank"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
        [self.commandDelegate runInBackground:block];
    }
}

@end
