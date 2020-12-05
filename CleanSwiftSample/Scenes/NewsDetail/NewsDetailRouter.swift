//
//  NewsDetailRouter.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

protocol NewsDetailRoutingLogic: class {

}

protocol NewsDetailDataPassing: class {
    var dataStore: NewsDetailDataStore? { get }
}

final class NewsDetailRouter: NewsDetailRoutingLogic, NewsDetailDataPassing {

    weak var viewController: NewsDetailViewController?
    var dataStore: NewsDetailDataStore?

}
