//
//  ContentView.swift
//  Finance
//
//  Created by Kirit on 07/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab:Int = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab, content: {
                HomeScreen()
                    .tag(0)
                
                ProfiteScreen()
                    .tag(1)
                
                ChartsScreen()
                    .tag(2)
                
                ProfileScreen()
                    .tag(3)
                
            })
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            //Spacer()
            CustomTabbar(selectedTab: $selectedTab)
                .toolbarBackground(.hidden, for: .tabBar)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



