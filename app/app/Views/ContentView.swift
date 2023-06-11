//
//  ContentView.swift
//  scylla
//
//  Created by Rayan Khan on 2/28/23.
//
import Foundation
import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .tint(.pink)
                    Text("Home")
                        .foregroundColor(.pink)
                }
            SignView()
                .tabItem {
                    Image(systemName: "signature")
                    Text("Sign IPA")
                }
            OtherView()
                .tabItem {
                    Image(systemName: "gear")
                        .tint(.pink)
                    Text("Settings & Other")
                        .foregroundColor(.pink)
                }
            TestingView()
                .tabItem {
                    Image(systemName: "ladybug")
                        .tint(.pink)
                    Text("Testing")
                        .foregroundColor(.pink)
                }
            
        }.accentColor(.pink) 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
