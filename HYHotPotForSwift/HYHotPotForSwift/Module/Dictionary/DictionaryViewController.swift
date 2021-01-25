//
//  DictionaryViewController.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2021/1/13.
//

import IGListKit
import UIKit

final class DictionaryViewController: UIViewController, ListAdapterDataSource, UIScrollViewDelegate {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    lazy var items = Array(0...20)
    var loading = false
    let spinToken = "spinner"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
        collectionView.backgroundColor = UIColor.white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    // MARK: ListAdapterDataSource

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = items as [ListDiffable]

        if loading {
            objects.append(spinToken as ListDiffable)
        }

        return objects
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == spinToken {
            return spinnerSectionController()
        } else {
            return LabelSectionController()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }

    // MARK: UIScrollViewDelegate

    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !loading && distance < 200 {
            loading = true
            adapter.performUpdates(animated: true, completion: nil)
            DispatchQueue.global(qos: .default).async {
                // fake background loading task
                sleep(8)
                DispatchQueue.main.async {
                    self.loading = false
                    let itemCount = self.items.count
                    self.items.append(contentsOf: Array(itemCount..<itemCount + 5))
                    self.adapter.performUpdates(animated: true, completion: nil)
                }
            }
        }
    }

}
