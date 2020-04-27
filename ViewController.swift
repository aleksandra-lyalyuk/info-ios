//
//  ViewController.swift
//  webInfoenergo_
//
//  Created by Александра Лялюк on 18.04.2020.
//  Copyright © 2020 Александра Лялюк. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = URLRequest(url: URL(string: "http://lk.tatgencom.ru")!)
        webView.load(request)
    }
}

