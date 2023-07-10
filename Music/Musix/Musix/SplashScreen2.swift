//
//  SplashScreen2.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI

struct SplashScreen2: View {
    @Binding var isSplash:Bool
    @State private var isTimerExpired = false
    @State private var isAnimationStarted = false
    
    var body: some View {
        ZStack{
            
            // Background
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .blur(radius: 15) // Apply blur effect
            
            HStack {
                Spacer()
                
                HStack {
                    Image(systemName: "music.note")
                        .foregroundColor(.black)
                        .font(.system(size: 34))
                        .offset(x: isAnimationStarted ? 0 : -100)
                        .animation(.easeInOut(duration: 0.9))
                    
                    Text("Musix")
                        .foregroundColor(.black)
                        .font(.system(size: 34))
                        .fontWeight(.semibold)
                        .padding(.leading, 5)
                        .offset(x: isAnimationStarted ? 0 : 100)
                        .animation(.easeInOut(duration: 0.9))
                }
                
                Spacer()
            }
            .onAppear {
                withAnimation {
                    isAnimationStarted = true
                }
            }
            
        }.frame(width: screenWidth , height: screenHeight)
            .background(.black)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                    withAnimation{
                        isTimerExpired = true
                        isSplash = false
                    }
                }
            }
    }
}

//struct SplashScreen2_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashScreen2()
//    }
//}
