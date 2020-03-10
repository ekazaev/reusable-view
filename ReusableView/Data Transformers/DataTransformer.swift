//
//  DataTransformer.swift
//  Cabana
//

import Foundation

/// Transforms one type of data into another.
public protocol DataTransformer {

    associatedtype Input
    associatedtype Output

    func transform(_ data: Input) -> Output

}
