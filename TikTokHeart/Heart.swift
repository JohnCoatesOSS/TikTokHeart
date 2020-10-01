//
//  Heart.swift
//  Created on 9/30/20
//

import SwiftUI

struct Heart: View {
    @State private var isActive: Bool = false

    static private let inactiveColor = Color.white
    static private let activeColor = Color(red: 0.93, green: 0.18, blue: 0.36)
    static private let heartGlpyhName = "heart.fill"
    static private let animationDuration: Double = 0.25

    var body: some View {
        ZStack {
            // inactive heart
            Image(systemName: Self.heartGlpyhName)
                .resizable()
                .foregroundColor(Self.inactiveColor)
                .scaleEffect(isActive ? 0 : 1)
                .animation(isActive ? .easeInOut(duration: Self.animationDuration) : nil)

            // active heart
            Image(systemName: Self.heartGlpyhName)
                .resizable()
                .foregroundColor(Self.activeColor)
                .scaleEffect(isActive ? 1 : 0.001)
                .animation(isActive ? bounce() : .easeInOut(duration: Self.animationDuration))

            // expanding circle
            Circle()
                .strokeBorder(lineWidth: isActive ? 4 : 12, antialiased: false)
                .foregroundColor(Self.activeColor)
                .opacity(isActive ? 0 : 1)
                .scaleEffect(isActive ? 1.8 : 0)
                .animation(isActive ? circleExpand() : nil)
        }.onTapGesture {
            self.isActive.toggle()
        }
    }

    func bounce() -> Animation {
        Animation.spring(response: 0.6, dampingFraction: 0.3, blendDuration: 0)
            .delay(Self.animationDuration)
            .speed(1.6)
    }

    func circleExpand() -> Animation {
        Animation.easeInOut(duration: Self.animationDuration).delay(Self.animationDuration * 0.4)
    }
}

// MARK: - Preview

struct Heart_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            .edgesIgnoringSafeArea(.all)

            Heart()
                .frame(width: 200, height: 200)
        }
    }
}
