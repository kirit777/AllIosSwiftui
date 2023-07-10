//
//  ScrapView.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI

struct ScrapView_Previews: PreviewProvider {
    static var previews: some View {
        ScrapView()
    }
}



struct ScrapView: View {
    let longText = "This is a long text that moves from right to left if it exceeds the width of the screen."
    @State private var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            Text(longText)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -offset, y: 0)
                .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
                .onAppear {
                    withAnimation {
                        offset = geometry.size.width + textWidth
                    }
                }
        }
    }
    
    private var textWidth: CGFloat {
        let text = NSAttributedString(string: longText, attributes: [.font: UIFont.systemFont(ofSize: 20)])
        let textWidth = text.boundingRect(with: CGSize(width: screenWidth, height: 10), options: .usesLineFragmentOrigin, context: nil).width
        return textWidth
    }
}

