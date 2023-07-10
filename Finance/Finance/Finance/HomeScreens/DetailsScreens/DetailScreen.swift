//
//  DetailScreen.swift
//  Finance
//
//  Created by Kirit on 08/07/23.
//

import SwiftUI
import Charts

struct DetailScreen: View {
    
    let items = (1...20).map { "Item \($0)" }
    let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    @State var itemArr:NSMutableArray!
    @Binding var title:String
    
    
    @Binding var isPresentedDetail:Bool
    
    func createDict(index:String,title:String,desc:String,price:String,per:String)  -> NSMutableDictionary {
        
        let dict = NSMutableDictionary()
        dict["index"] = index
        dict["title"] = title
        dict["desc"] = desc
        dict["per"] = per
        dict["price"] = price
        return dict
    }
    
    func addData(){
        
        itemArr = NSMutableArray()
        
        itemArr.add(createDict(index: "0", title: "Sales", desc: "Total sales today", price: "$500", per: "59%"))
        itemArr.add(createDict(index: "1", title: "Profite", desc: "per day ratio", price: "$150", per: "45%"))
        itemArr.add(createDict(index: "2", title: "Orders", desc: "total orders today", price: "1000", per: "92%"))
        itemArr.add(createDict(index: "3", title: "Return", desc: "returns this month", price: "120", per: "10%"))
        
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    Button(action: {
                        isPresentedDetail = false
                    }, label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20,height: 40)
                    })
                    .frame(width: 50,height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 3,x: 1,y: 1)
                    .padding(.leading , 30)
                    
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image("imgProfile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .cornerRadius(20)
                            .padding(.all , 10)
                    })
                    .background(.white)
                    .frame(width: 50,height: 50)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 3,x: 1,y: 1)
                    .padding(.trailing , 30)
                }
                .padding(.top , 10)
                .frame(width: screenwidth)
                ScrollView(showsIndicators: false) {
                    if (itemArr != nil) {
                        Section(header: headerView(title: title)) {
                            LazyVGrid(columns: gridItems, spacing: 10) {
                                
                                ForEach(0..<itemArr.count) { index in
                                    if let dict = itemArr.object(at: index) as? NSMutableDictionary{
                                        ListCell(currentTitle: $title, dict: dict, isPresentedDetail: $isPresentedDetail)
                                            
                                    }
                                }
                            }.padding()
                        }
                    }
                    
                }.padding(.horizontal , 50)
                //.frame(width: screenwidth)
                
                
                Spacer()
            }
            
        }.onAppear(){
            addData()
        }
    }
}

//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailScreen()
//    }
//}

private struct headerView: View {
    var title:String
    var body: some View {
        VStack{
            BarChartView()
                .padding(.top , 30)
                .padding(.trailing , 75)
            
            HStack{
                VStack(alignment: .leading){
                    Text(title)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                }
                .frame(alignment: .leading)
                .padding(.leading , 70)
                
                Spacer()
            }
            .padding(.top , 50)
        }
    }
}

struct BarChartView: View {
    
    let weekdays = [100,200,300,400,500] //Calendar.current.shortWeekdaySymbols
    let steps = [ 30, 40, 50, 40,30]
    
    var body: some View {
        Chart() {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark(x: .value("Day", weekdays[index]), y: .value("Steps", steps[index]),width: 50)
                    .foregroundStyle(Gradient(colors: [Color.blue.opacity(0.6) , Color.red.opacity(0.2)]))
                    .cornerRadius(10)
                    .annotation(position: .top, alignment: .top, spacing: 2.0) {
                        Text("\(steps[index])")
                            .font(.system(size:10))
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                            .padding(.bottom , 10)
                    }
                   
            }
        }.frame(width: 400,height: 250,alignment: .center)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .padding(20.0)
        
    }
}

private  struct ListCell: View {
    @Binding var currentTitle:String
    @State var title:String = ""
    @State var desc:String = ""
    @State var price:String = ""
    @State var per:String = ""
    var dict:NSMutableDictionary!
    @State var currentColor:Color = Color.yellow
    @Binding var isPresentedDetail:Bool
    var body: some View {
        VStack{
            HStack{
                HStack{
                    VStack(alignment: .center){
                        
                        Image(systemName: "arrow.up")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                            .rotationEffect(.degrees(45))
                            
                        
                        Text(title)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        
                        Text(desc)
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .padding(.top,-4)
                       
                    }
                    //.padding(.all , 50)
                }
                //.padding(.all ,10)
                .background(currentColor.opacity(0.0))
            }
            .frame(width: 150 ,height: 150)
            .background(currentColor.opacity(0.5))
            .cornerRadius(30.0)
            //.padding(.all ,5)
            .onTapGesture {
                currentTitle = title
                isPresentedDetail.toggle()
            }
        }
        .onAppear(){
            if let strIndex = dict["index"] as? String{
                if strIndex == "0"{
                    currentColor = Color.purple
                }else if strIndex == "1"{
                    currentColor = Color.pink
                }else if strIndex == "2"{
                    currentColor = Color.green
                }else if strIndex == "3"{
                    currentColor = Color.blue
                }
            }
            
            if let strTitle = dict["title"] as? String{
                title = strTitle
            }
            
            if let strDesc = dict["desc"] as? String{
             desc = strDesc
            }
            
            if let strPrice = dict["price"] as? String{
                price = strPrice
            }
            
            if let strPer = dict["per"] as? String{
                per = strPer
            }
        }
    }
    
}
