//
// ReusableView
// UICollectionViewDelegateSplitter.swift
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import UIKit

// Gives an ability to handle scroling events and `UICollectionView` relatedEvents in two different entities.
public class UICollectionViewDelegateSplitter: NSObject, UniversalListDelegateController, UICollectionViewDelegateFlowLayout {

    public typealias View = UICollectionView

    // swiftlint:disable weak_delegate
    public let flowLayoutDelegate: UICollectionViewDelegateFlowLayout?
    public let collectionViewDelegate: UICollectionViewDelegate?
    public let scrollViewDelegate: UIScrollViewDelegate?
    // swiftlint:enable weak_delegate

    public init(collectionViewDelegate: UICollectionViewDelegate? = nil, flowLayoutDelegate: UICollectionViewDelegateFlowLayout? = nil, scrollViewDelegate: UIScrollViewDelegate? = nil) {
        self.collectionViewDelegate = collectionViewDelegate
        self.scrollViewDelegate = scrollViewDelegate
        self.flowLayoutDelegate = flowLayoutDelegate
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        flowLayoutDelegate?.collectionView?(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath) ?? UICollectionViewFlowLayout.automaticSize
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        flowLayoutDelegate?.collectionView?(collectionView, layout: collectionViewLayout, insetForSectionAt: section) ?? .zero
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        flowLayoutDelegate?.collectionView?(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section) ?? 0
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        flowLayoutDelegate?.collectionView?(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section) ?? 0
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        flowLayoutDelegate?.collectionView?(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section) ?? UICollectionViewFlowLayout.automaticSize
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        flowLayoutDelegate?.collectionView?(collectionView, layout: collectionViewLayout, referenceSizeForFooterInSection: section) ?? UICollectionViewFlowLayout.automaticSize
    }

    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldHighlightItemAt: indexPath) ?? true
    }

    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, didHighlightItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, didUnhighlightItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldSelectItemAt: indexPath) ?? true
    }

    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldDeselectItemAt: indexPath) ?? true
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, didDeselectItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, willDisplay: cell, forItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, willDisplaySupplementaryView: view, forElementKind: elementKind, at: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, didEndDisplaying: cell, forItemAt: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        collectionViewDelegate?.collectionView?(collectionView, didEndDisplayingSupplementaryView: view, forElementOfKind: elementKind, at: indexPath)
    }

    public func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldDeselectItemAt: indexPath) ?? true
    }

    public func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        collectionViewDelegate?.collectionView?(collectionView, transitionLayoutForOldLayout: fromLayout, newLayout: toLayout) ?? UICollectionViewTransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
    }

    public func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, canFocusItemAt: indexPath) ?? true
    }

    public func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldUpdateFocusIn: context) ?? true
    }

    public func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {}

    public func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        collectionViewDelegate?.indexPathForPreferredFocusedView?(in: collectionView)
    }

    public func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        collectionViewDelegate?.collectionView?(collectionView, targetIndexPathForMoveFromItemAt: originalIndexPath, toProposedIndexPath: proposedIndexPath) ?? proposedIndexPath
    }

    public func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        collectionViewDelegate?.collectionView?(collectionView, targetContentOffsetForProposedContentOffset: proposedContentOffset) ?? proposedContentOffset
    }

    public func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldSpringLoadItemAt: indexPath, with: context) ?? false
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        collectionViewDelegate?.collectionView?(collectionView, shouldBeginMultipleSelectionInteractionAt: indexPath) ?? true
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {}

    @available(iOS 13.0, *)
    public func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {}

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        collectionViewDelegate?.collectionView?(collectionView, contextMenuConfigurationForItemAt: indexPath, point: point)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        collectionViewDelegate?.collectionView?(collectionView, previewForHighlightingContextMenuWithConfiguration: configuration)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        collectionViewDelegate?.collectionView?(collectionView, previewForDismissingContextMenuWithConfiguration: configuration)
    }

    @available(iOS 13.0, *)
    public func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {}

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidScroll?(scrollView)
    }

    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidZoom?(scrollView)
    }

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewWillBeginDragging?(scrollView)
    }

    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollViewDelegate?.scrollViewWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }

    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollViewDelegate?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }

    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewWillBeginDecelerating?(scrollView)
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidEndDecelerating?(scrollView)
    }

    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidEndScrollingAnimation?(scrollView)
    }

    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        scrollViewDelegate?.viewForZooming?(in: scrollView)
    }

    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollViewDelegate?.scrollViewWillBeginZooming?(scrollView, with: view)
    }

    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollViewDelegate?.scrollViewDidEndZooming?(scrollView, with: view, atScale: scale)
    }

    public func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        scrollViewDelegate?.scrollViewShouldScrollToTop?(scrollView) ?? true
    }

    public func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidScrollToTop?(scrollView)
    }

    public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        scrollViewDelegate?.scrollViewDidChangeAdjustedContentInset?(scrollView)
    }

}
