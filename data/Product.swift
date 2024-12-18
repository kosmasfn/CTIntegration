//
//  Product.swift
//  cttest
//
//  Created by Kosmas Ndruru on 13/03/24.
//

import Foundation

struct Product {
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}


#if DEBUG
extension Product {
    static var sampleData = [
        Product(
            title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0),
            notes: "Don't forget about taxi receipts"),
        Product(
            title: "Code review", dueDate: Date().addingTimeInterval(14000.0),
            notes: "Check tech specs in shared folder", isComplete: true),
        Product(
            title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0),
            notes: "Optometrist closes at 6:00PM"),
        Product(
            title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0),
            notes: "Collaborate with project manager", isComplete: true),
        Product(
            title: "Interview new project manager candidate",
            dueDate: Date().addingTimeInterval(60000.0), notes: "Review portfolio"),
        Product(
            title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0),
            notes: "Think different"),
        Product(
            title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0),
            notes: "Discuss trends with management"),
        Product(
            title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0),
            notes: "Ask about space heaters"),
        Product(
            title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),
            notes: "v0.9 out on Friday")
    ]
}
#endif
