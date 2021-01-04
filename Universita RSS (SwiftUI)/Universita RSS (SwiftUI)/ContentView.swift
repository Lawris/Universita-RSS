//
//  ContentView.swift
//  Universita RSS (SwiftUI)
//
//  Created by Loris Plasson Simoni on 22/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image("logoUniversita")
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                Text("Università RSS")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
            }.padding()
            
            List{
                ForEach(vm.feedItems, id: \.self) { item in
                    FeedItemRow(feedItem: item)
                }
            }
            Spacer()
        }
        .padding(.top)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let vm = ViewModel()
    
    static var previews: some View {
        ContentView()
            .environmentObject(vm)
            .previewDevice("iPhone XR")
    }
}

struct FeedItemRow: View {
    
    var feedItem: UniversitaFeedItem
    
    @State private var showDetail = false

    var body: some View {
        Button(action: {
            self.showDetail.toggle()
        }) {
            VStack {
                HStack {
                    Text(feedItem.title)
                    Spacer()
                }.padding(.bottom)
                HStack {
                    Spacer()
                    Text(feedItem.readableDate)
                        .fontWeight(.bold)
                }
            }
        }.sheet(isPresented: $showDetail, content: {
            FeedItemDetailView(feedItem: feedItem)
        })
    }
}

struct FeedItemDetailView: View {
    
    var feedItem: UniversitaFeedItem
    
    var body: some View {
        VStack {
            HStack {
                Text(feedItem.title)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom)
            HStack {
                Text(feedItem.description)
                Spacer()
            }
            .padding(.bottom)
            HStack {
                Spacer()
                Text(feedItem.readableDate)
            }
            Spacer()
        }.padding()
    }
}
