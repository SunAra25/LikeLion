//
//  ContentView.swift
//  NewsUI
//
//  Created by 아라 on 2023/08/08.
//

import SwiftUI

struct ContentView: View {
    //var newsStore = NewsStore()
    @State private var newsData: [News] = []
    @State var url: URL = URL(string: "https://naver.com")!
    @State var isShowingNewsWeb = false
    
    var body: some View {
        NavigationStack {
            List(newsData, id: \.self) { news in
                Button {
                    guard let url = URL(string: news.newsURLString) else {
                        print("ASDF")
                        return }
                    self.url = url
                    isShowingNewsWeb = true
                } label: {
                    CardView(news: news)
                }
            }
            .listStyle(.inset)
            .navigationTitle(Text("AppSchool News"))
            .sheet(isPresented: $isShowingNewsWeb) {
                NewsWebView(url: $url)
            }
        }
        .onAppear {
            fetchData()
        }
    }
    
    func fetchData() {
        NewsStore().fetchData { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                    DispatchQueue.main.async {
                        newsData = response.items
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("API request error: \(error)")
            }
        }
    }
}

struct CardView: View {
    var news: News
    var body: some View {
        VStack {
            Text(news.title)
                .font(.headline)
            AsyncImage(url: URL(string: news.thumURLString)!) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Text(news.broadcastDate)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
