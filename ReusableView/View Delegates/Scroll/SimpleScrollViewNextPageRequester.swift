//
// ReusableView
// SimpleScrollViewNextPageRequester.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

public protocol NextPageEventHandler {

    func requestNewPage()

}

public protocol DataLoadingSource {

    var shouldRequestNextPage: Bool { get }

}

public extension DataLoadingSource {

    var shouldRequestNextPage: Bool {
        return true
    }

}

public final class SimpleScrollViewNextPageRequester: NSObject, UIScrollViewDelegate {

    public let nextPageEventInset: CGFloat
    private var nextPageEventHandler: NextPageEventHandler
    private var loadingStateSource: DataLoadingSource

    public init(nextPageEventInset: CGFloat = UIScreen.main.bounds.height * 2,
                nextPageEventHandler: NextPageEventHandler,
                loadingStateSource: DataLoadingSource) {
        self.nextPageEventInset = nextPageEventInset
        self.nextPageEventHandler = nextPageEventHandler
        self.loadingStateSource = loadingStateSource
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard loadingStateSource.shouldRequestNextPage else {
            return
        }

        let viewPortHeight = scrollView.bounds.height + scrollView.contentInset.top + scrollView.contentInset.bottom
        if scrollView.contentOffset.y > scrollView.contentSize.height - viewPortHeight - nextPageEventInset {
            nextPageEventHandler.requestNewPage()
        }
    }

}
