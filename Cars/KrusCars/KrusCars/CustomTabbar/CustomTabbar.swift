//
//  CustomTabbar.swift
//  KrusCars
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI

//
//  CustomTabbar.swift
//  Finance
//
//  Created by Kirit on 07/07/23.
//

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab:Int
    var body: some View {
        HStack{
            Spacer()
            CustomTabbarBtn(name: "Home",img: "house.fill", selectedTab: $selectedTab,current: 0)
            Spacer()
            CustomTabbarBtn(name: "Profite",img: "cart.fill", selectedTab: $selectedTab,current: 1)
            Spacer()
            CustomTabbarBtn(name: "Charts",img: "map.fill", selectedTab: $selectedTab,current: 2)
            Spacer()
            CustomTabbarBtn(name: "Profile",img: "person.fill", selectedTab: $selectedTab,current: 3)
            Spacer()
        }
        .frame(height: 50)
        .background(.black.opacity(1.0))
        .cornerRadius(10)
        .padding(.horizontal , 15)
    }
}

//struct CustomTabbar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabbar()
//    }
//}


struct CustomTabbarBtn: View {
    var name:String!
    var img:String!
    @Binding var selectedTab:Int
    var current:Int!
    var body: some View {
        VStack{
            
            if selectedTab == current{
                Button(action: {
                    selectedTab = current
                }, label: {
                    VStack{
//                        RoundedRectangle(cornerRadius: 5)
//                            .frame(width: 40, height: 0)
//                            .foregroundColor(Color.green.opacity(0.5))
                        Image(systemName: img)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .padding(.top , 0)
                            .foregroundColor(Color.white.opacity(1.0))
                        
//                        Text(name)
//                            .font(.system(size: 10))
//                            .padding(.top , 0)
//                            .foregroundColor(Color.green.opacity(0.5))
                    }
                })
                
            }else{
                
                Button(action: {
                    selectedTab = current
                }, label: {
                    VStack{
//                        RoundedRectangle(cornerRadius: 5)
//                            .frame(width: 0, height: 0)
                        Image(systemName: img)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .padding(.top , 0)
                            .tint(Color.gray.opacity(0.4))
//                        Text(name)
//                            .font(.system(size: 10))
//                            .padding(.top , 0)
//                            .foregroundColor(Color.gray)
                    }
                })
                
               
            }
        }
    }
}
