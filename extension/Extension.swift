//
//  FileExtension.swift
//  cttest
//
//  Created by Kosmas Ndruru on 18/03/24.
//

import Foundation
import SwiftUI
import AVFoundation

class FileExtension {
    @State var array: [jkasdfhlasdf] = {
        do {
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("article.json")

            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let items = try decoder.decode([jkasdfhlasdf].self, from: data)
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }()
    
    static func writeJSON(items: [jkasdfhlasdf]) {
        do {
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    .appendingPathComponent("article.json")

            let encoder = JSONEncoder()
            try encoder.encode(items).write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}

extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}

extension URL{
    static func convertToVoice(url: String, synthesizer: AVSpeechSynthesizer){
        if let url = URL(string: url) {
            do {
                let contents = try String(contentsOf: url)
                let content = contents.html2String
                
                let voice = AVSpeechSynthesisVoice(language: "en-US")
                let utterance = AVSpeechUtterance(string: content)
                utterance.voice = voice
                utterance.volume = 1
                utterance.accessibilityActivate()
                synthesizer.speak(utterance)
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                    print("Playback OK")
                    try AVAudioSession.sharedInstance().setActive(true)
                    print("Session is Active")
                } catch {
                    print(error)
                }
                
                
            
                
//                var newsList = FileExtension().array
//                var news = Article(name: "String", url: "String")
//                newsList.append(news)
//                FileExtension.writeJSON(items: newsList)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
}
