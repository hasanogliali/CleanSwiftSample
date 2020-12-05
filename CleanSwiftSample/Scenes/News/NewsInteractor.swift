//
//  NewsInteractor.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

protocol NewsBusinessLogic: class {
    func fetchNews(request: News.Fetch.Request)
}

protocol NewsDataStore: class {
    var news: [Article]? { get }
}

class NewsInteractor: NewsBusinessLogic, NewsDataStore {

    var presenter: NewsPresentationLogic?
    var worker: NewsWorker = NewsWorker()
    var news: [Article]?

    func fetchNews(request: News.Fetch.Request) {
        worker.getNews(request: NewsList.Request(country: request.country)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.news = response.articles
                (response.articles?.count ?? 0) > 0 ? self?.presenter?.presentNews(
                    response: News.Fetch.Response(news: response.articles!)
                ): ()
            case .failure(let error):
                self?.presenter?.presentAlert(error: error)
            }
        }
    }
}
