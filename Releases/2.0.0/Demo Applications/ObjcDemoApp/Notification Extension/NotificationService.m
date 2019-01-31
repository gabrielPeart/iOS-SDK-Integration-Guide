

#import "NotificationService.h"
@import OptimoveNotificationServiceExtension;


@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;
@property (nonatomic, strong) OptimoveNotificationServiceExtension* optimoveNotificationExtension;

@end

@implementation NotificationService
- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.optimoveNotificationExtension = [[OptimoveNotificationServiceExtension alloc] initWithAppBundleId:@"com.optimove.sdk.demo.objc"];
    [self.optimoveNotificationExtension didReceive:request withContentHandler:contentHandler];
    if (!self.optimoveNotificationExtension.isHandledByOptimove) {
        self.contentHandler = contentHandler;
        self.bestAttemptContent = [request.content mutableCopy];
        
        // Modify the notification content here...
        self.bestAttemptContent.title = [NSString stringWithFormat:@"%@ [modified]", self.bestAttemptContent.title];
        
        self.contentHandler(self.bestAttemptContent);
    }
}

- (void)serviceExtensionTimeWillExpire {
    if (self.optimoveNotificationExtension.isHandledByOptimove) {
        [self.optimoveNotificationExtension serviceExtensionTimeWillExpire];
    } else {
        self.contentHandler(self.bestAttemptContent);
    }
}

@end
