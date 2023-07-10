//
//  CustomSplashScreen.swift
//  KrusCars
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI

struct CustomSplashScreen: View {
    @Binding var isOpen:Bool
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    Spacer()
                    Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                    Text("Krus Cars")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.top , 60)
                
                HStack{
                    Image("iconCar")
                        .resizable()
                        .frame(width: 550,height: 350)
                        .aspectRatio(contentMode: .fit)
                }.padding(.top , 50)
                
                
                VStack{
                    Text("Luxury cars \n Enjoy the premium ")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.top , 20)
                        .multilineTextAlignment(.center)
                    
                    Text("Find a variety of the cars of Your dreams , at a good Price and quality premium")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .padding(.top , 20)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal , 20)
                    
                    Button(action: {
                        isOpen = true
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Get started ")
                                .foregroundColor(.black)
                                .font(.system(size: 22))
                                .fontWeight(.medium)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal , 20)
                        .padding(.top , 20)
                    })
                    
                    HStack(){
                        Spacer()
                        Text("Already have an account ? ")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                        
                        Button(action: {
                            
                        }, label: {
                            HStack{
                                Text("Sign in")
                                    .foregroundColor(.white)
                                    .font(.system(size: 22))
                                    .fontWeight(.medium)
                            }
                            .cornerRadius(10)
                            .padding(.leading , -5)
                        })
                        
                        Spacer()
                    }
                    .padding(.top , 20)
                }
                
                Spacer()
            }
        }.frame(width: screenWidth,height: screenHeight)
        .background(.black)
    }
}

//struct CustomSplashScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSplashScreen()
//    }
//}
