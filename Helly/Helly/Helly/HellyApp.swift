//
//  HellyApp.swift
//  Helly
//
//  Created by Kirit on 27/07/23.
//

import SwiftUI

@main
struct HellyApp: App {
    
    @State var isSplash:Bool = true
    @State var isSplash2:Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isSplash{
                SplashScreen2(isSplash:$isSplash)
            }else{
                if isSplash2 {
                    SplashScreen2(isSplash: $isSplash2)
                }else{
                    HomeScreen()
                }
            }
        }
    }
}
