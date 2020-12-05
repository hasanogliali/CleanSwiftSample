//
//  NewsCell.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var ivNews: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(viewModel: News.Fetch.ViewModel.New) {
        labelDate.text = viewModel.date
        labelDetail.text = viewModel.title
        ivNews.sd_setImage(with: URL(string: viewModel.image ?? ""))
    }
}
