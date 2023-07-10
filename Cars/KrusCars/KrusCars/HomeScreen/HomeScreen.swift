//
//  HomeScreen.swift
//  KrusCars
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI

struct HomeScreen: View {
    @State var selectedTab:Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    HStack{
                        Image(systemName: "heart.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                        Text("Krus Cars")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "bell.fill")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
                        })
                    }
                }
//                .background(Color.gray.opacity(0.5))
                .padding(.horizontal , 30)
                
                TabView(selection: $selectedTab, content: {
                    HomeFragment()
                        .tag(0)
                    
                    CartScreen()
                        .tag(1)
                    
                    MapScreen()
                        .tag(2)
                    
                    ProfileScreen()
                        .tag(3)
                    
                })
//                .background(Color.gray.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            }
            .background(Color.gray.opacity(0.5))
            //Spacer()
            CustomTabbar(selectedTab: $selectedTab)
                .toolbarBackground(.hidden, for: .tabBar)
            
        }
        .frame(width: screenWidth,height: screenHeight - 80)
        .padding()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
