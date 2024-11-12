//
//  NetworkReachability.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation
import Network

public protocol Reachability {
    func isReachable() -> Bool
}

final class NetworkReachability {
    private var isConnected: Bool = false
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "network_monitor_queue")
    static let shared = NetworkReachability()
    private init() {
        self.configurePathMonitor()
    }
        
    private func configurePathMonitor() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
}

extension NetworkReachability: Reachability {
    func isReachable() -> Bool {
        return isConnected
    }
    func stopMonitoring() {
        monitor.cancel()
    }
}
