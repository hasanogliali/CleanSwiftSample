//
//  NewsDetailInteractor.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

protocol NewsDetailBusinessLogic: AnyObject {
    func fetchNewsDetail(request: NewsDetail.Fetch.Request)
}

protocol NewsDetailDataStore: AnyObject {
    var article: Article? { get set }
}

class NewsDetailInteractor: NewsDetailBusinessLogic, NewsDetailDataStore {

    var presenter: NewsDetailPresentationLogic?
    var worker: NewsDetailWorker?

    var article: Article?

    func fetchNewsDetail(request: NewsDetail.Fetch.Request) {
        self.presenter?.presentNewsDetail(response: .init(new: article))
    }
}
