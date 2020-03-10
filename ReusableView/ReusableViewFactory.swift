//
// ReusableView
// ReusableViewFactory.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

/// Instance extending this protocol can build/reuse a reusable view of a specific type.
public protocol ReusableViewFactory {

    func build<View: ReusableView>() -> View

}
