//
// ReusableView
// CellAdapter.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

/// Requests the cell from the factory provided and adjusts it if needed.
public protocol CellAdapter {

    associatedtype Cell

    func getView(with factory: ReusableViewFactory) -> Cell

}
