//
// ReusableView
// TableReusableCellDequeuer.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public final class TableReusableCellDequeuer<Proxy: ViewAccessProxy>: ReusableViewDequeuer where Proxy.View: UITableView {

    private let viewProxy: Proxy
    private var reusableIdentifiers: Set<String> = Set()

    public init(viewProxy: Proxy) {
        self.viewProxy = viewProxy
    }

    public func dequeueView<View: ReusableView>(for indexPath: IndexPath) -> View {
        guard viewProxy.isViewLoaded else {
            assertionFailure("View is not loaded yet")
            return View()
        }

        if !reusableIdentifiers.contains(View.reuseIdentifier) {
            switch View.instantiationType {
            case .xibAsClass:
                let nib = UINib(nibName: View.reuseIdentifier, bundle: Bundle(for: View.self))
                viewProxy.view.register(nib, forCellReuseIdentifier: View.reuseIdentifier)
            case .classImplementation:
                viewProxy.view.register(View.self, forCellReuseIdentifier: View.reuseIdentifier)
            case let .customXib(name: xibName):
                let nib = UINib(nibName: xibName, bundle: Bundle(for: View.self))
                viewProxy.view.register(nib, forCellReuseIdentifier: View.reuseIdentifier)
            }
            reusableIdentifiers.insert(View.reuseIdentifier)
        }
        return dequeueReusableCell(forIndexPath: indexPath)
    }

    private func dequeueReusableCell<View: ReusableView>(forIndexPath indexPath: IndexPath) -> View {
        guard let cell = viewProxy.view.dequeueReusableCell(withIdentifier: View.reuseIdentifier, for: indexPath) as? View else {
            fatalError("No collection view cell could be dequeued with identifier \(View.reuseIdentifier)")
        }

        return cell
    }

}
