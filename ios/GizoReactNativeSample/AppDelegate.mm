#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <GizoSDK/GizoSDK-Swift.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"GizoReactNativeSample";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  [self initialieGizoSDK:launchOptions];
  
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void) initialieGizoSDK:(nullable NSDictionary *)launchOptions {
  
  GizoOptions *options = [[GizoOptions alloc] init];

  GizoInitializationResult *result = [[Gizo shared] initializeWithOptions:options launchOptions:launchOptions];

  if (result.isSuccessful) {
      NSLog(@"[SDK]: Initialization successful");
  } else {
      NSLog(@"[SDK]: Initialization failed, reason: %@", result.failure.debugDescription);
  }
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
