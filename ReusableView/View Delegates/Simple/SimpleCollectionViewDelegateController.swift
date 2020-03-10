//
// ReusableView
// SimpleCollectionViewDelegateController.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public final class SimpleCollectionViewDelegateController: NSObject, UniversalListDelegateController, UICollectionViewDelegate {

    public typealias View = UICollectionView
    private let eventHandler: SimpleDelegateControllerEventHandler?

    public init(eventHandler: SimpleDelegateControllerEventHandler? = nil) {
        self.eventHandler = eventHandler
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        eventHandler?.didSelectRow(at: indexPath)
    }

}
