//
//  MywebView.swift
//  SwiftUI_WebView
//
//  Created by 이용석 on 2021/06/18.
//

// info.plist에서 인터넷 사용 허가를 받아야함!
// 1.Supported interface orientations (iPhone)
// 2.App Transport Security Settings
// 3.Allow Arbitrary Loads -> YES

import SwiftUI
import WebKit
// UIViewController를 쓸려면 ->  UIViewControllerRepresentable 프로토콜 사용!
struct MywebView: UIViewRepresentable {
    
    @Binding var webName: String?
    
    init(webName: Binding<String?> = .constant("")) {
        _webName = webName
    }
    
    //var urlToLoad: String
// 1. ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        // 언랩핑
        guard let url = URL(string: webName!) else {
            return WKWebView()
        }
        // 웹뷰 인스 턴스 생성
        let webView = WKWebView()
        // 웹뷰 로드
        webView.load(URLRequest(url: url))
        return webView
    }
// 2. 업데니트 ui View
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MywebView>) {
        
    }

}

struct MywebView_Previews: PreviewProvider {
    static var previews: some View {
        MywebView()
    }
}
