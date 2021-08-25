//
//  NewsViewController.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import UIKit

protocol NewsDisplayLogic: AnyObject {
    func displayNews(viewModel: News.Fetch.ViewModel)
}

final class NewsViewController: UIViewController {

    var interactor: NewsBusinessLogic?
    var router: (NewsRoutingLogic & NewsDataPassing)?

    var viewModel: News.Fetch.ViewModel?
    @IBOutlet weak var tableView: UITableView!

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
        let interactor = NewsInteractor(worker: NewsWorker())
        let presenter = NewsPresenter()
        let router = NewsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        interactor?.fetchNews(request: News.Fetch.Request(country: "tr"))
        tableView.registerNib(NewsCell.self, bundle: .main)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension NewsViewController: NewsDisplayLogic {
    func displayNews(viewModel: News.Fetch.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.news.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: NewsCell.self, indexPath: indexPath)
        guard let model = self.viewModel?.news[indexPath.row]  else {
            return UITableViewCell()
        }
        cell.configure(viewModel: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToNewsDetail(index: indexPath.row)
    }
}
