
#import "ReportEventViewController.h"
@import OptimoveSDK;
#import "CombinedEvent.h"
#import "MyCustomEvent.h"

@interface ReportEventViewController ()

@end

@implementation ReportEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)userPressOnSend:(UIButton *)sender {
    NSString* stringInput = _stringTextField.text;
    NSNumber* numberInput = @([_numberTextField.text intValue]);
    CombinedEvent* event = [[CombinedEvent alloc] initWithStringInput:stringInput andNumberInput:numberInput];
    [Optimove.sharedInstance reportEvent:event];
    
    NSDictionary* params = @{@"first_param" : @"1"};
    MyCustomEvent* myEvent = [[MyCustomEvent alloc]initWithName:@"event_name" andParameters:params];
    [Optimove.sharedInstance reportEvent:myEvent];
    
}


@end
