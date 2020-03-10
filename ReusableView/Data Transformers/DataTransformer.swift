//
// ReusableView
// DataTransformer.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation

/// Transforms one type of data into another.
public protocol DataTransformer {

    associatedtype Input
    associatedtype Output

    func transform(_ data: Input) -> Output

}
