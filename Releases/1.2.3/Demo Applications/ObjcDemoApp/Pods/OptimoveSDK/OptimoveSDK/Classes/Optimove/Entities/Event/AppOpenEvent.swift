

import Foundation
class AppOpenEvent: OptimoveCoreEvent
{
    var name: String
    {
        return "app_open"
    }
    
    var parameters: [String : Any]

    init()
    {
        var dictionary = [OptimoveKeys.Configuration.appNs.rawValue: Bundle.main.bundleIdentifier!,
                          OptimoveKeys.Configuration.deviceId.rawValue: DeviceID
        ]
        if CustomerID == nil {
            dictionary[OptimoveKeys.Configuration.visitorId.rawValue] = VisitorID
        } else {
            dictionary[OptimoveKeys.Configuration.userId.rawValue] = CustomerID!
        }
        self.parameters = dictionary
    }
}
