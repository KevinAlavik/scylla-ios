//
//  ContentView.swift
//  scylla
//
//  Created by Kevin Alavik on 2023-02-25.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct ImportCertView: View {
    @State private var showingAlert = false
    @State private var certPass: String = ""
    var body: some View {
        Text("Import Certificate")
            .font(.system(size: 30))
            .position(x: UIScreen.screenWidth/2, y: 150)
        
        VStack {
            HStack {
                Button(".P12 & .MobileProvision") {
                    openDocumentPicker(fileExtension: "json", allowMultiple: true)
                }.buttonStyle(.borderedProminent).tint(.blue)
            }
            
            HStack {
                TextField("Empty = None    PASSWORD ", text: $certPass)
                    .font(.system(size: 12))
            }
            .textFieldStyle(.roundedBorder)
            .frame(width: 260)
            
            HStack {
                Button() {
                } label: {
                    Text("Save")
                        .frame(width: 37)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .tint(.pink)
            }
        }
        .position(x: UIScreen.screenWidth/2, y: 0)
    }
}

struct ImportCertView_Previews: PreviewProvider {
    static var previews: some View {
        ImportCertView()
    }
}
