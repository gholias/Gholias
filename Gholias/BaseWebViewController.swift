//
//  WebViewController.swift
//  Gholias
//
//  Created by Felipe Oliveira on 2/27/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import UIKit

public class BaseWebViewController: BaseViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak public var loadingview: LoadingView?

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.webview.delegate = self
        self.loadingview?.hide()

        // Do any additional setup after loading the view.
    }
    
    public func loadAddress(urlAddress: String) {
        let url = NSURL(string: urlAddress)
        let request = NSURLRequest(URL: url!)
        self.webview.loadRequest(request)
    }
    
    public func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        print("Webview fail with error \(error)");
    }
    
    public func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    public func webViewDidStartLoad(webView: UIWebView) {
        NSLog("webViewDidStartLoad")
        self.loadingview?.show()
        self.webview.hidden = true
    }
    
    public func webViewDidFinishLoad(webView: UIWebView) {
                NSLog("webViewDidFinishLoad")
        self.loadingview?.hide()
        self.webview.hidden = false
    }

}
