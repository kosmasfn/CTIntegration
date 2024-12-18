//
//  DownloadsViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 13/03/24.
//

import Foundation
import UIKit
import CleverTapSDK

class InBoxViewController: UIViewController, CleverTapInboxViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        CTevent.onInboxPageVisited()
        initInboxDisplay()
        initInboxStyle()
    }
    
    private func initInboxDisplay(){
        CleverTap.sharedInstance()?.initializeInbox(callback: ({ (success) in
                let messageCount = CleverTap.sharedInstance()?.getInboxMessageCount()
                let unreadCount = CleverTap.sharedInstance()?.getInboxMessageUnreadCount()
                let appInboxPayload = CleverTap.sharedInstance()?.getAllInboxMessages()
            print("Inbox Message:\(String(describing: messageCount))/\(String(describing: unreadCount)) unread")
            print("Inbox Payload:\(String(describing: appInboxPayload))")
        }))
    }
    
    private func initInboxStyle(){
       // config the style of App Inbox Controller
       let style = CleverTapInboxStyleConfig.init()
       style.title = "App Inbox"
       style.backgroundColor = UIColor.white
       style.messageTags = ["copy", "that"]
       style.navigationBarTintColor = UIColor.white
       style.navigationTintColor = UIColor.white
       style.tabUnSelectedTextColor = UIColor.white
       style.tabSelectedTextColor = UIColor.white
       style.tabSelectedBgColor = UIColor.white
       style.firstTabTitle = "My First Tab"
        
        if let inboxController = CleverTap.sharedInstance()?.newInboxViewController(with: style, andDelegate: self) {
            let navigationController = UINavigationController.init(rootViewController: inboxController)
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    //Initialize App Inbox
    func initializeInbox(callback: CleverTapInboxSuccessBlock) {
    }

    //Get Inbox Message Count
    func getInboxMessageCount() -> Int {
        return 10
    }

    //Get Inbox Unread Count
    func getInboxMessageUnreadCount() -> Int {
        return CleverTap.sharedInstance()?.getInboxMessageUnreadCount() ?? 0
    }

    //Get All messages
    func getAllInboxMessages() -> [CleverTapInboxMessage]? {
        return (CleverTap.sharedInstance()?.getAllInboxMessages())
    }

    //Get only Unread messages
    func getUnreadInboxMessages() -> [CleverTapInboxMessage]? {
        return CleverTap.sharedInstance()?.getUnreadInboxMessages()
    }

    //Get message object belonging to the given message id only. Message id must be a String
    func getInboxMessageForID(messageId: String?) -> CleverTapInboxMessage? {
        return CleverTap.sharedInstance()?.getInboxMessage(forId: messageId ?? "")
    }

    //Delete message from the Inbox. Message must be a String
    func deleteInboxMessage(_ message: CleverTapInboxMessage) {
        
    }

    //Mark Message as Read
    func markReadInboxMessage(_ message: CleverTapInboxMessage) {
    }

    //Callback on Inbox Message update/delete/read (any activity)
    func registerInboxUpdatedBlock(_ block: CleverTapInboxUpdatedBlock) {
    }

    //Mark Message as Read. Message id must be a String
    func markReadInboxMessageForID(messageId: String) {
    }

    //Delete message from the Inbox. Message id must be a String
    func deleteInboxMessageForID(messageId: String) {
        CleverTap.sharedInstance()?.deleteInboxMessages(forIDs: ["1710929043_1711014870", "1710928791_1711014870", "1710929106_1711014870", "1710929081_1711014870", "1710929081_1711014816", "1710929043_1711014816", "1710928791_1711014816", "1710929106_1711014816", "1710929043_1711014107", "1710928791_1711014107", "1710929106_1711014107", "1710929081_1711014107", "1710928791_1711013995", "1710929106_1711013995", "1710929081_1711013995", "1710929043_1711013995", "1710929081_1711006506", "1710929043_1711006506", "1710928791_1711006506", "1710929106_1711006506", "1710928791_1711004904", "1710929106_1711004904", "1710929081_1711004904", "1710929043_1711004904", "1710929081_1710931670", "1710929043_1710931670", "1710928791_1710931670", "1710929106_1710931670",  ])
    }

    //Mark Messages as Read. Message ids must be an array of strings
    func markReadInboxMessagesForIDs(messageIds: [String]) {
    }

    //Delete messages from the Inbox. Message ids must be an array of strings
    func deleteInboxMessagesForIDs(messageIds: [String]) {
    }
}
