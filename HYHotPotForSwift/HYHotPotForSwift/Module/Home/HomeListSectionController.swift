//
//  HomeListSectionController.swift
//  HYHotPotForSwift
//
//  Created by 韩丛旸 on 2021/1/19.
//

import UIKit
import IGListKit

class HomeListSectionController: ListSectionController {
    

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 100 )
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "cell",
                                                                              for: self,
                                                                              at: index) as? SpinnerCell else {
                                                                                fatalError()
        }
        return cell
    }

    override func didSelectItem(at index: Int) {

    }

}
