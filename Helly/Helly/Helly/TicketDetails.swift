//
//  TicketDetails.swift
//  Helly
//
//  Created by Kirit on 27/07/23.
//

import SwiftUI

struct TicketDetails: View {
    var event:Event!
    var name:String!
    var date:String!
    @Binding var isPresentedBook:Bool
    var body: some View {
        ZStack{
            LinearGradient(
                        gradient: Gradient(colors: [Color.COLOR_51_19_92, Color.COLOR_37_21_95]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        )
            
            VStack{
                
                HStack{
                    Button(action: {
                        isPresentedBook = false
                    }, label: {
                        ZStack {
                            Image(systemName: "chevron.left")
                                .imageScale(.medium)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .frame(width: 40,height: 40)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(15)
                        .padding(10)
                    })
                    .frame(width: 40,height: 40)
                   
                    Spacer()
                }
                .padding(.top , 50)
                .padding(.horizontal , 20)
                
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        HStack{
                            Image(event.image)
                                .resizable()
                                .cornerRadius(10)
                                .foregroundColor(.white.opacity(0.6))
                        }.frame(height: 400)
                            .padding(.top , 5)
                        
                        HStack{
                            Text(event.name)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .padding(.top , 15)
                            Spacer()
                        }
                        
                        HStack{
                            Text(event.address)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .padding(.top , 0)
                            Spacer()
                        }
                        
                        VStack {
                            Divider()
                                .background(Color.white)
                        }.padding(.top , 5)
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Location:")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                Text("\(event.address) , \(event.city)")
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 0)
                                
                            }
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Name:")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                Text(name)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 0)
                                
                            }
                            Spacer()
                            VStack(alignment:.leading){
                                Text("Date:")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                Text(date)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 0)
                                
                            }
                        }
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Time:")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                Text(event.fromTime)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 0)
                                
                            }
                            Spacer()
                            VStack(alignment:.leading){
                                Text("Dresscot:")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                Text("Halloween")
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.top , 0)
                                
                            }
                        }
                        
                        
                        VStack {
                            Divider()
                                .background(Color.white)
                        }.padding(.top , 5)
                        
                        
                        BarcodeStrip(barcodeData: [true, false, true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false,true, true, false, true, true, false, true, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true,true, true, false, true, true, false, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true,true, true, false, true, true, false, true], barWidth: 2, barHeight: 80)
                            .padding(.top , 15)
                        
                        HStack{
                            
                        }.frame(height: 10)
                        
                    }
                    .padding()
                    .background(Color.COLOR_58_33_131)
                    .cornerRadius(15)
                    .padding(.horizontal , 20)
                }
            }
        }.frame(width: screenWidth , height: screenHeight)
            .ignoresSafeArea()
    }
}

//struct TicketDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        TicketDetails()
//    }
//}

struct BarcodeStrip: View {
    let barcodeData: [Bool] // Boolean array representing the data to encode as bars (true for black, false for white)
    let barWidth: CGFloat // Width of each barcode bar
    let barHeight: CGFloat // Height of the barcode

    var body: some View {
        HStack(spacing: 0) {
            ForEach(barcodeData, id: \.self) { isBlack in
                Rectangle()
                    .foregroundColor(isBlack ? .black : .white)
                    .frame(width: barWidth, height: barHeight)
            }
        }
    }
}
