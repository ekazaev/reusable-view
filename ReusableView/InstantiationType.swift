//
// ReusableView
// InstantiationType.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation

public enum InstantiationType {

    /// Instantiate from the Xib file that is named as the class
    case xibAsClass

    /// Instantiate as class
    case classImplementation

    /// Instantiate from the Xib file with the custom name
    case customXib(name: String)

}
