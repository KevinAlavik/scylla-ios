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
                    Image(systemName: "Door")
                        .tint(.pink)
                    Text("Home")
                        .foregroundColor(.pink)
                }
            SignView()
                .tabItem {
                    Image(systemName: "signature")
                    Text("Signing")
                }
            OtherView()
                .tabItem {
                    Image(systemName: "shippingbox.fill")
                        .tint(.pink)
                    Text("Other")
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
