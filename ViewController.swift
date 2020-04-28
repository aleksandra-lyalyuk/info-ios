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

class ViewController: UIViewController, WKNavigationDelegate{
    @IBOutlet var Activity: UIActivityIndicatorView! 
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: "http://lk.tatgencom.ru")!)
        webView.load(request)
        let button = UIButton()
        button.setImage(UIImage(systemName:"arrow.clockwise")!, for: .normal)
        button.addTarget(self, action: #selector(reload), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        webView.navigationDelegate = self
        
        // add activity
        self.Activity.startAnimating()
        self.webView.navigationDelegate = self
        self.Activity.hidesWhenStopped = true
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Activity.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Activity.stopAnimating()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Activity.startAnimating()
    }
    @objc func reload(){
        
        webView.load(URLRequest(url: URL(string:"about:blank")!))
        Activity.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        let request = URLRequest(url: URL(string: "http://lk.tatgencom.ru")!)
    self.webView.load(request)
        }
    }
}
