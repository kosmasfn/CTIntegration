//
//  WebViewExtension.swift
//  cttest
//
//  Created by Kosmas Ndruru on 18/03/24.
//

import Foundation

class WebViewExtension {
    
    static func getContent(){
        getHtml("https://www.google.com", completion: { html, error in
            if let e = error {
                print(e)
                // handle your error
                return
            }
            print(html as Any)
            DispatchQueue.main.async {
                //update your UI on the main thread
            }
        })
    }
    
    static func getHtml(_ urlString: String, completion: @escaping (String?, Error?) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async(execute: {
            guard let url = URL(string: urlString) else {
                print("URLError: \(urlString) doesn't seem to be a valid URL")
                return completion(nil, URLError.init(URLError.Code.badURL))
            }

            do {
                let html = try String(contentsOf: url, encoding: .ascii)
                print("HTML: \(html)")
                return completion(html, nil)
            } catch let error {
                print("Error: \(error)")
                return completion(nil, error)
            }
        })
    }
}
