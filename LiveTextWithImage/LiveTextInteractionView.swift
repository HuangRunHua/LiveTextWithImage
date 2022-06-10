//
//  LiveTextInteractionView.swift
//  LiveTextWithImage
//
//  Created by Runhua Huang on 2022/6/9.
//

import SwiftUI

struct LiveTextInteractionView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            LiveTextInteraction(imageName: "1")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
                .interactiveDismissDisabled(true)
        }
    }
}

struct LiveTextInteractionView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTextInteractionView()
    }
}
