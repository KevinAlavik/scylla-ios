//
//  ContentView.swift
//  scylla
//
//  Created by Kevin Alavik on 2023-02-25.
//
import Foundation
import SwiftUI

let deviceModel = UIDevice.modelName
let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
var systemVersion = UIDevice.current.systemVersion
var sysName = UIDevice.current.systemName
let repositoryUrl = "https://api.github.com/repos/KevinAlavik/scylla-ios/commits"


struct OtherView: View {
    @State private var showingAlert = false
    @State private var releaseURL: URL? = nil
    @State private var showAlert = false
    @State private var udid = UIDevice.current.identifierForVendor!.uuidString
    var body: some View {
        NavigationView {
            List {
                //MARK: Credits
                Section("Contributes                                                  Roles") {
                    HStack {
                        Image("puffer").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Button("PufferIsADev              Lead Developer") {UIApplication.shared.open(URL(string: "https://twitter.com/pufferisadev")!)}
                            .foregroundColor(Color.primary)
                        
                    }
                    HStack {
                        Image("beef").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Button("MrBeef777                           Developer") {UIApplication.shared.open(URL(string: "https://twitter.com/mrbeef777")!)}
                            .foregroundColor(Color.primary)
                    }
                    HStack {
                        Image("iRayanKhan").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Button("Rayan Khan                       Contributor") {UIApplication.shared.open(URL(string: "https://twitter.com/iRayanKhan")!)}
                            .foregroundColor(Color.primary)
                    }
                }
                //MARK: Testers
                Section("Beta Testers") {
                    HStack {
                        
                        Image("Aleex").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Text("Aleex")
                    }
                    HStack {
                        
                        Image("1359").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Text("Mr.")
                    }
                    HStack {
                        Image("JustDie").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Text("Justdie")
                    }
                    HStack {
                        Image("Madhav").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Text("Madhav")
                    }
                    HStack {
                        Image("Kixrd").resizable().frame(width: 25.0, height: 25.0).cornerRadius(5)
                        Text("Kixrd")
                    }
                }
                //MARK: 🤓 Nerd Info
                Section("🤓 Nerd Info") {
                    
                    HStack(spacing: 10) {
                        Image(systemName: "gear")
                            .foregroundColor(Color.gray)
                        Text(sysName + " " + systemVersion)
                            .foregroundColor(Color.gray)
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "iphone")
                            .foregroundColor(Color.gray)
                            .onTapGesture(perform: simpleSuccess)
                        Text(deviceModel)
                            .foregroundColor(Color.gray)
                    }
            
                    HStack(spacing: 10) {
                        Image(systemName: "number")
                            .foregroundColor(Color.gray)
                            .onTapGesture(perform: simpleSuccess)
                        Text(UIDevice.current.description)
                            .foregroundColor(Color.gray)

                    }
                    HStack(spacing: 10) {
                        Image(systemName: "moon.stars.fill")
                            .foregroundColor(Color.gray)
                        Text("Scylla Version " + appVersion!)
                            .foregroundColor(Color.gray)
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "touchid")
                            .foregroundColor(Color.gray)
                            .onTapGesture(perform: simpleSuccess)
                        Text(udid)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 12.5))
                    }
                }
            }
            .navigationTitle("Scylla")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showingAlert = true
                        
                    }) {
                        Image(systemName: "shippingbox.fill")
                    }.alert(isPresented: $showingAlert) {Alert(title: Text("This Is An Beta!"), message: Text("Some stuff are disabled \n For Example : Repos And Certificates)"), dismissButton: .default(Text("Okie-Dokey")))}.tint(.pink)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "signature")
                    }.alert(isPresented: $showingAlert) {Alert(title: Text("This Is An Beta!"), message: Text("Some Features are disabled \n For Example : Repos And Certificates"), dismissButton: .default(Text("OK")))}.tint(.pink)
                }
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}





func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}
