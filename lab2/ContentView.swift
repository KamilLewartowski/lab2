//
//  ContentView.swift
//  lab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI
/* struct ContentView: View {
    var contents = ["😀", "😁", "😂", "🤣", "😃", "😄", "😅", "😆"]
    
    var body: some View {
        VStack {
            ForEach(contents, id: \.self) { content in
                CardView(content: content)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/

struct ContentView: View {
    @State private var contents = Theme.emojis.symbols.shuffled()
    @State private var selectedTheme = Theme.emojis
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .padding()
            HStack {
                ThemeButton(theme: .emojis, selectedTheme: $selectedTheme)
                ThemeButton(theme: .animals, selectedTheme: $selectedTheme)
                ThemeButton(theme: .flags, selectedTheme: $selectedTheme)
            }
            .padding()
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                    ForEach(contents.indices, id: \.self) { index in
                        CardView(content: contents[index], color: selectedTheme.color)
                    }
                }
                .padding()
            }
            Spacer()
        }
        .onChange(of: selectedTheme) { newValue in
                    contents = selectedTheme.symbols.shuffled()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
