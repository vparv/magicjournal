//
//  ContentView.swift
//  magicjournal
//
//  Created by Vineet Parvathala on 12/11/24.
//

import SwiftUI
import Inject


struct ContentView: View {
@ObserveInjection var inject
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello  yodddd!")
        }
        .padding()
        .enableInjection()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
