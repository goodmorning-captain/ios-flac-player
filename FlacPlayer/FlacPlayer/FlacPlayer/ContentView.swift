//
//  ContentView.swift
//  FlacPlayer
//
//  Created by Julian Matteoni on 8/7/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "music.note.list")
                    .font(.system(size: 60))
                    .foregroundColor(.accentColor)
                
                Text("FLAC Player")
                    .font(.largeTitle)
                    .bold()
                
                NavigationLink("Add Music", destination: FilePickerView())
                    .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
