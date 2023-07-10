//
//  ContentView.swift
//  KrusCars
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOpen:Bool = false
    
    
    var body: some View {
        VStack {
            if isOpen{
                HomeScreen()
                    
            }else{
                CustomSplashScreen(isOpen: $isOpen)
            }
        }
        .frame(width: screenWidth,height: screenHeight)
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
