//
//  NewsRouter.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation
import UIKit

protocol NewsRoutingLogic: class {

    func routeToNewsDetail(index: Int)
}

protocol NewsDataPassing: class {
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
        destVC.router?.dataStore?.image = dataStore?.news?[index].urlToImage ?? ""
        destVC.router?.dataStore?.title = dataStore?.news?[index].title ?? ""
        destVC.router?.dataStore?.detailDescription = dataStore?.news?[index].articleDescription ?? ""
        destVC.router?.dataStore?.publishDate = dataStore?.news?[index].publishedAt ?? ""
        self.viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}
