//
//  NetworkReachability.swift
//  FakeStore
//
//  Created by chandra sekhar p on 12/11/24.
//

import Foundation
import Network

/// A protocol that defines the contract for checking network reachability.
public protocol Reachability {
    func isReachable() -> Bool
}

/// A singleton class that monitors network reachability using the NWPathMonitor.

final class NetworkReachability {
    private var isConnected: Bool = false
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "network_monitor_queue")
    static let shared = NetworkReachability()
    
    /// Private initializer to configure the `NWPathMonitor` for network status updates.
    private init() {
        self.configurePathMonitor()
    }
    
    /// Configures the `NWPathMonitor` to observe changes in network reachability.
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
