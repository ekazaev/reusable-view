//
//  ViewUpdater.swift
//  Cabana
//

import Foundation

public protocol ViewUpdater {

    associatedtype Data

    func update(with data: Data)

}
