//
//  Optimove + reportScreenVisit.swift
//  OptimoveSDK


import Foundation

//MARK: report screen visit

extension Optimove
{
    @objc public func reportScreen(screenTitle: String, screenPathArray: [String], category: String? = nil)
    {
        OptiLogger.debug("user ask to report screen event")
        guard !screenTitle.trimmingCharacters(in: .whitespaces).isEmpty else {
            OptiLogger.error("trying to report screen visit with empty array")
            return
        }
        let path = screenPathArray.joined(separator: "/")
        reportScreen(screenTitle: screenTitle, screenPath: path,category: category)
    }

    @objc public func reportScreen(screenTitle: String, screenPath: String, category: String? = nil)
    {
        let screenTitle = screenTitle.trimmingCharacters(in: .whitespaces)
        let screenPath = screenPath.trimmingCharacters(in: .whitespaces)
        guard !screenTitle.isEmpty else {
            OptiLogger.debug("Tried to pass empty screenPath to report Screen Visit")
            return
        }
        guard !screenPath.isEmpty else {
            OptiLogger.debug("Tried to pass empty screenPath to report Screen Visit")
            return
        }

        if let customUrl = removeUrlProtocol(path: screenPath).lowercased().addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
            var path = customUrl.last != "/" ? "\(customUrl)/" : "\(customUrl)"
            path = "\(Bundle.main.bundleIdentifier!)/\(path)".lowercased()

            if RunningFlagsIndication.isComponentRunning(.optiTrack) {
                optiTrack.reportScreenEvent(screenTitle: screenTitle, screenPath: path, category: category)
            }
            if RunningFlagsIndication.isComponentRunning(.realtime) {
                realTime.reportScreenEvent(customURL: path, pageTitle: screenTitle, category: category)
            }
        }
    }

    private func removeUrlProtocol(path:String) -> String {
        var result = path
        for prefix in ["https://www.", "http://www.", "https://", "http://"] {
            if (result.hasPrefix(prefix)) {
                result.removeFirst(prefix.count)
                break
            }
        }
        return result
    }
}
