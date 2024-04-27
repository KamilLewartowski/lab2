import SwiftUI

struct CardView: View {
    var content: String
    @State private var isFaceUp = false
    
    var body: some View {
        Group {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .overlay(
                        Text(content)
                            .font(.largeTitle)
                    )
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            }
        }
        .opacity(isFaceUp ? 1 : 0)
    }
}
