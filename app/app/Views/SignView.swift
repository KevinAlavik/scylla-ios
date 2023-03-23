//
//  ContentView.swift
//  scylla
//
//  Created by Kevin Alavik on 2023-02-25.
//
import Foundation
import SwiftUI

struct SignView: View {
    @State private var showingAlert = false
    @State private var customAppName: String = ""
    @State private var customBundleId: String = ""
    var body: some View {
        VStack {
            Text("Signing")
                .font(.system(size: 30))
                .position(x: UIScreen.screenWidth/2, y:500)
            
            HStack {
                Button(".IPA") {
                    openDocumentPicker(fileExtension: "json", allowMultiple: false)
                }.buttonStyle(.borderedProminent).tint(.blue)
                HStack {
                    Button("Certificate") {
                        openDocumentPicker(fileExtension: "yml", allowMultiple: false)
                    }.buttonStyle(.borderedProminent).tint(.cyan)
                }
            }
            
            HStack {
                TextField("App Name                                      Optional ", text: $customAppName)
                    .font(.system(size: 10))
                    .frame(width: 218)
            }
            .textFieldStyle(.roundedBorder)
            .frame(width: 305)
            HStack {
                TextField("Bundle ID                                       Optional ", text: $customBundleId)
                    .font(.system(size: 10))
                    .frame(width: 218)
            }
            .textFieldStyle(.roundedBorder)
            .frame(width: 305)
            
            HStack {
                Button() {
                } label: {
                    Text("Sign")
                        .frame(width: 195)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
        }
        .position(x: UIScreen.screenWidth/2, y: UIScreen.screenHeight/2-350)
        .navigationTitle("Scylla")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showingAlert = true
                        
                    }) {
                        Image(systemName: "shippingbox.fill")
                    }.alert(isPresented: $showingAlert) {Alert(title: Text("This Is An Beta!"), message: Text("Some Features Are Disabled \n For Example : Repos And Certificates"), dismissButton: .default(Text("OK!")))}.tint(.pink)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "signature")
                    }.alert(isPresented: $showingAlert) {Alert(title: Text("This Is An Beta!"), message: Text("Some Features Are Disabled \n Example : Repos And Certificates"), dismissButton: .default(Text("OK")))}.tint(.pink)
                }
            }
    }
}


struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
