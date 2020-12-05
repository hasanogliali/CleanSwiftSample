//
//  SplashViewController.swift
//  CleanSwiftSample
//
//  Created by Ali Hasanoğlu on 5.12.2020.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let storyBoard = UIStoryboard(name: "News", bundle: nil)
            let destVC = storyBoard.instantiateInitialViewController()
            destVC?.modalPresentationStyle = .overFullScreen
            self.present(destVC!, animated: false, completion: nil)
        }
    }
}
