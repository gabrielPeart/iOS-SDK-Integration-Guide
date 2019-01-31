

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Optimove.sharedInstance registerSuccessStateDelegate:self];
    [Optimove.sharedInstance registerWithDeepLinkResponder: [[OptimoveDeepLinkResponder alloc] init: self]];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void) didReceiveWithDeepLink:(OptimoveDeepLinkComponents *)deepLink {
    if (deepLink != nil) {
        UIViewController* vc = [[self storyboard] instantiateViewControllerWithIdentifier:deepLink.screenName];
        [[self navigationController] pushViewController:vc animated:true];
    }
}
- (IBAction)subscribeTotestMode:(UIButton *)sender {
     [Optimove.sharedInstance startTestMode];
}

- (IBAction)unsubscribeToTestMode:(UIButton *)sender {
    [Optimove.sharedInstance stopTestMode];
}

- (void)optimove:(Optimove *)optimove didBecomeActiveWithMissingPermissions:(NSArray<NSNumber *> *)missingPermissions {
    [Optimove.sharedInstance reportScreenVisitWithScreenTitle:@"main_screen" screenPath:@"main_screen" category:nil];
    [Optimove.sharedInstance unregisterSuccessStateDelegate:self];
}


@end
