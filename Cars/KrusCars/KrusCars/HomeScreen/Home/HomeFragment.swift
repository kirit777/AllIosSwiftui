//
//  HomeFragment.swift
//  KrusCars
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI

struct HomeFragment: View {
    @State var isPresentedDetail:Bool = false
    @State var txtSearch:String = ""
    @State var dictCurrent:NSMutableDictionary = NSMutableDictionary()
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                    })
                    .padding(.leading , 20)
                    
                    TextField("Search...", text: $txtSearch)
                        .padding(.horizontal , 5)
                    
                    Button(action: {}, label: {
                        Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16))
                    }).padding(.trailing , 20)
                    
                }
                .frame(height: 60)
                .background(.white)
                .cornerRadius(10.0)
                .padding(.horizontal , 30)
                .padding(.top , 80)
                
//                HeaderSection()
//                    .padding(.top , 10)
                
                MainSection(isPresentedDetail: $isPresentedDetail, dictCurrent: $dictCurrent)
                    .padding(.top , 10)
                
                Spacer()
            }
            .frame(width: screenWidth,height: screenHeight - 70)
            .background(Color.gray.opacity(0.5))
        }.fullScreenCover(isPresented: $isPresentedDetail) {
           DetailScreen(isDetailPresented: $isPresentedDetail, dict: dictCurrent)
            
        }
    }
}

struct HomeFragment_Previews: PreviewProvider {
    static var previews: some View {
        HomeFragment()
    }
}


private struct MainSection: View {
    
    @Binding var isPresentedDetail:Bool
    @Binding var dictCurrent:NSMutableDictionary
    
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
                        Section(header: HeaderSection(isPresentedDetail: $isPresentedDetail, dictCurrent: $dictCurrent)) {
                            LazyVGrid(columns: gridItems, spacing: 10) {
                                if itemArr != nil{
                                    ForEach(0..<itemArr.count) { index in
                                        if let dict = itemArr.object(at: index) as? NSMutableDictionary {
                                            ListCell(isPresentedDetail: $isPresentedDetail, dictCurrent: $dictCurrent,dict: dict)
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



struct HeaderSection: View {
    @Binding var isPresentedDetail:Bool
    @Binding var dictCurrent:NSMutableDictionary
    
    let items = (1...20).map { "Item \($0)" }
    
    let gridItems = [GridItem(.flexible())]
    @State private var currentIndex = 0
    @State var itemArr:NSMutableArray!
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    
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
            HStack{
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.horizontal,showsIndicators: false) {
                        LazyHGrid(rows: gridItems, spacing: 10) {
                            if itemArr != nil{
                                ForEach(0..<itemArr.count) { index in
                                    if let dict = itemArr.object(at: index) as? NSMutableDictionary {
                                        IntroCell(isPresentedDetail: $isPresentedDetail, dictCurrent: $dictCurrent, dict: dict)
                                    }
                                }
                            }
                            //                    ForEach(items, id: \.self) { item in
                            //                        IntroCell()
                            //                    }
                        }
                        .padding()
                        .onReceive(timer) { _ in
                            withAnimation {
                                currentIndex = (currentIndex + 1) % items.count
                                scrollViewProxy.scrollTo(currentIndex, anchor: .center)
                            }
                        }
                    }.frame(height: 290)
                        .onAppear {
                            scrollViewProxy.scrollTo(currentIndex, anchor: .center)
                        }
                    
                }
            }
            
            
            HStack{
                Text("Recommanded")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.bottom , 1)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("View All")
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.bottom , 1)
                })
                .padding(.leading , 20)
            }
            .padding(.horizontal , 40)
            .padding(.top , 10)
        }
        .onAppear(){
            addData()
        }
    }
}

private struct IntroCell: View {
    @Binding var isPresentedDetail:Bool
    @Binding var dictCurrent:NSMutableDictionary
    let dict:NSMutableDictionary
    @State var name:String = ""
    @State var price:String = ""
    @State var location:String = ""
    @State var car:String = ""
    var body: some View {
        VStack{
            
            Image(car)
                .resizable()
                .frame(width: 280 , height: 185)
                .aspectRatio(contentMode: .fit)
                .padding(.top , 15)
            
            ZStack{
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(name)
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.bottom , 1)
                        
                        Text(price)
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .padding(.bottom , 20)
                        
                    }
                    .padding(.leading , 15)
                    Spacer()
                    
                    VStack{
                        Spacer()
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
                        .padding(.trailing , 20)
                        .padding(.bottom , 20)
                    }
                    
                }
            }
        }.frame(width: screenWidth - 60,height: 260)
            .background(Color.white)
            .cornerRadius(10.0)
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
            .onTapGesture {
                isPresentedDetail.toggle()
                dictCurrent = dict
            }
    }
}


private struct ListCell: View {
    
    @Binding var isPresentedDetail:Bool
    @Binding var dictCurrent:NSMutableDictionary
    
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
            .background(Color.white)
            .cornerRadius(10.0)
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
            .onTapGesture {
                isPresentedDetail.toggle()
                dictCurrent = dict
            }
    }
}
