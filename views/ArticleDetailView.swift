//
//  ReadingDetailView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 17/03/24.
//

import SwiftUI
import UIKit
import AVFoundation

struct ArticleDetailView: View {
    
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    @State private var message = ""
    var body: some View {
        VStack{
            Text("Read Text")
            TextEditor(text: $message)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .background(.gray)
            Button(
                action: {
                    URL.convertToVoice(url: "https://medium.com/@alexefimenko/pkl-a-new-configuration-file-format-from-apple-ab74be4222e9",
                         synthesizer: speechSynthesizer)
                }
            ){
                Text("Read")
            }
        }
    }
}

#Preview {
    ArticleDetailView()
}
