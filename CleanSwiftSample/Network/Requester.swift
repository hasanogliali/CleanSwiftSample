//
//  Requester.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 4.12.2020.
//

import Foundation
import UIKit
import Alamofire

enum NetworkResponse<T> {
    case httpSuccess(T)
    case httpFail(Error)
}

protocol ProviderProtocol {
    func request<T: Decodable>(model: T.Type,
                               parameters: [String: String],
                               completion: @escaping (NetworkResponse<T>) -> Void)
}

class Requester: ProviderProtocol {

    private lazy var baseUrl = "https://newsapi.org/v2/top-headlines?"

    func request<T: Decodable>(model: T.Type,
                               parameters: [String: String] = [:],
                               completion: @escaping (NetworkResponse<T>) -> Void) {
        var queryParams = parameters
        queryParams["apiKey"] = "93b6e88ee27d4a9e8d5947008eab41db"
        let urlString = prepareUrl(params: queryParams)
    AF.request(urlString, method: .get).responseData { data in
            switch data.result {
            case let .success(responseData):
                do {
                    let model = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.httpSuccess(model))
                } catch let error as NSError {
                    completion(.httpFail(error))
                }
            case .failure(let error):
                completion(.httpFail(error))
            }
        }
    }

    private func prepareUrl(params: [String: String]) -> String {
        var resultUrl = baseUrl
        params.forEach { resultUrl += "\($0.key)=\($0.value)&" }
        resultUrl.removeLast()
        return resultUrl
    }
}

// https://newsapi.org/v2/top-headlines?apiKey=93b6e88ee27d4a9e8d5947008eab41db&country=tr
