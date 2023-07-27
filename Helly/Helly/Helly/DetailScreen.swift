//
//  DetailScreen.swift
//  Helly
//
//  Created by Kirit on 27/07/23.
//

import SwiftUI
import MapKit

struct DetailScreen: View {
    @Binding var isPresentedPlayer:Bool
    @State var isPresentedBook:Bool = false
    var event:Event!
    @State var isSplash:Bool = false
    @State var strDesc = "The event Tech Conference is an annual technology-focused gathering that brings together industry experts, innovators, and enthusiasts from around the world. With a history of inspiring keynotes, informative workshops, and engaging panel discussions, this conference is a must-attend event for anyone passionate about the latest advancements in technology. Attendees can expect to delve into cutting-edge topics such as artificial intelligence, blockchain, cybersecurity, and more, gaining valuable insights from renowned speakers and thought leaders. The event will take place on November 18, promising an immersive experience filled with networking opportunities and hands-on demonstrations of groundbreaking technologies."
    
    var body: some View {
        ZStack(alignment: .top){
            
            LinearGradient(
                        gradient: Gradient(colors: [Color.COLOR_51_19_92, Color.COLOR_37_21_95]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        )
            
            
           
            VStack{
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        HStack{
                            Image(event.image)
                                .resizable()
                                .cornerRadius(10)
                                .foregroundColor(.white.opacity(0.6))
                        }.frame(height: 400)
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text(event.name)
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .padding(.top , 10)
                                
                                Text(event.address)
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .padding(.top,-10)
                                
                            }
                            Spacer()
                            VStack(alignment:.trailing){
                                VStack{
                                    Text(event.month)
                                        .foregroundColor(.white.opacity(0.9))
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
                                .background(Color.COLOR_51_19_92.opacity(0.9))
                                .cornerRadius(20)
                                .shadow(color: .white.opacity(0.6), radius: 0.3,x: 0,y: 0)
                                .padding(.horizontal , 20)
                            }
                            .padding(.top , 20)
                            
                        }
                        .padding(.trailing , 20)
                        .padding(.leading , 20)
                        
                        HStack{
                            HStack{
                                Image(systemName: "location")
                                    .imageScale(.medium)
                                    .foregroundColor(.orange.opacity(0.6))
                                Text(event.city)
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                            }
                            HStack{
                                Image(systemName: "clock")
                                    .imageScale(.medium)
                                    .foregroundColor(.orange.opacity(0.6))
                                Text("\(event.fromTime) to \(event.toTime)")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                Spacer()
                            }
                        }.padding(.trailing , 20)
                            .padding(.leading , 20)
                        
                        
                        HStack{
                            HStack{VStack{
                                Text("rating")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                
                                HStack(alignment:.center){
                                    Image(systemName: "star.fill")
                                        .imageScale(.medium)
                                        .foregroundColor(.yellow.opacity(1.0))
                                    Text("\(event.rating)")
                                        .foregroundColor(.white.opacity(0.6))
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                }.padding(.top , 1)
                            }}
                            .padding(.all , 10)
                           
                            HStack(alignment:.center){VStack(alignment:.center){
                                Text("Joined Members")
                                    .foregroundColor(.white.opacity(0.6))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                
                                HStack(alignment:.center){
                                    Spacer()
                                    ZStack(alignment:.center){
                                        Button(action: {}, label: {
                                            Image("user8")
                                                .resizable()
                                                .frame(width: 40,height: 40)
                                                .cornerRadius(20)
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 2,x: 0 ,y: 0)
                                        }).padding(.trailing,10)
                                            .position(x: 30,y: 15)
                                        
                                        Button(action: {}, label: {
                                            Image("user2")
                                                .resizable()
                                                .frame(width: 40,height: 40)
                                                .cornerRadius(20)
                                                .foregroundColor(.white)
                                                .shadow(color: .white, radius: 5,x: 0 ,y: 0)
                                        }).padding(.trailing,10)
                                            .position(x: 50,y: 16)
                                        
                                        Button(action: {}, label: {
                                            Image("user2")
                                                .resizable()
                                                .frame(width: 40,height: 40)
                                                .cornerRadius(20)
                                                .foregroundColor(.white)
                                                .shadow(color: .white, radius: 5,x: 0 ,y: 0)
                                        }).padding(.trailing,10)
                                            .position(x: 70,y: 16)
                                        
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
                                            .position(x: 90,y: 16)
                                    }
                                    .padding(.leading , 10)
                                    .padding(.top , 10)
                                    Spacer()
                                }
                            }}
                            .frame(width: 160)
                            .padding(.all , 10)
                            
                            VStack{
                                MapView()
                            }.padding(.all , 10)
                        }
                        .frame(width: screenWidth - 40)
                        .background(Color.COLOR_58_33_131)
                        .cornerRadius(15)
                        .padding(.trailing , 20)
                        .padding(.leading , 20)
                        .padding(.top , 20)
                        
                        
                        VStack(alignment:.leading){
                            HStack{
                                Text("about event")
                                    .foregroundColor(.white.opacity(0.9))
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                    .padding(.top , 10)
                                Spacer()
                            }
                            
                            
                            Text(event.description)
                                .frame(width: screenWidth - 40)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                                .padding(.top , 1)
                            
                            HStack{
                               Button(action: {
                                   
                               }, label: {
                                   Text("more..")
                                       .foregroundColor(.orange.opacity(0.9))
                                       .multilineTextAlignment(.leading)
                                       .font(.system(size: 14))
                                       .fontWeight(.medium)
                                       .padding(.top , 1)
                               })
                                Spacer()
                            }
                            
                        }.frame(width: screenWidth - 40,height:170)
                        
                        
                        HStack{
                            UnlockButton(event: event, price: event.ticketInfo, isSplash: $isSplash)
                        }
                        
                    }
                }
            }
            
            HStack{
                Button(action: {
                    isPresentedPlayer = false
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
                
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Image(systemName: "square.and.arrow.down")
                            .imageScale(.medium)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    .frame(width: 40,height: 40)
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(15)
                    .padding(10)
                })
                .frame(width: 40,height: 40)
                
            }
            .padding(.horizontal , 40)
            .padding(.top , 60)
        }.frame(width: screenWidth , height: screenHeight)
            .ignoresSafeArea()
    }
}

//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailScreen()
//    }
//}
struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331705, longitude: -122.030237),
                                                  span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [SampleAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.331705, longitude: -122.030237))]) { annotation in
            MapPin(coordinate: annotation.coordinate)
        }
        .frame(width:80,height: 80)
        .cornerRadius(15)
    }
}

struct SampleAnnotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}


public struct UnlockButton: View {
    var event:Event!
    var price:String!
    @State private var isLocked = true
    @State private var isLoading = false
    @Binding var isSplash:Bool
    
//    public init() { }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                BackgroundComponent(price: price)
                DraggingComponent(event: event, isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width, isSplash: $isSplash)
                    .padding(.leading , 5)
            }
        }
        .frame(height: 70)
        .padding()
        .padding(.bottom, 20)
        .onChange(of: isLocked) { isLocked in
            guard !isLocked else { return }
            simulateRequest()
        }
    }

    private func simulateRequest() {
        isLoading = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
        }
    }

}


struct BackgroundComponent: View {
    var price:String!
    var body: some View {
        ZStack(alignment: .leading)  {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.COLOR_101_54_242)

            Text("Buy ticket - \(price)")
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
    }

}


public struct DraggingComponent: View {
    var event:Event!
    @Binding var isLocked: Bool
    let isLoading: Bool
    let maxWidth: CGFloat
    @Binding var isSplash:Bool
    @State private var width = CGFloat(50)
    private  let minWidth = CGFloat(50)

//    public init(isLocked: Binding<Bool>, isLoading: Bool, maxWidth: CGFloat,isSplash: Binding<Bool>) {
//        _isLocked = isLocked
//        self.isLoading = isLoading
//        self.maxWidth = maxWidth
//        self.isSplash = isSplash
//    }

    public var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.COLOR_233_92_238)
            .opacity(width / maxWidth)
            .frame(width: width)
            .overlay(
                Button(action: { }) {
                    ZStack {
                        HStack{
                            Image(systemName: "chevron.right")
                                .imageScale(.medium)
                                .foregroundColor(.black.opacity(0.6))
                        }.frame(width: 50,height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                        //image(name: "lock", isShown: isLocked)
                        progressView(isShown: isLoading)
                        //image(name: "lock.open", isShown: !isLocked && !isLoading)
                        
                    }
                    .animation(.easeIn(duration: 0.35).delay(0.55), value: !isLocked && !isLoading)
                }
                .buttonStyle(BaseButtonStyle())
                .disabled(!isLocked || isLoading),
                alignment: .trailing
            )
            .fullScreenCover(isPresented: $isSplash) {
                TicketScreen(event: event, isPresentedBook: $isSplash, isSplash: $isSplash)
            }
            .onChange(of: isLocked) { newValue in
                if newValue == false {
                    withAnimation{
                        isSplash = true
                    }
                }
            }
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        guard isLocked else { return }
                    if value.translation.width > 0 {
                        width = min(max(value.translation.width + minWidth, minWidth), maxWidth)
                    }
                    }
                    .onEnded { value in
                        guard isLocked else { return }
                        if width < maxWidth {
                            width = minWidth
                            UINotificationFeedbackGenerator().notificationOccurred(.warning)
                        } else {
                            UINotificationFeedbackGenerator().notificationOccurred(.success)
                            withAnimation(.spring().delay(0.5)) {
                                isLocked = false
                            }
                        }
                    }
            )
            .animation(.linear)
//(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0), value: width)
    }

    private func image(name: String, isShown: Bool) -> some View {
        Image(systemName: name)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .foregroundColor(.red)
            .frame(width: 42, height: 42)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.COLOR_76_81_227))
            .padding(4)
            .opacity(isShown ? 1 : 0)
            .scaleEffect(isShown ? 1 : 0.01)
    }

    private func progressView(isShown: Bool) -> some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(Color.COLOR_76_81_227)
            .opacity(isShown ? 1 : 0)
            .scaleEffect(isShown ? 1 : 0.01)
    }

}

public struct BaseButtonStyle: ButtonStyle {

    public init() { }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.default, value: configuration.isPressed)
    }

}
