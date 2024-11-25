// The Swift Programming Language
// https://docs.swift.org/swift-book

import MetricKit

public final class PKManager: NSObject, @unchecked Sendable {
    public static let shared = PKManager()
    private override init() {
        super.init()
        metric.add(self)
    }
    
    private let metric = MXMetricManager.shared
}

extension PKManager: MXMetricManagerSubscriber {
    public func didReceive(_ payloads: [MXMetricPayload]) {
        for payload in payloads {
            debugPrint("----->>> \(payload.dictionaryRepresentation())")
        }
    }
    
    public func didReceive(_ payloads: [MXDiagnosticPayload]) {
        for payload in payloads {
            debugPrint("----->>> \(payload.dictionaryRepresentation())")
        }
    }
}
