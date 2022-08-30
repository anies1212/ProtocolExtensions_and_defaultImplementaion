//
//  ViewController.swift
//  ProtocolExtensions_and_DefaultsImplementation
//
//  Created by 新垣 清奈 on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Go", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
        button.frame = CGRect(x: (view.frame.width/2)-100, y: (view.frame.height/2)-50, width: 200, height: 50)
    }

    @objc private func tappedButton(){
        let secondVC = SecondViewController.instanstiate()
        present(secondVC, animated: true)
    }
}

class SecondViewController: UIViewController, Storyboarded {
    static var storyboardName: String {
        "SecondViewController"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol Storyboarded {
    static var storyboardName: String { get }
    static func instanstiate() -> UIViewController
}
extension Storyboarded where Self: UIViewController {
    static var storyboardName: String {
        "Main"
    }

    static func instanstiate() -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self))
    }
}
