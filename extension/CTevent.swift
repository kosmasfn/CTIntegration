//
//  CT.swift
//  cttest
//
//  Created by Kosmas Ndruru on 15/03/24.
//

import Foundation
import CleverTapSDK

class CTevent {
    
    static func onUserLogin(){
        let birthday = NSDateComponents()
        birthday.day = 24
        birthday.month = 2
        birthday.year = 1982
        let bornday = NSCalendar.current.date(from: birthday as DateComponents)
        let profile = [
            "Name": "zuck",
            "Email": "zuck@meta.com",
            "Phone": "+100000000000",
            "Gender": "M",
            "Identity": "00000000",
            "Photo": "https://hips.hearstapps.com/hmg-prod/images/of-facebook-mark-zuckerberg-walks-to-lunch-following-a-news-photo-1683662107.jpg?crop=0.170xw:0.200xh;0.400xw,0.101xh&resize=1200:*",
            "DOB": bornday! as AnyObject,
            "Customer Type": "Silver",
            "Prefered Language": "English",
            "City": "New York",
            "District": "New York",
            "Country": "USA"
        ] as [String : Any]
        CleverTap.sharedInstance()?.onUserLogin(profile)
        CleverTap.setLocation(CLLocationCoordinate2D(latitude: 40.6976312, longitude: -74.1444873))
    }
    
    static func onHomePageVisited() {
        let props = [
            "Page ID": 1,
            "Page Name": "Home",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Home Page Visited", withProps: props)
    }
    
    static func onInboxPageVisited() {
        let props = [
            "Page ID": 2,
            "Page Name": "Inbox",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Inbox Page Visited", withProps: props)
    }
    
    static func onFoodPageVisited() {
        let props = [
            "Page ID": 34,
            "Page Name": "Food",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Food Page Visited", withProps: props)
    }
    
    static func onFavoritePageVisited() {
        let props = [
            "Page ID": 4,
            "Page Name": "Favorite",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Favorite Page Visited", withProps: props)
    }
    
    static func onFavoriteToggleOn(isOn: Bool) {
        let props = [
            "Page ID": 40,
            "Favorite": isOn,
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Favorite Toggle Changed", withProps: props)
    }
    
    static func onProfilePageVisited() {
        let props = [
            "Page ID": 12,
            "Page Name": "Profile",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Profile Page Visited", withProps: props)
    }
    
    static func onHikeShow(type: String) {
        let props = [
            "Hike Type": type,
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Hike " + type + " Show", withProps: props)
    }
    
    static func onPageDetailViewed() {
        let props = [
            "Page ID": 7,
            "Page Name": "Page Detail",
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Page Detail Viewed", withProps: props)
    }
    
    static func onFavorite(landmark: Landmark) {
        let props = [
            "Place ID": landmark.id,
            "Place Name": landmark.name,
            "Place Image": landmark.image,
            "Place Description": landmark.description
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Favorite Page Added", withProps: props)
    }
    
    static func onNotificationChanged(isEnable: Bool) {
        let props = [
            "Profile Setting": "Notification",
            "is Enable": isEnable
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent("Notification Enable Changed", withProps: props)
    }
    
    static func onBestPlaceVisited(pageName: String) {
        let props = [
            "Page Name": pageName
            ] as [String : Any]
        CleverTap.sharedInstance()?.recordEvent(pageName + " Visited", withProps: props)
    }
}
