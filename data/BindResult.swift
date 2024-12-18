//
//  BindResult.swift
//  cttest
//
//  Created by Kosmas Ndruru on 19/03/24.
//

import Foundation
import RealmSwift

class BindResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {
    
    var results: Results<Element>
    private var token: NotificationToken!

    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
}
