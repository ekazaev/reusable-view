//
// ReusableView
// ViewUpdater.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation

public protocol ViewUpdater {

    associatedtype Data

    func update(with data: Data)

}
