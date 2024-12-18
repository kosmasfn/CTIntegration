//
//  SearchViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 13/03/24.
//

import Foundation
import UIKit
import CleverTapSDK

class SettingViewController: UIViewController, CleverTapDisplayUnitDelegate{
    
    @IBOutlet weak var verticalStackView: UIStackView!
    
    var allButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        CleverTap.sharedInstance()?.setDisplayUnitDelegate(self)
        initUI()
        initNativeDisplay()
    }
    
    private let simpleMessageWithIconOnlyButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("SimpleMessageWithIconOnly", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    private let carouselMessageWithIconOnlyButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("CarouselMessageWithIconOnly", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    private let customKeyValueButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("CustomKeyValue", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    private let messageWithIconButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("MessageWithIcon", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    private let carouselMessageButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("CarouselMessage", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    private let simpleMessageButton: UIButton = {
       let button = UIButton()
       button.backgroundColor = .systemBlue
       button.setTitle("SimpleMessage", for: .normal)
       button.layer.cornerRadius = 7
       return button
   }()
    
    private func initUI(){
        for case let horizontalStackView as UIStackView in verticalStackView.arrangedSubviews {
            for case let button as UIButton in horizontalStackView.arrangedSubviews {
                allButtons.append(simpleMessageButton)
                allButtons.append(carouselMessageButton)
                allButtons.append(messageWithIconButton)
                allButtons.append(customKeyValueButton)
                allButtons.append(carouselMessageButton)
                allButtons.append(simpleMessageWithIconOnlyButton)
            }
        }
        self.view.addSubview(verticalStackView)
        self.simpleMessageButton.addTarget(self, action: #selector(simpleMessageButtonTapped), for: .touchUpInside)
        self.carouselMessageButton.addTarget(self, action: #selector(carouselMessageButtonTapped), for: .touchUpInside)
//        self.messageWithIconButton.addTarget(self, action: #selector(messageWithIconButtonTapped), for: .touchUpInside)
        self.simpleMessageButton.addTarget(self, action: #selector(simpleMessageButtonTapped), for: .touchUpInside)
        self.simpleMessageButton.addTarget(self, action: #selector(simpleMessageButtonTapped), for: .touchUpInside)
        self.simpleMessageButton.addTarget(self, action: #selector(simpleMessageButtonTapped), for: .touchUpInside)
    }
    
    @objc func simpleMessageButtonTapped(){
        CTevent.onBestPlaceVisited(pageName: "nativeDisplaySimpleMessage")
    }
    
    @objc func carouselMessageButtonTapped(){
        CTevent.onBestPlaceVisited(pageName: "nativeDisplayCarouselMessage")
    }
//    
//    @objc func simpleMessageButtonTapped(){
//        CTevent.onBestPlaceVisited(pageName: "nativeDisplayMessageWithIcon")
//    }
//    
//    @objc func simpleMessageButtonTapped(){
//        CTevent.onBestPlaceVisited(pageName: "nativeDisplayCustomKeyValue")
//    }
//    
//    @objc func simpleMessageButtonTapped(){
//        CTevent.onBestPlaceVisited(pageName: "nativeDisplayCarouselMessageWithIconOnly")
//    }
//    
//    @objc func simpleMessageButtonTapped(){
//        CTevent.onBestPlaceVisited(pageName: "nativeDisplaySimpleMessageWithIconOnly")
//    }
    
    private func initNativeDisplay(){
        let displayunit = CleverTap.sharedInstance()?.getAllDisplayUnits()
        displayunit?.forEach({ unit in printDisplayUnit(unit: unit)})
    }
    
    private func printDisplayUnit(unit : CleverTapDisplayUnit?){
        print(setDefaultValue(name: " unitID", value: unit?.unitID))
        print(setDefaultValue(name: " type", value: unit?.type))
        print(setDefaultValue(name: " bgColor", value: unit?.bgColor))
        print(setDefaultValue(name: " customExtra", value: ""))
        unit?.customExtras?.forEach({ (key: AnyHashable, value: Any) in
            print(setDefaultValue(name: key as? String ?? "", value: value as? String))
        })
        printDisplayUnitContent(contents: unit?.contents)
    }
    
    private func printDisplayUnitContent(contents: [CleverTapDisplayUnitContent]?){
        contents?.forEach({ content in
            print(setDefaultValue(name: "title", value: content.title))
            print(setDefaultValue(name: "titleColor", value: content.titleColor))
            print(setDefaultValue(name: "message", value: content.message))
            print(setDefaultValue(name: "messageColor", value: content.messageColor))
            print(setDefaultValue(name: "description", value: content.description))
            print(setDefaultValue(name: "mediaUrl", value: content.mediaUrl))
            print(setDefaultValue(name: "videoPosterUrl", value: content.videoPosterUrl))
            print(setDefaultValue(name: "iconUrl", value: content.iconUrl))
            print(setDefaultValue(name: "actionUrl", value: content.actionUrl))
        })
    }
    
    private func setDefaultValue(name: String, value: String?) -> String {
        return name + " : " + (value ?? "")
    }

}
