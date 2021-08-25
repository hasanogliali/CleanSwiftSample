//
//  NewsRouter.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation
import UIKit

protocol NewsRoutingLogic: AnyObject {

    func routeToNewsDetail(index: Int)
}

protocol NewsDataPassing: AnyObject {
    var dataStore: NewsDataStore? { get }
}

final class NewsRouter: NewsRoutingLogic, NewsDataPassing {

    weak var viewController: NewsViewController?
    var dataStore: NewsDataStore?

    func routeToNewsDetail(index: Int) {
        let storyBoard = UIStoryboard(name: "NewsDetail", bundle: nil)
        let destVC: NewsDetailViewController = storyBoard.instantiateViewController(
            identifier: "NewsDetailViewController"
        )
        // data passing sample
        destVC.router?.dataStore?.article = dataStore?.news?[index]
        self.viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
