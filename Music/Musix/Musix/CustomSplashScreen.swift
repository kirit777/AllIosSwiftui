//
//  CustomSplashScreen.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI

struct CustomSplashScreen: View {
    
    @Binding var isSplash:Bool
    
    var body: some View {
        ZStack{
            
            // Background
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .blur(radius: 15) // Apply blur effect
            
            
            
            VStack{
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "music.note")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                        Text("Musix").foregroundColor(.black)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                    
                }
                .padding(.trailing , 30)
                .padding(.top , 40)
                
                HStack{
                    Image(systemName: "music.note.list")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding(.top , 40)
                    Spacer()
                    Image(systemName: "music.mic")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding(.bottom , 40)
                    Spacer()
                    Image(systemName: "music.note.tv")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding(.top , 40)
                    Spacer()
                    Image(systemName: "music.note.house")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding(.bottom , 40)
                    Spacer()
                    Image(systemName: "music.note")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding(.top , 40)
                    
                }.frame(height: 50)
                    .padding(.horizontal , 40)
                    .padding(.top , 60)
                
                
                HStack{
                    Image("imgRadio2")
                        .resizable()
                        .frame(width: 300,  height: 250)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top , 0)
                }
                .frame(width: 200,height: 200)
                .padding(.top , 80)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Listen to your").foregroundColor(.black)
                            .font(.system(size: 24))
                            .fontWeight(.regular)
                        
                        Text("Favorite\nMusic").foregroundColor(.black)
                            .font(.system(size: 55))
                            .fontWeight(.semibold)
                            .padding(.top , 2)
                    }
                    Spacer()
                }
                .padding(.horizontal , 40)
                .padding(.top , 20)
                
                
                UnlockButton(isSplash: $isSplash)
                
                Spacer()
            }
        }.frame(width: screenWidth , height: screenHeight)
            .background(.black)
    }
}
//
//struct CustomSplashScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSplashScreen()
//
//    }
//}


public struct UnlockButton: View {

    @State private var isLocked = true
    @State private var isLoading = false
    @Binding var isSplash:Bool
    
//    public init() { }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                BackgroundComponent()
                DraggingComponent(isLocked: $isLocked, isLoading: isLoading, maxWidth: geometry.size.width, isSplash: $isSplash)
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

    var body: some View {
        ZStack(alignment: .leading)  {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray.opacity(0.2))

            Text("Start playing...")
                .font(.footnote)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
        }
    }

}


public struct DraggingComponent: View {

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
            .fill(.black)
            .opacity(width / maxWidth)
            .frame(width: width)
            .overlay(
                Button(action: { }) {
                    ZStack {
                        HStack{
                            Text("Play")
                                .font(.system(size: 12))
                                .padding(.all , 5)
                        }.frame(width: 50,height: 50)
                            .background(Color.yellow)
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
            .onChange(of: isLocked) { newValue in
                if newValue == false {
                    withAnimation{
                        isSplash = false
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
            .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0), value: width)

    }

    private func image(name: String, isShown: Bool) -> some View {
        Image(systemName: name)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .foregroundColor(.red)
            .frame(width: 42, height: 42)
            .background(RoundedRectangle(cornerRadius: 14).fill(.black))
            .padding(4)
            .opacity(isShown ? 1 : 0)
            .scaleEffect(isShown ? 1 : 0.01)
    }

    private func progressView(isShown: Bool) -> some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.black)
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
