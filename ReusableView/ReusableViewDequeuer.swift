//
// ReusableView
// ReusableViewDequeuer.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

/// Instance that wraps the ReusableView producer like UITableView or UICollectionView and can dequeue them using the parameters provided.
public protocol ReusableViewDequeuer {

    /// Parameters that container needs to dequeue the reusable view.
    associatedtype Context

    func dequeueView<View: ReusableView>(for context: Context) -> View

}
