//
// ReusableView
// DequeuingFactory.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public struct DequeuingFactory<Dequeuer: ReusableViewDequeuer>: ReusableViewFactory {

    private let dequeuer: Dequeuer
    private let context: Dequeuer.Context

    public init(using dequeuer: Dequeuer, with context: Dequeuer.Context) {
        self.dequeuer = dequeuer
        self.context = context
    }

    public func build<View: ReusableView>() -> View {
        return dequeuer.dequeueView(for: context)
    }

}
