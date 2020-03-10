//
// ReusableView
// AnyCollectionCellAdapter.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public struct AnyCollectionCellAdapter: CellAdapter {

    private let box: AnyCellAdapterBox

    public init<Adapter: CellAdapter>(with cellAdapter: Adapter) where Adapter.Cell: UICollectionViewCell {
        box = CellAdapterBox(with: cellAdapter)
    }

    public func getView(with factory: ReusableViewFactory) -> UICollectionViewCell {
        return box.build(with: factory)
    }

}

private protocol AnyCellAdapterBox {

    func build(with factory: ReusableViewFactory) -> UICollectionViewCell

}

private final class CellAdapterBox<Adapter: CellAdapter>: AnyCellAdapterBox where Adapter.Cell: UICollectionViewCell {

    private var cellAdapter: Adapter

    init(with cellAdapter: Adapter) {
        self.cellAdapter = cellAdapter
    }

    func build(with factory: ReusableViewFactory) -> UICollectionViewCell {
        return cellAdapter.getView(with: factory)
    }

}
