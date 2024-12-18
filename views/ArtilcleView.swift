//
//  ReadingView.swift
//  cttest
//
//  Created by Kosmas Ndruru on 17/03/24.
//

import SwiftUI
import AVFoundation

struct ArtilcleView: View {
    @State private var name: String = "Name"
    @State private var url: String = "URL"
    @State private var speechSynthesizer = AVSpeechSynthesizer()
    var body: some View {
        List{
            Text("New Article")
            TextEditor(text: $name)
                .frame(height: 40)
                .background(.gray).opacity(0.2)
            TextEditor(text: $url)
                .frame(height: 80)
                .background(.gray).opacity(0.2)
            Button {
                //RealmExtension.uploadArticle(name: name, url: url)
                URL.convertToVoice(url: url,
                     synthesizer: speechSynthesizer)
            } label: {
                Label("Add New Article", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.gray)
            }.cornerRadius(100.0)
        }
    }
}

#Preview {
    ArtilcleView()
}
