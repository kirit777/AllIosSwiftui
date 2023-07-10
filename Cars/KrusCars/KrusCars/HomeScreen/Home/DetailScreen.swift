//
//  DetailScreen.swift
//  KrusCars
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI

struct DetailScreen: View {
    @Binding var isDetailPresented:Bool
    var dict:NSMutableDictionary
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {
                        isDetailPresented = false
                    }, label: {
                        Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                    }).padding(.leading , 30)
                    Spacer()
                    Text("Car Detail")
                        .padding(.trailing , 40)
                    Spacer()
                    }.padding(.top , 20)
                
                MainSection(dict: dict)
                    .padding(.top , 20)
                Spacer()
            }
        }.frame(width: screenWidth,height: screenHeight - 70)
    }
}

//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailScreen()
//    }
//}


struct CarHeader: View {
    @State var name:String = ""
    @State var image:String = ""
    var dict:NSMutableDictionary
    let gridItems = [GridItem(.flexible())]
    let items:[String] = ["Normal Mode","Eco Mode","Sport Mode","Comfort Mode","Snow/Winter Mode","Off-Road Mode","Individual/Custom Mode"]
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Audi")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Text(name)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.top , -5)
                }
                .padding(.leading , 30)
                Spacer()
            }
            
            VStack{
                HStack{
                    Spacer()
                    Image(image)
                        .resizable()
                        .frame(width: 300 , height: 200)
                        .aspectRatio(contentMode: .fit)
                        .padding(.top , 15)
                    Spacer()
                }
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .padding(.all , 5)
                    })
                    .frame(width: 30,height: 30)
                    .background(.black)
                    .cornerRadius(15)
                    
                    Button(action: {}, label: {
                        Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .padding(.all , 5)
                    })
                    .frame(width: 30,height: 30)
                    .background(.black)
                    .cornerRadius(15)
                }
            }
            
            VStack{
                HStack{
                    Spacer()
                    MidSectionCell(title: "6500 rpm", desc: "Power", img: "speedometer")
                    Spacer()
                    MidSectionCell(title: "100 mph", desc: "Speed", img: "bolt")
                    Spacer()
                    MidSectionCell(title: "4.4 s", desc: "Acceleration", img: "clock")
                    Spacer()
                }
                .padding(.top , 10)
                
                HStack{
                    Text("Drive Mode")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                                    .fontWeight(.regular)
                                    .padding(.all , 5)
                    })
                }.padding(.horizontal , 10)
                    .padding(.top , 10)
                
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .padding(.all , 5)
                    })
                    .frame(width: 30,height: 30)
                    .background(.black)
                    .cornerRadius(2)
                    
                    
                    ZStack{
                        HStack{
                            HStack{
                            Text("")
                        }
                        .frame(width: 100,height: 30)
                        .overlay(content: {
                            Rectangle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [.black.opacity(1.0), .black.opacity(0.2)]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                        })
                            Spacer()
                        }.zIndex(1.0)
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            LazyHGrid(rows: gridItems, spacing: 10) {
                                if items != nil{
                                    ForEach(0..<items.count) { index in
                                        if let str = items[index] as? String {
                                            Text(str)
                                                .padding(.horizontal , 10)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }.zIndex(0.0)
                        
                        HStack{
                            Spacer()
                            HStack{
                                Text("")
                            }
                            .frame(width: 100,height: 30)
                            .overlay(content: {
                                Rectangle()
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [.black.opacity(1.0), .black.opacity(0.2)]),
                                                    startPoint: .trailing,
                                                    endPoint: .leading
                                                )
                                            )
                            })
                        }.zIndex(1.0)
                    }
                    
                    
                    
                    Button(action: {}, label: {
                        Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .padding(.all , 5)
                    })
                    .frame(width: 30,height: 30)
                    .background(.black)
                    .cornerRadius(2)
                }
                
            }
            .padding(.all , 5)
            .background(.white)
            .cornerRadius(10.0)
            .shadow(color: .gray.opacity(0.2), radius: 5,x: 1,y: 1)
            .padding(.horizontal , 30)
            .padding(.top , 10)
            
            
            
            
        }
        .onAppear(){
            if let strImage = dict["image"] as? String{
                image = strImage
            }
            
            if let strName = dict["name"] as? String{
                name = strName
            }
        }
    }
}

struct MidSectionCell: View {
    var title:String
    var desc:String
    var img:String
    var body: some View {
        VStack(alignment: .center){
            Image(systemName: img)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top , 5)
            Text(desc)
                .foregroundColor(.gray)
                .font(.system(size: 16))
                .fontWeight(.regular)
                .padding(.top , -5)
        }
    }
}


private struct MainSection: View {
    var dict:NSMutableDictionary
    let gridItems = [GridItem(.flexible(),spacing: 0),GridItem(.flexible(), spacing: 0)]
    @State var itemArr:NSMutableArray!
    
    func createDict(index:String,title:String,desc:String,price:String,per:String)  -> NSMutableDictionary {
        
        let dict = NSMutableDictionary()
        dict["index"] = index
        dict["name"] = title
        dict["price"] = desc
        dict["location"] = per
        dict["image"] = price
        return dict
    }
    
    func addData(){
        
        itemArr = NSMutableArray()
        
        itemArr.add(createDict(index: "0", title: "Audi red 354", desc: "10,00,00$", price: "car1", per: "Abu Dabi"))
        itemArr.add(createDict(index: "1", title: "Mercidice 765", desc: "5,00,000$", price: "car2", per: "Toronto"))
        itemArr.add(createDict(index: "2", title: "Custom R2O", desc: "15,00,000$", price: "car3", per: "Los Angles"))
        itemArr.add(createDict(index: "3", title: "Ford 456", desc: "8,00,000$", price: "car4", per: "Delhi"))
        
    }
    
    
    var body: some View {
        VStack{
            VStack{
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.vertical,showsIndicators: false) {
                        Section(header: CarHeader(dict: dict)) {
                            LazyVGrid(columns: gridItems, spacing: 10) {
                                if itemArr != nil{
                                    ForEach(0..<itemArr.count) { index in
                                        if let dict = itemArr.object(at: index) as? NSMutableDictionary {
                                            ListCell(dict: dict)
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                    }.frame(height: screenHeight - 200)
                }
            }
            .onAppear(){
                addData()
            }
            
        }
    }
}


private struct ListCell: View {
    
    let dict:NSMutableDictionary
    @State var name:String = ""
    @State var price:String = ""
    @State var location:String = ""
    @State var car:String = ""
    var body: some View {
        VStack{
            
            Image(car)
                .resizable()
                .frame(width: 200 , height: 150)
                .aspectRatio(contentMode: .fit)
                .padding(.top , 15)
                .padding(.trailing , -80)
            
            ZStack{
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(name)
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.bottom , 1)
                            .padding(.top , -10)
                        
                        Text(price)
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .padding(.bottom , 5)
                        
                        Button(action: {}, label: {
                            HStack{
                                Text(location)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                
                                Image(systemName: "location.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                
                            }
                            
                        })
                        .padding(.horizontal , 15)
                        .padding(.vertical , 10)
                        .background(.black)
                        .cornerRadius(15)
                        .padding(.bottom , 20)
                        
                    }
                    .padding(.leading , 15)
                    Spacer()
                }
            }
        }.frame(width: (screenWidth  / 2) - 40,height: 280)
            .background(.white)
            .cornerRadius(10.0)
            .shadow(color: .gray.opacity(0.2), radius: 5,x: 1,y: 1)
            .padding(.all , 5)
            .onAppear(){
                if let strname = dict["name"] as? String{
                    name = strname
                }
                if let strprice = dict["price"] as? String{
                    price = strprice
                }
                if let strlocation = dict["location"] as? String{
                    location = strlocation
                }
                if let strimage = dict["image"] as? String{
                    car = strimage
                }
            }
    }
}
