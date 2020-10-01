//
//  ContentView.swift
//  Created on 9/30/20
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            .edgesIgnoringSafeArea(.all)
            
            Heart()
                .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
