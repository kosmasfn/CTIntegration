//
//  RealmExtension.swift
//  cttest
//
//  Created by Kosmas Ndruru on 18/03/24.
//

import Foundation
import RealmSwift

class RealmExtension{
    
    static func uploadArticle(name: String, url: String){
        let article = Article(value: ["name": name, "url": url])
        let realm = try! Realm()
        try! realm.write{
            realm.add([article])
        }
    }
    
//    static func getArticles() -> [Article]{
//        let realm = try! Realm()
//        var result = realm.objects(Article.self)
//    }
}

