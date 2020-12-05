//
//  NewsModels.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

// swiftlint:disable nesting
enum News {

    enum Fetch {

        struct Request {
            let country: String
        }

        struct Response {
            let news: [Article]
        }

        struct ViewModel {
            let news: [News.Fetch.ViewModel.New]

            struct New {
                let date: String?
                let title: String?
                let image: String?
            }
        }
    }
}
//swiftlint:enable nesting
