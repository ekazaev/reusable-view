//
// ReusableView
// SimpleDelegateControllerEventHandler.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public protocol SimpleDelegateControllerEventHandler: AnyObject {

    func didSelectRow(at indexPath: IndexPath)

}
