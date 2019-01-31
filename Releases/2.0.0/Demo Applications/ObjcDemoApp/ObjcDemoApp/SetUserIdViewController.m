#import "SetUserIdViewController.h"
@import OptimoveSDK;

@implementation SetUserIdViewController
- (IBAction)userPressOnSend {
    NSString* name = [self.userIdTextField text];
    [Optimove.sharedInstance setWithUserID:name];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Optimove.sharedInstance registerSuccessStateDelegate:self];
}
-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}
- (void)optimove:(Optimove *)optimove didBecomeActiveWithMissingPermissions:(NSArray<NSNumber *> *)missingPermissions {
    [Optimove.sharedInstance reportScreenWithScreenTitle:@"setUSerId" screenPath:@[@"main_screnn",@"setUSerId"] category:@"setUserId"];
    [Optimove.sharedInstance unregisterSuccessStateDelegate:self];
}
@end
