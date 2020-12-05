//
//  NewsDetailModels.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

//swiftlint:disable nesting
enum NewsDetail {

    enum Fetch {

        struct Request {

        }

        struct Response {
            var image: String
            var title: String
            var detailDescription: String
            var publishDate: String
        }

        struct ViewModel {
            var image: String
            var title: String
            var detailDescription: String
            var publishDate: String
        }
    }
}
//swiftlint:enable nesting
