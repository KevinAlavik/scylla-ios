    import SwiftUI
    import UIKit

    struct TestingView: View {
        var body: some View {
            VStack {
                Text("Testing")
                    .padding()
            }.onAppear(perform: {
                testCat()
            })
        }
    }

    struct TestingView_Previews: PreviewProvider {
        static var previews: some View {
            TestingView()
        }
    }
