//
//  NewsDetailViewController.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import UIKit
import SDWebImage

protocol NewsDetailDisplayLogic: class {
    func displayNewsDetail(viewModel: NewsDetail.Fetch.ViewModel)
}

final class NewsDetailViewController: UIViewController {

    var interactor: NewsDetailBusinessLogic?
    var router: (NewsDetailRoutingLogic & NewsDetailDataPassing)?

    @IBOutlet weak var ivNews: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    @IBOutlet weak var labelDate: UILabel!

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = NewsDetailInteractor()
        let presenter = NewsDetailPresenter()
        let router = NewsDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchNewsDetail(request: NewsDetail.Fetch.Request())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension NewsDetailViewController: NewsDetailDisplayLogic {
    func displayNewsDetail(viewModel: NewsDetail.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.ivNews.sd_setImage(with: URL(string: viewModel.image))
            self.labelTitle.text = viewModel.title
            self.labelDescription.text = viewModel.detailDescription
            self.labelDate.text = viewModel.publishDate
        }
    }
}
