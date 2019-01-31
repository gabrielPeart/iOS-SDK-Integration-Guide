//
//  NotificationService.swift
//  Notification Extension


import UserNotifications
import OptimoveNotificationServiceExtension

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    var optimoveNotificationServiceExtension:OptimoveNotificationServiceExtension!

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        optimoveNotificationServiceExtension = OptimoveNotificationServiceExtension(appBundleId: "com.optimove.sdk.demo.swift")
        optimoveNotificationServiceExtension.didReceive(request, withContentHandler: contentHandler)
        if !optimoveNotificationServiceExtension.isHandledByOptimove {
            self.contentHandler = contentHandler
            bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
            
            if let bestAttemptContent = bestAttemptContent {
                // Modify the notification content here...
                bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
                
                contentHandler(bestAttemptContent)
            }
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        if optimoveNotificationServiceExtension.isHandledByOptimove {
            optimoveNotificationServiceExtension.serviceExtensionTimeWillExpire()
        } else {
            if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
                contentHandler(bestAttemptContent)
            }
        }
    }

}
