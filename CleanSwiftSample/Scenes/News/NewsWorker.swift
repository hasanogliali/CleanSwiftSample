//
//  NewsWorker.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import Foundation

final class NewsWorker {

    func getNews(request: NewsList.Request, completion: @escaping ((Result<NewsList, Error>) -> Void)) {

        Requester().request(model: NewsList.self, parameters: request.dictionary) { result in
            switch result {
            case .httpSuccess(let response):
                completion(.success(response))
            case .httpFail(let error):
                completion(.failure(error))
            }
        }
    }
}
