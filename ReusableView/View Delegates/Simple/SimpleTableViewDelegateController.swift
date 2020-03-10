//
// ReusableView
// SimpleTableViewDelegateController.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public final class SimpleTableViewDelegateController: NSObject, UniversalListDelegateController, UITableViewDelegate {

    public typealias View = UITableView
    private let eventHandler: SimpleDelegateControllerEventHandler?

    public init(eventHandler: SimpleDelegateControllerEventHandler? = nil) {
        self.eventHandler = eventHandler
    }

    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        eventHandler?.didSelectRow(at: indexPath)
    }

}
