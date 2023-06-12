//
//  NetworkMonitor.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/12.
//

import Foundation
import Network


final class NetworkMonitor {
    static let shared = NetworkMonitor()

    private let monitor: NWPathMonitor

    static let connectionLost = Notification.Name("connectionLost")

    private init() {
        self.monitor = NWPathMonitor()
    }

    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
            } else {
                print("No connection.")
                NotificationCenter.default.post(name: NetworkMonitor.connectionLost, object: nil)
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
