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
  
  @State private var redTextFieldValue = ""
  @State private var blueTextFieldValue = ""
  @State private var greenTextFieldValue = ""
  
  var body: some View {
    ZStack {
      Color(white: 0.8)
        .ignoresSafeArea()
      VStack(spacing: 20) {
        RectangleView(red: redColorValue, green: greenColorValue, blue: blueColorValue)
        ColorViewController(colorValue: $redColorValue,
                            textFieldValue: $redTextFieldValue,
                            color: .red)
        ColorViewController(colorValue: $blueColorValue,
                            textFieldValue: $blueTextFieldValue,
                            color: .blue)
        ColorViewController(colorValue: $greenColorValue,
                            textFieldValue: $greenTextFieldValue,
                            color: .green)
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// MARK: ColorController includes Text, Slider and Textfield

struct ColorViewController: View {
  @Binding var colorValue: Double
  @Binding var textFieldValue: String
  
  let color: Color
  
  var body: some View {
    
    HStack(spacing: 10) {
      Text("\(lround(colorValue))")
        .bold()
        .foregroundColor(color)
        .frame(width: 35)
      SliderView(sliderValue: $colorValue, color: color)
        .onChange(of: colorValue) { _ in
          textFieldValue = "\(lround(colorValue))"
        }
      ColorizedTF(colorValue: $colorValue,
                         textFieldValue: $textFieldValue)
    }
    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
  }
}


