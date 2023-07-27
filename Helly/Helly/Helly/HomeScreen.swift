//
//  HomeScreen.swift
//  Helly
//
//  Created by Kirit on 27/07/23.
//

import SwiftUI



struct Event: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let city: String
    let fromTime: String
    let toTime: String
    let rating: Double
    let description: String
    let month: String
    let date: String
    let ticketInfo: String
    let image: String // Image name or URL
}





struct HomeScreen: View {
    
    let events = [
           Event(name: "Music Festival", address: "123 Main St", city: "City", fromTime: "10:00 AM", toTime: "10:00 PM", rating: 4.5, description: "An electrifying music festival featuring top artists from around the world.", month: "Jul", date: "28", ticketInfo: "$29.99", image: "event1"),
           Event(name: "Art Gallery Opening", address: "456 Park Ave", city: "Town", fromTime: "6:00 PM", toTime: "8:00 PM", rating: 4.8, description: "Discover captivating artworks by talented local and international artists.", month: "Aug", date: "15", ticketInfo: "€15.50", image: "event2"),
           Event(name: "Sports Tournament", address: "789 Stadium Rd", city: "Village", fromTime: "9:00 AM", toTime: "5:00 PM", rating: 4.2, description: "Cheer on your favorite teams in an adrenaline-pumping sports competition.", month: "Sep", date: "5", ticketInfo: "₹12.75", image: "event3"),
           Event(name: "Food Truck Festival", address: "246 Market Pl", city: "Town", fromTime: "12:00 PM", toTime: "9:00 PM", rating: 4.6, description: "Indulge in a delectable array of cuisines from food trucks across the region.", month: "Oct", date: "10", ticketInfo: "$8.99", image: "event4"),
           Event(name: "Tech Conference", address: "135 Innovation St", city: "City", fromTime: "9:30 AM", toTime: "6:00 PM", rating: 4.9, description: "Explore the latest tech trends and innovations with industry experts.", month: "Nov", date: "18", ticketInfo: "$49.99", image: "event5")
       ]
       
    
    let gridItems = [GridItem(.flexible(),spacing: 0)]
    @State var itemArr:NSMutableArray!
    
   
    var body: some View {
        ZStack{
            // Background
            LinearGradient(
                        gradient: Gradient(colors: [Color.COLOR_51_19_92, Color.COLOR_37_21_95]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        )
            
            
            VStack{
                HStack{
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            Circle()
                                .stroke(Color.white.opacity(0.6), lineWidth: 1) // White border with a line width of 2
                            
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .frame(width: 40,height: 40)
                        .padding(10)
                    })
                    .frame(width: 40,height: 40)
                    
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white.opacity(0.6), lineWidth: 1)
                                .frame(width: 120,height: 40)
                            
                            HStack{
                                Text("Hey Helly")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                    .padding(.leading , 10)
                                Spacer()
                                Image("user")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                    .cornerRadius(10)
                                    .foregroundColor(.white.opacity(0.6))
                            }
                        }
                        .frame(width: 100,height: 40)
                        .padding(10)
                    })
                    .frame(width: 100,height: 40)
                    .padding(.horizontal , 20)
                    
                }
                .padding(.horizontal , 20)
                .padding(.top , 0)
                
                
                
                //itemArr.count
                VStack{
                    ScrollViewReader { scrollViewProxy in
                        ScrollView(.vertical,showsIndicators: false) {
                            Section(header: CarHeader()) {
                                LazyVGrid(columns: gridItems, spacing: 10) {
                                    ForEach(events) { event in
                                        ListCell(event: event)
                                    }
                                }
                                .padding()
                            }
                        }.frame(height: screenHeight - 200)
                    }
                }
            }
            
        } .ignoresSafeArea()
        .frame(width: screenWidth , height: screenHeight)
           
//            .fullScreenCover(isPresented: $isPresentedPlayer) {
//                PlayerScreen(isPresentedPlayer: $isPresentedPlayer, arrSongs: arrSongList, dict: dictCurrent)
//            }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct CarHeader: View {
   
    @State var strSearchName:String = ""
    var body: some View {
        
        VStack{
            HStack{
                Text("Exceeding  event Expectations.")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 34))
                    .fontWeight(.semibold)
                
            }
            .frame(height: 100)
            .padding(.horizontal , 20)
            .padding(.top , 30)
            
            HStack{
                ZStack{
                    LinearGradient(
                        gradient: Gradient(colors: [Color.COLOR_76_81_227.opacity(0.6), Color.COLOR_233_92_238.opacity(0.6)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    VStack{
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .imageScale(.large)
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.leading , 20)
                            TextField("search user", text: $strSearchName)
                                .foregroundColor(.white)
                                .accentColor(.white)
                            
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.trailing , 20)
                        }.frame(height: 60)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                            .padding(.horizontal , 20)
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                Button(action: {}, label: {
                                    Image("user1")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user2")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user3")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user4")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user5")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user6")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user7")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                                Button(action: {}, label: {
                                    Image("user8")
                                        .resizable()
                                        .frame(width: 60,height: 60)
                                        .cornerRadius(30)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                }).padding(.trailing,10)
                                
                            }
                            
                            
                        }.padding(.horizontal, 20)
                            .padding(.top , 10)
                    }.padding(5)
                }
            }
            .frame(height: 180)
            .cornerRadius(15)
            .padding(.horizontal , 20)
            .padding(.top , 30)
            
        }
       
    }
}


private struct ListCell: View {
    @State var isPresentedPlayer:Bool = false
    var event:Event!
    var body: some View {
        ZStack(alignment: .bottom){
            Image(event.image)
                .resizable()
                
                .cornerRadius(10)
                .foregroundColor(.white.opacity(0.6))
            
            HStack{
                VStack(alignment: .leading){
                    Text(event.name)
                        .foregroundColor(.black.opacity(0.9))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.top , 10)
                        .padding(.leading , 10)
                    
                    Text(event.address)
                        .foregroundColor(.black.opacity(0.6))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .padding(.leading , 10)
                    
                    ZStack{
                        Button(action: {}, label: {
                            Image("user8")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                        }).padding(.trailing,10)
                            .position(x: 25,y: 15)
                        
                        Button(action: {}, label: {
                            Image("user2")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(color: .white, radius: 5,x: 0 ,y: 0)
                        }).padding(.trailing,10)
                            .position(x: 40,y: 16)
                        
                        Button(action: {}, label: {
                            Image("user2")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(color: .white, radius: 5,x: 0 ,y: 0)
                        }).padding(.trailing,10)
                            .position(x: 55,y: 16)
                        
                        Button(action: {}, label: {
                            Text("+2")
                                
                                .foregroundColor(.white.opacity(0.6))
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .frame(width: 40,height: 40)
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(color: .white, radius: 5,x: 0 ,y: 0)
                        }).padding(.trailing,10)
                            .position(x: 70,y: 16)
                    }
                    .padding(.leading , 10)
                    .padding(.top , 10)
                    
                }
                Spacer()
                VStack(alignment:.trailing){
                    VStack{
                        Text(event.month)
                            .foregroundColor(.black.opacity(0.9))
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        
                        Text(event.date)
                            .foregroundColor(.orange)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    .frame(width:60,height: 60)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20)
                    .padding(.horizontal , 20)
                    
                    HStack{
                        Text("Buy tikets - \(event.ticketInfo)")
                            .foregroundColor(Color.COLOR_76_81_227)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        Image(systemName: "arrow.right")
                            .imageScale(.medium)
                            .foregroundColor(Color.COLOR_76_81_227)
                            .padding(.trailing , 20)
                    }
                }
            }
            .frame(height: 130)
            .background(Color.white.opacity(0.7))
            .cornerRadius(20)
            .padding(.horizontal , 20)
            .padding(.bottom , 10)
        }.frame(height: 300)
            .cornerRadius(20)
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $isPresentedPlayer) {
                DetailScreen(isPresentedPlayer: $isPresentedPlayer, event: event)
            }
            .onTapGesture {
                isPresentedPlayer.toggle()
            }
            
        
    }
}
