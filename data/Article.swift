//
//  Article.swift
//  cttest
//
//  Created by Kosmas Ndruru on 18/03/24.
//

import Foundation
import RealmSwift

class Article: Object{
    @Persisted(primaryKey: true) var id: UUID
    @Persisted var name: String? = ""
    @Persisted var url: String? = ""
    @Persisted var content: String? = ""
}
