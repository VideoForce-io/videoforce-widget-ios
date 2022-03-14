//
//  VFWidget.swift
//  VFWidget
//
//  Created by VideoForce on 07.03.2022.
//

import UIKit
import WebKit
import WKWebViewRTC

public class VFWidget: UIViewController, WKNavigationDelegate {
    
    public var model: VFWidgetModel!
    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        showActivityIndicatory(uiView: view)
        showWebView(uiView: view)
        showButtonClose(uiView: view)
    }
    
    func showActivityIndicatory(uiView: UIView) {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        activityIndicator.center = uiView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        uiView.addSubview(activityIndicator)
    }
    
    func showWebView(uiView: UIView) {
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        webView.navigationDelegate = self
        _ = WKWebViewRTC(wkwebview: webView, contentController: webView.configuration.userContentController)
        if UUID(uuidString: model.widgetId) != nil {
            let url = URL(string: "https://widget.videoforce-dev.com/webview.html?widgetId=\(model.widgetId)")!
            webView.load(URLRequest(url: url))
            uiView.addSubview(webView)
        } else {
            print("Widget ID string with hypens is not valid")
        }
    }
    
    func showButtonClose(uiView: UIView) {
        let buttonClose = UIButton(frame: CGRect(x: view.frame.width-35, y: 15, width: 20, height: 20))
        //buttonClose.setTitle("X", for: .normal)
        //buttonClose.setImage(UIImage(named: "close"), for: .normal)
        buttonClose.backgroundColor = .white
        buttonClose.setTitleColor(UIColor.black, for: .normal)
        buttonClose.addTarget(self, action: #selector(self.buttonCloseHandler), for: .touchUpInside)
        //uiView.addSubview(buttonClose)
    }
    
    @objc func buttonCloseHandler() {
        dismiss(animated: true, completion: nil)
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.showActivityIndicator(show: false)
        }
    }

    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}

