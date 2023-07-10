//
//  ContentView.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSplash:Bool = true
    
    var body: some View {
        if isSplash{
            CustomSplashScreen(isSplash: $isSplash)
        }else{
            MusicListScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
