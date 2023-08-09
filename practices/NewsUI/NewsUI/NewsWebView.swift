//
//  NewsWebView.swift
//  NewsUI
//
//  Created by 아라 on 2023/08/08.
//

import SwiftUI
import SafariServices

struct NewsWebView: UIViewControllerRepresentable {
        @Binding var url: URL
        
        func makeUIViewController(context: Context) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
}

struct NewsWebView_Previews: PreviewProvider {
    static var previews: some View {
        NewsWebView(url: .constant(URL(string: "https://www.apple.com/kr/mac-studio/")!))
    }
}
