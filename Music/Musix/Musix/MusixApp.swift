//
//  MusixApp.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI

@main
struct MusixApp: App {
    @State var isSplash:Bool = true
    @State var isSplash2:Bool = true
    
    var body: some Scene {
        WindowGroup {
           // ContentView()
            
            if isSplash{
                SplashScreen2(isSplash:$isSplash)
            }else{
                if isSplash2 {
                    CustomSplashScreen(isSplash: $isSplash2)
                }else{
                    MusicListScreen()
                }
            }
            
        }
    }
}
