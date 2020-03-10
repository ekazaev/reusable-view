//
// ReusableView
// AnyTableCellAdapter.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public struct AnyTableCellAdapter: CellAdapter {

    private let box: AnyCellAdapterBox

    public init<CA: CellAdapter>(with cellAdapter: CA) where CA.Cell: UITableViewCell {
        box = CellAdapterBox(with: cellAdapter)
    }

    public func getView(with factory: ReusableViewFactory) -> UITableViewCell {
        return box.build(with: factory)
    }

}

private protocol AnyCellAdapterBox {

    func build(with factory: ReusableViewFactory) -> UITableViewCell

}

private final class CellAdapterBox<Adapter: CellAdapter>: AnyCellAdapterBox where Adapter.Cell: UITableViewCell {

    private var cellAdapter: Adapter

    init(with cellAdapter: Adapter) {
        self.cellAdapter = cellAdapter
    }

    func build(with factory: ReusableViewFactory) -> UITableViewCell {
        return cellAdapter.getView(with: factory)
    }

}
