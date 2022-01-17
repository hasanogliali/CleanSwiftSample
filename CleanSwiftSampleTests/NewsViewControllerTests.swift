//
//  NewsViewControllerTests.swift
//  CleanSwiftSampleTests
//
//  Created by Ali Hasanoğlu on 25.08.2021.
//

import XCTest
@testable import CleanSwiftSample

class NewsViewControllerTests: XCTestCase {

    var viewController: NewsViewController?

    override func setUp() {
        let storyBoard = UIStoryboard(name: "News", bundle: nil)
        viewController = storyBoard.instantiateViewController(
            identifier: "NewsViewController"
        )

        viewController?.loadView()
        viewController?.viewDidLoad()
    }

}
