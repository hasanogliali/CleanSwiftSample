//
//  NewsDetailInteractor.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

protocol NewsDetailBusinessLogic: class {
    func fetchNewsDetail(request: NewsDetail.Fetch.Request)
}

protocol NewsDetailDataStore: class {
    var image: String { get set }
    var title: String { get set }
    var detailDescription: String { get set }
    var publishDate: String { get set }
}

class NewsDetailInteractor: NewsDetailBusinessLogic, NewsDetailDataStore {

    var presenter: NewsDetailPresentationLogic?
    var worker: NewsDetailWorker?

    var image: String = ""
    var title: String = ""
    var detailDescription: String = ""
    var publishDate: String = ""

    func fetchNewsDetail(request: NewsDetail.Fetch.Request) {
        self.presenter?.presentNewsDetail(
            response: NewsDetail.Fetch.Response(image: image,
                                                title: title,
                                                detailDescription: detailDescription,
                                                publishDate: publishDate)
        )
    }
}
