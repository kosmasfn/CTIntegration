//
//  WebView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 17/03/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    @State var content: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.evaluateJavaScript("document.getElementsByClassName('container')[0].innerText") { innerHTML, error in
            //setContent(text: innerHTML as! String)
            print(innerHTML ?? (error?.localizedDescription ?? " e ") + " Error")
        }

        //webView.loadHTMLString(content, baseURL: nil)
    }
    
    private func setContent(text: String){
        self.content = text
    }
}

#Preview {
    WebView(url: URL(fileURLWithPath: "https://www.test.com/"), content: "as,maskjdbaskjhdkahs")
}
