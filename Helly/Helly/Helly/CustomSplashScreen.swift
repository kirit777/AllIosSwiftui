
import SwiftUI
import Foundation

struct SplashScreen2: View {
    @Binding var isSplash:Bool
  //  @State var isSplash:Bool = true
    @State private var isTimerExpired = false
    @State private var isAnimationStarted = false
    
    var body: some View {
        ZStack{
            
            // Background
            LinearGradient(
                        gradient: Gradient(colors: [Color.COLOR_51_19_92, Color.COLOR_37_21_95]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
            
            HStack {
                Spacer()
                
                HStack {
                    Image("iconMain")
                        .resizable()//music.note
                        .frame(width: 80,height: 80)
                        .font(.system(size: 34))
                        .offset(x: isAnimationStarted ? 0 : -100)
                        .animation(.easeInOut(duration: 0.9))
                        
                    
                    Text("Helly")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .fontWeight(.semibold)
                        .padding(.leading, 5)
                        .offset(x: isAnimationStarted ? 0 : 100)
                        .animation(.easeInOut(duration: 0.9))
                }
                
                Spacer()
            }
            .onAppear {
                withAnimation {
                    isAnimationStarted = true
                }
            }
            
        }.frame(width: screenWidth , height: screenHeight)
            .background(.black)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                    withAnimation{
                        isTimerExpired = true
                        isSplash = false
                    }
                }
            }
    }
}
//
//struct SplashScreen2_Previews: PreviewProvider {
//    static var previews: some View {
//        SplashScreen2()
//    }
//}
