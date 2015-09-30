#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>
#import <HockeySDK/HockeySDK.h>
#include "JWHockeyApp.h"

@interface JWHockeyApp:NSObject

- (void)initWithAppId:(NSString*) appId;

@end

@implementation JWHockeyApp

- (void)initWithAppId:(NSString*) appId
{
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier: appId];
    [[BITHockeyManager sharedHockeyManager] startManager];
    [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
}

@end

extern "C"
{
    static JWHockeyApp * myHockeyApp = nil;
    void jwhaInit(const char *sAppId)
    {

        if (myHockeyApp != nil)
        {
            return;
        }

        myHockeyApp = [[JWHockeyApp alloc] init];

		NSString *appId = [ [NSString alloc] initWithUTF8String: sAppId ];
        [myHockeyApp initWithAppId: appId];
    }
}
