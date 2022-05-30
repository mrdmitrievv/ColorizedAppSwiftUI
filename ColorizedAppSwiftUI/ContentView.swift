//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Артём Дмитриев on 26.05.2022.
//

import SwiftUI

struct ContentView: View {
  
  @State private var redColorValue = Double.random(in: 0...255)
  @State private var greenColorValue = Double.random(in: 0...255)
  @State private var blueColorValue = Double.random(in: 0...255)
  
  var body: some View {
    ZStack {
      Color(white: 0.8)
        .ignoresSafeArea()
      VStack(spacing: 20) {
        RectangleView(red: redColorValue, green: greenColorValue, blue: blueColorValue)
        ColorizedController(colorValue: $redColorValue, color: .red)
        ColorizedController(colorValue: $blueColorValue, color: .blue)
        ColorizedController(colorValue: $greenColorValue, color: .green)
        Spacer()
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



