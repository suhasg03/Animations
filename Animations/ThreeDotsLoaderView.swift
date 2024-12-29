//
//  ThreeDotsLoaderView.swift
//  Animations
//
//  Created by Suhas G on 29/12/24.
//

import SwiftUI

struct ThreeDotsLoaderView: View {
    
    @State private var offsetX3: CGFloat = 0
    @State private var offsetX2: CGFloat = 0
    @State private var offsetX1: CGFloat = 0
    
    @State private var isAnimating: Bool = false
    
    @State private var index: Int = -1
    
    @State private var scaleEffect1 = 1.0
    @State private var scaleEffect2 = 1.0
    @State private var scaleEffect3 = 1.0
    
    var body: some View {
        HStack(spacing: 10) {
            VStack {
            }
            .frame(width: 20, height: 20)
            .background(Color.red)
            .clipShape(Circle())
            .offset(x: self.offsetX1)
            .scaleEffect(self.scaleEffect1)
            .animation(.smooth(duration: 0.5), value: isAnimating)
            
            VStack {
            }
            .frame(width: 20, height: 20)
            .background(Color.blue)
            .clipShape(Circle())
            .offset(x: self.offsetX2)
            .scaleEffect(self.scaleEffect2)
            .animation(.smooth(duration: 0.5), value: isAnimating)
            
            VStack {
            }
            .frame(width: 20, height: 20)
            .background(Color.green)
            .clipShape(Circle())
            .offset(x: self.offsetX3)
            .scaleEffect(self.scaleEffect3)
            .animation(.smooth(duration: 0.5), value: isAnimating)
            
            Button("Animate") {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    self.index += 1
                    if self.index % 3 == 0 {
                        self.offsetX3 = -40
                        self.offsetX2 += 30
                        self.offsetX1 += 30
                        self.scaleEffect3 = 1.5
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            self.scaleEffect3 = 1.0
                            self.isAnimating = false
                            self.offsetX3 = -60
                        }
                    } else if self.index % 3 == 1 {
                        self.offsetX2 = -10
                        self.offsetX1 += 30
                        self.offsetX3 += 30
                        self.scaleEffect2 = 1.5
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            self.scaleEffect2 = 1.0
                            self.isAnimating = false
                            self.offsetX2 = -30
                        }
                    } else {
                        self.offsetX1 = 10
                        self.offsetX3 += 30
                        self.offsetX2 += 30
                        self.scaleEffect1 = 1.5
                        self.isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            self.scaleEffect1 = 1.0
                            self.isAnimating = false
                            self.offsetX1 = 0
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ThreeDotsLoaderView()
}
