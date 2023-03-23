//
//  HomeView.swift
//  scylla
//
//  Created by Kevin Alavik on 2/28/23.
//
import SwiftUI
import UniformTypeIdentifiers
import Foundation

let scyllaVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
var repoData: String = ""

struct PrivateBeta: View {
    @Environment(\.dismiss) var dismiss
    @State private var key: String = ""
    var body: some View {
        Image(systemName: "lock.trianglebadge.exclamationmark.fill").resizable().frame(width: 75.0, height: 75.0)
            .foregroundColor(Color(.systemRed))
            .tint(.yellow)
            .padding()
            .onAppear {
                getSecretKey()
            }
        Text("This Is A Private Beta!")
            .font(.headline)
            .bold()
        Text("The Scylla Team Has Spent Alot of time on this so dont Leak it!")
            .font(.caption2)
            .bold()
            .padding()
        VStack {
            Text("Beta Key (#secret-keys for the Key)")
            TextField("Enter Key Here", text: $key)
        }.frame(width: 300).textFieldStyle(.roundedBorder)
        Button("Enter", action: close)
            .buttonStyle(.borderedProminent).tint(.black)
            .padding()
        Text("Keep In Mind This Is An Beta And Feautures Might Be Broken")
            .foregroundColor(.red)
            .font(.caption)
        
        
            .interactiveDismissDisabled()
    }
    
    func close() {
        if (checkSecretKey(inpt: key)) { dismiss() }
    }
}

struct HomeView: View {
  @State private var showAlert = false
  @State private var showingAlert = false
  @State private var mainRepoUrl =
    "https://puffer.is-a.dev/scylla-ios/cdn/repoTemplate.json"
  @State private var certImported = true
  @State private var showNoCertAlert = false
  @ObservedObject var repoData = RepoModel()
  @State private var showingPrivBeta = true
  var body: some View {
    NavigationView {
      List {
        Section("WIP") {
          VStack {
              Text("Work in progress")
          }.onAppear(perform: {
            repoData.fetchData(repoUrl: mainRepoUrl)
          })
        }
        //MARK: Custom Cert
        Section("Custom Cert") {
          HStack {
            Image(systemName: "square.and.arrow.down")
            NavigationLink(destination: ImportCertView()) {
              Text("Certificate")
                .foregroundColor(.black)
            }.tint(.pink)
          }
          HStack {
            Image(systemName: "square.and.arrow.down")
            NavigationLink(destination: SelectCertView()) {
                Text("Select Certificate")
                    .foregroundColor(.pink)
            }.tint(.pink)
          }
        }.alert(isPresented: $showNoCertAlert) {
          Alert(
            title: Text("No Cert Imported!"), message: Text("You havent imported any certs!"),
            primaryButton: .destructive(Text("Cancel")),
            secondaryButton: .default(Text("Import Certificate")))
        }
      }
      .navigationTitle("Scylla")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            showingAlert = true

          }) {
            Image(systemName: "shippingbox.fill")
          }.alert(isPresented: $showingAlert) {
            Alert(
              title: Text("This is an beta!"),
              message: Text("Some stuff are disabled \n(Such as repos, custom certs)"),
              dismissButton: .default(Text("Got it!")))
          }.tint(.pink)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            showingAlert = true
          }) {
            Image(systemName: "signature")
          }.alert(isPresented: $showingAlert) {
            Alert(
              title: Text("This Is A Beta!"),
              message: Text("Some Features Are Disabled \n For Example : Repos and Custom Certificate"),
              dismissButton: .default(Text("OK")))
          }.tint(.black)
        }
      }
    }.onAppear(perform: {
      if certImported { showNoCertAlert = false } else { showNoCertAlert = true }
    }).sheet(isPresented: $showingPrivBeta, content: PrivateBeta.init)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
