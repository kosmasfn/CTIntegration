//
//  UpcomingViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 13/03/24.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        CTevent.onInboxPageVisited()
    }
}
