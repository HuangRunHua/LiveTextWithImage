//
//  ContentView.swift
//  LiveTextWithImage
//
//  Created by Runhua Huang on 2022/6/9.
//

import SwiftUI
import VisionKit

struct ContentView: View {
    @State private var deviceSupportLiveText = false
    @State private var detectResult: String = ""
    @State private var showDeviceNotCapacityAlert = false
    @State private var showLiveTextView = false
    var body: some View {
        VStack {
            Text(detectResult)
            Button {
                if deviceSupportLiveText {
                    self.showLiveTextView = true
                } else {
                    self.showDeviceNotCapacityAlert = true
                }
            } label: {
                Text("Pick an Image")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .alert("Live Text Unavailable", isPresented: $showDeviceNotCapacityAlert, actions: {})
        .sheet(isPresented: $showLiveTextView, content: {
            LiveTextInteractionView()
        })
        .onAppear {
            self.deviceSupportLiveText = ImageAnalyzer.isSupported
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
