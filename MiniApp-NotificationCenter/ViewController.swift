//
//  ViewController.swift
//  MiniApp-NotificationCenter
//
//  Created by 近藤米功 on 2022/10/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(someFunc), name: .someName, object: nil)
    }

    @objc private func someFunc(notification: Notification) {
        if let num = notification.userInfo?["someKey"] as? Int {
            label.text = String(num)
        }
    }

    @IBAction func didTapButton(_ sender: Any) {
        NotificationCenter.default.post(name: .someName, object: nil,userInfo: ["someKey": 10])
    }

}

extension Notification.Name {
    static let someName = Notification.Name("someName")
}

