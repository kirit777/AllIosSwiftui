//
//  PlayerScreen.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI
import AVKit
import AVFoundation


struct PlayerScreen: View {
    
    @State var player:AVPlayer!
    @Binding var isPresentedPlayer:Bool
    var arrSongs:NSMutableArray
    var dict:NSMutableDictionary
    @State var name:String = ""
    @State var img:String = ""
    @State var sliderValue = 0.3
    @State var isPlaying:Bool = false
    @State private var currentTime: Double = 0
    @State var totalDuration:String = "0"
    @State var isOver:Bool = false
    @State var currentUrl : String = ""
    @State var currentIndec:Int = 0
    
    private func sliderEditingChanged(editing: Bool) {
        if editing {
            player.pause()
        } else {
            player.seek(to: CMTime(seconds: currentTime, preferredTimescale: CMTimeScale(NSEC_PER_SEC)))
            player.play()
        }
    }
    
    
    func formatTime(_ time: TimeInterval) -> String {
        if !time.isNaN{
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }else{
            return "00:00"
        }
    }
    
    
    func startSong(strUrl:String){
        player = AVPlayer(url: URL(string: "https://dl115.dlmate56.xyz/?file=M3R4SUNiN3JsOHJ6WWRQNXNPUFN2cFdxRVJIOGxQd3ZuWjRKMHdVbkNLUUg3YjRxMXZldkxZSWVldXhFL1l1eEh0RkcvSFdUVU55Q2V6eU1vcEF2Q1d2S3hONDh2SFRvK29Jc0Y4UmhCVkQra3VxbXFTRjNuUStvTzRyckRMZERlV0o1cGdVeDlTdURuN1NHbjBlOTRWdjRnbHlCVTJrQTRSMHZITHZkNGN3TzBtekVNdDdLbFpVZHZTK041NDVBMS9YQTVWZXVtK3RtNFk4a0N3Sm1kcFppMnBMdzNQdVI5QUVLbHNRWTJCOD0%3D")!)
        isPlaying = true
        isOver = false
        player.play()
        
        totalDuration = formatTime((player.currentItem?.duration.seconds)!)
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: DispatchQueue.main) { [self] time in
            self.currentTime = time.seconds
            
            print("currentTime : \(currentTime)")
            print("total : \(player.currentItem?.duration.seconds)")
            
            let totalDuration2 = player.currentItem?.duration.seconds
            
            if !totalDuration2!.isNaN {
                if Int(currentTime) == Int((totalDuration2)!) {
                    player.pause()
                    isPlaying = false
                    isOver = true
                    currentTime = 0.0
                    sliderValue = 0.0
                }else{
                    sliderValue = (currentTime * 100) / (player.currentItem?.duration.seconds)!
                }
            }
            
            totalDuration = formatTime((player.currentItem?.duration.seconds)!)
        }
    }
    
    var body: some View {
        ZStack{
            // Background
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .blur(radius: 15) // Apply blur effect
            
            
            VStack{
                
                ZStack{
                    
                    
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width)
                        .blur(radius: 10) // Apply blur effect
                    
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                        .blur(radius: 0) // Apply blur effect
                    
                    VStack{
                        HStack{
                            Button(action: {
                                isPresentedPlayer = false
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .padding(.all , 5)
                            })
                            .frame(width: 50 , height:  50)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(10.0)
                            .shadow(color: .gray.opacity(0.6), radius: 3.0)
                            Spacer()
                        }
                        .padding(.top , 50)
                        .padding(.horizontal , 20)
                        
                        Spacer()
                    }
                }
                
                
                
                
                Spacer()
                
                HStack{
                    
                    VStack{
                        
                        Text(name).foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.bottom , 20)
                            .padding(.horizontal , 20)
                            .multilineTextAlignment(.center)
                        
                        HStack{
                            
                            Text(String(formatTime(currentTime))).foregroundColor(.white)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                            Slider(value: $sliderValue, in: 0...100 , onEditingChanged: { isEditing in
                                if isEditing {
                                    player.pause()
                                } else {
                                    let duration = player.currentItem?.duration.seconds ?? 0
                                    let time = duration * sliderValue / 100
                                    player.seek(to: CMTime(seconds: time, preferredTimescale: CMTimeScale(NSEC_PER_SEC)))
                                    
                                    if isPlaying {
                                        player.play()
                                    }
                                }
                            })
                                           .accentColor(.yellow)
                                           .padding(.horizontal , 10)
                            
                            
                            if totalDuration == "0" {
                                Text("00:00").foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }else{
                                Text(String(totalDuration)).foregroundColor(.white)
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            
                        }
                        .padding(.horizontal , 15)
                        HStack{
                            
                            Button(action: {
                                if currentIndec > 0 {
                                    currentIndec -= 1
                                    if let dictNew = arrSongs.object(at: currentIndec) as? NSMutableDictionary{
                                        if let strUrl = dictNew["url"] as? String{
                                            currentUrl = strUrl
                                            player.pause()
                                            startSong(strUrl: strUrl)
                                        }
                                    }
                                }
                            }, label: {
                                VStack{
                                    Image(systemName: "backward.end")
                                        .foregroundColor(.black)
                                }.frame(width: 50,height: 50)
                                    .background(.yellow)
                                    .cornerRadius(25)
                            })
                            
                            Button(action: {
                                
                                if isOver {
                                    startSong(strUrl: currentUrl)
                                }else{
                                    if player.timeControlStatus == .playing{
                                        isPlaying = false
                                        player.pause()
                                    }else{
                                        isPlaying = true
                                        player.play()
                                    }
                                }
                                
                                
                            }, label: {
                                VStack{
                                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                        .resizable()
                                        .frame(width: 30,  height: 30)
                                        .aspectRatio(contentMode: .fill)
                                        .padding(.top , 0)
                                        .foregroundColor(.black)
                                }.frame(width: 90,height: 90)
                                    .background(.yellow)
                                    .cornerRadius(45)
                            })
                            
                            
                           Button(action: {
                               
                               if currentIndec < arrSongs.count {
                                   currentIndec += 1
                                   if let dictNew = arrSongs.object(at: currentIndec) as? NSMutableDictionary{
                                       if let strUrl = dictNew["url"] as? String{
                                           player.pause()
                                           currentUrl = strUrl
                                           startSong(strUrl: strUrl)
                                       }
                                   }
                               }
                               
                           }, label: {
                               VStack{
                                   Image(systemName: "forward.end")
                                       .foregroundColor(.black)
                               }.frame(width: 50,height: 50)
                                   .background(.yellow)
                                   .cornerRadius(25)
                           })
                        }
                        .padding(.top , 10)
                        
                    }
                   
                }.frame(width: screenWidth,height: 300)
                    .background(.black)
            }
        }.frame(width: screenWidth , height: screenHeight)
            .background(.black)
            .onAppear(){
                
                currentIndec = arrSongs.index(of: dict)
                
                if let strName = dict["name"] as? String{
                    name = strName
                }
                
                if let strImg = dict["image"] as? String{
                    img = strImg
                }
                
                if let strURL = dict["url"] as? String{
                    currentUrl = strURL
                    startSong(strUrl: strURL)
                    
                }
                
            }
            .onChange(of: isPresentedPlayer) { newValue in
                if newValue == false{
                    if player != nil {
                        isPlaying = false
                        player.pause()
                    }
                }
            }
    }
}

//struct PlayerScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerScreen()
//    }
//}


//struct DynamicIslandView: View {
//    @State private var isPlaying = false
//
//    var body: some View {
//        ZStack {
//            if isPlaying {
//                // Show the album art and play/pause button in the Dynamic Island.
//                DynamicIsland(content: {
//                    Image("AlbumArt")
//                    Button(action: {
//                        isPlaying = !isPlaying
//                    }) {
//                        Image(systemName: "play.circle.fill")
//                    }
//                })
//            } else {
//                // Show a placeholder image in the Dynamic Island.
//                DynamicIsland(content: {
//                    Image("Placeholder")
//                })
//            }
//
//            // The rest of your app's content.
//        }
//    }
//}
