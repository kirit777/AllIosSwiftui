//
//  MusicListScreen.swift
//  Musix
//
//  Created by Kirit on 10/07/23.
//

import SwiftUI

struct MusicListScreen: View {
    
    @State var arrSongList:NSMutableArray = getSongs()
    let gridItems = [GridItem(.flexible())]
    @State var isPresentedPlayer:Bool = false
    @State var dictCurrent:NSMutableDictionary = NSMutableDictionary()
    
    
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
                    Spacer()
                }
                .padding(.top , 50)
                
                
                HStack{
                    ScrollViewReader { scrollViewProxy in
                        ScrollView(.vertical,showsIndicators: false) {
                            LazyVGrid(columns: gridItems, spacing: 10) {
                                if arrSongList != nil{
                                    ForEach(0..<arrSongList.count) { index in
                                        if let dict = arrSongList.object(at: index) as? NSMutableDictionary {
                                            ListCell(dict: dict, dictCurrent: $dictCurrent, isPresentedPlayer: $isPresentedPlayer)
                                        }
                                    }
                                }
                                
                                
                            }
                            .padding()
                        }.frame(height: screenHeight - 100)
                    }
                }
                .padding(.top , 10)
            }
        }.frame(width: screenWidth , height: screenHeight)
            .background(.black)
            .fullScreenCover(isPresented: $isPresentedPlayer) {
                PlayerScreen(isPresentedPlayer: $isPresentedPlayer, arrSongs: arrSongList, dict: dictCurrent)
            }
    }
}

struct MusicListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MusicListScreen()
    }
}


struct ListCell: View {
    var dict:NSMutableDictionary
    @State var name:String = ""
    @State var img:String = ""
    @State var index:String = ""
    @Binding var dictCurrent:NSMutableDictionary
    @Binding var isPresentedPlayer:Bool
    
    var body: some View {
        HStack{
            VStack{
                Image(img)
                    .resizable()
                    .frame(width: 30,  height: 30)
                    .aspectRatio(contentMode: .fill)
                    .padding(.top , 0)
            }
            .cornerRadius(5.0)
            .padding(.leading , 20)
            .padding(.trailing , 10)
            
            VStack{
                Text(name).foregroundColor(.white)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    //.lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.trailing , 10)
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName:"play.circle")
                    .resizable()
                    .frame(width: 30,  height: 30)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    
            }).padding(.trailing , 20)
            
        }
        .frame(width: screenWidth - 40,height: 80)
        .background(Color.black)
        .cornerRadius(15.0)
        .onAppear(){
            if let strIndex = dict["index"] as? String{
                index = strIndex
            }
            if let strName = dict["name"] as? String{
                name = strName
            }
            if let strImg = dict["image"] as? String{
                img = strImg
            }
        }
        .onTapGesture {
            dictCurrent = dict
            isPresentedPlayer = true
        }
    }
}
