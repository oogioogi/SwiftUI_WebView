//
//  ContentView.swift
//  SwiftUI_WebView
//
//  Created by 이용석 on 2021/06/18.
//

import SwiftUI

struct ContentView: View {
    @State private var webName: String?
    @State private var tag: String?

    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    var today:Date = Date()
    
    var body: some View {
        
        NavigationView{
            VStack{
                Button(action: {
                    self.webName = "https://daum.net"
                    self.tag  = "1"
                }, label: {
                    Text("Daum")
                })
                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10.0)
                
                Button(action: {
                    self.webName = "https://naver.com"
                    self.tag  = "1"
                }, label: {
                    Text("Naver")
                })
                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10.0)
                .padding(.top, 10.0)
                
                Button(action: {
                    self.webName = "https://google.com"
                    self.tag  = "1"
                }, label: {
                    Text("Goggle")
                })
                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10.0)
                .padding(.vertical, 10.0)
                
                NavigationLink(
                    destination: MywebView(webName: $webName),
                    tag: "1",
                    selection: $tag,
                    label: {EmptyView()})
                
                // 날짜
                Text("오늘은 \(today, formatter: ContentView.dateFormat) 입니다.")
                    .bold()
                    .shadow(color: .pink, radius: 2, x: 5.0, y: 8.0)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
