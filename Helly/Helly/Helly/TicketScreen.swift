//
//  TicketScreen.swift
//  Helly
//
//  Created by Kirit on 27/07/23.
//

import SwiftUI

struct TicketScreen: View {
    var event:Event!
    @State var isPresentedMyTicket:Bool = false
    @Binding var isPresentedBook:Bool
    @State var name:String = ""
    @Binding var isSplash:Bool
    @State var selectedDate:Date = Date()
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
                        isSplash = false
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
                            .padding(.top , 20)
                        
                        HStack{
                            Text(event.name)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .padding(.top , 15)
                        }
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Name:")
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 18))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                TextField("Name", text: $name)
                                    .padding()
                                    .background(Color.white.opacity(0.2)) // Semi-transparent white background
                                    .foregroundColor(.white) // White text color
                                    .cornerRadius(8)
                            }
                            Spacer()
                        }
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("Date:")
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 18))
                                    .fontWeight(.medium)
                                    .padding(.top , 15)
                                
                                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                                                .datePickerStyle(GraphicalDatePickerStyle())
                                                .background(Color.white.opacity(0.5))
                                                .labelsHidden()
                                                .foregroundColor(.white)
                                                .cornerRadius(15)
                            }
                            Spacer()
                        }
                        
                        HStack(alignment:.center){
                            VStack(alignment:.center){
                               Button(action: {
                                   isPresentedMyTicket.toggle()
                               }, label: {
                                   Text("Book Now")
                                       .frame(width: 150,height: 50)
                                       .background(Color.white.opacity(0.2))
                                       .cornerRadius(15)
                                       .foregroundColor(.white.opacity(0.9))
                                       .multilineTextAlignment(.center)
                                       .font(.system(size: 18))
                                       .fontWeight(.medium)
                                       .padding(.top , 15)
                                       
                               })
                               
                            }
                            
                        }
                        
                        HStack{
                            
                        }.frame(height: 100)
                        
                    }
                    .padding(.horizontal , 20)
                }
            }
        }.frame(width: screenWidth , height: screenHeight)
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $isPresentedMyTicket) {
                TicketDetails(event: event, name: name, date: selectedDate.formatted(), isPresentedBook: $isPresentedMyTicket)
            }
    }
}

//struct TicketScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TicketScreen()
//    }
//}
