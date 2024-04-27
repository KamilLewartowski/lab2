//
//  CardView.swift
//  lab2
//
//  Created by student on 27/04/2024.
//
import SwiftUI
struct CardView: View {
    var content: String
    var color: Color
    
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
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(color)
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(color)
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        withAnimation {
                            isFaceUp.toggle()
                        }
                    }
            }
        }
        .opacity(isFaceUp ? 1 : 1)
    }
}
/*
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "😀")
    }
}
*/
