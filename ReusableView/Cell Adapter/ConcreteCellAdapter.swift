//
// ReusableView
// ConcreteCellAdapter.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

/// Just builds the cell of the required type.
public struct ConcreteCellAdapter<Cell: ReusableView>: CellAdapter {

    public init() {}

    public func getView(with factory: ReusableViewFactory) -> Cell {
        return factory.build()
    }

}
