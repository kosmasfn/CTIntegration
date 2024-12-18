//
//  ReadingListView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 17/03/24.
//

import SwiftUI
import WebKit
import RealmSwift
import Realm

struct ArticleListView: View {
    
    @State private var message = ""
    @ObservedObject var articles = BindResults(results: try! Realm().objects(Article.self))
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: ArtilcleView()) {
                    Text("Add New Article")
                }
                ForEach(articles.results, id: \.url){ article in
                    NavigationLink(destination: ArticleDetailView()) {
                        Text(article.description)
                    }
                }
            }
        }
//        .task {
//            RealmExtension.getArticles()
//        }
    }
}

#Preview {
    ArticleListView()
}
