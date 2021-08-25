//
//  NewsPresenter.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

protocol NewsPresentationLogic: AnyObject {
    func presentNews(response: News.Fetch.Response)
    func presentAlert(error: Error)
}

final class NewsPresenter: NewsPresentationLogic {

    weak var viewController: NewsDisplayLogic?

    func presentNews(response: News.Fetch.Response) {
        // 3
        var news: [News.Fetch.ViewModel.New] = []

        response.news.forEach {
            news.append(News.Fetch.ViewModel.New(date: $0.publishedAt,
                                                 title: $0.title,
                                                 image: $0.urlToImage))
        }

        viewController?.displayNews(viewModel: News.Fetch.ViewModel(news: news))
    }

    func presentAlert(error: Error) {

    }
}
