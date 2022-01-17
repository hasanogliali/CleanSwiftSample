//
//  NewsDetailPresenter.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

protocol NewsDetailPresentationLogic: AnyObject {
    func presentNewsDetail(response: NewsDetail.Fetch.Response)
}

final class NewsDetailPresenter: NewsDetailPresentationLogic {

    weak var viewController: NewsDetailDisplayLogic?
    func presentNewsDetail(response: NewsDetail.Fetch.Response) {
        viewController?.displayNewsDetail(
            viewModel: NewsDetail.Fetch.ViewModel(
                image: response.new?.urlToImage ?? "",
                title: response.new?.title ?? "",
                detailDescription: response.new?.articleDescription ?? "",
                publishDate: response.new?.publishedAt ?? ""
            )
        )
    }
}
