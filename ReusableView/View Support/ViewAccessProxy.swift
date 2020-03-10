//
// ReusableView
// ViewAccessProxy.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

// View Access Proxy hides view object inside and can be used to initialize this view dependent objects
// before the is view actually created.
// Also it is very useful on the development stage to control that someone is trying to access
// the view before it were loaded by the view controller. Helps to avoid side effects that view is
// being accessed in `didSet` of the `UIViewController` for example before the view controller was
// loaded.
public protocol ViewAccessProxy {

    associatedtype View: UIView

    var isViewLoaded: Bool { get }
    var view: View { get }

}

public protocol ViewBuilder {

    associatedtype View: UIView

    var view: View { get }
    func build() -> View

}
