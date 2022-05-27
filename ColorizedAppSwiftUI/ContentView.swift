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
  
  @State private var alertPresented = false
  
  var body: some View {
    ZStack {
      Color(white: 0.8)
        .ignoresSafeArea()
      VStack(spacing: 20) {
        RectangleView(backgroundColor: Color.init(red: redColorValue / 255, green: greenColorValue / 255, blue: blueColorValue / 255))
        ColorViewController(colorValue: $redColorValue,
                            textFieldValue: $redTextFieldValue,
                            alertPresented: $alertPresented,
                            color: .red)
        ColorViewController(colorValue: $blueColorValue,
                            textFieldValue: $blueTextFieldValue,
                            alertPresented: $alertPresented,
                            color: .blue)
        ColorViewController(colorValue: $greenColorValue,
                            textFieldValue: $greenTextFieldValue,
                            alertPresented: $alertPresented,
                            color: .green)
        Spacer()
      }
      .alert(isPresented: $alertPresented) {
          Alert(title: Text("Wrong Format!"),
                message: Text("Enter number from 0 to 255"))
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
  @Binding var alertPresented: Bool
  
  let color: Color
  
  var body: some View {
    
    HStack(spacing: 10) {
      Text("\(lround(colorValue))")
        .bold()
        .foregroundColor(color)
        .frame(width: 35)
      SliderView(sliderValue: $colorValue, color: color)
      ColorizedTextField(colorValue: $colorValue,
                         textFieldValue: $textFieldValue,
                         alertPresented: $alertPresented)
    }
    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
  }
}

// MARK: TextField

struct ColorizedTextField: View {
  @Binding var colorValue: Double
  @Binding var textFieldValue: String
  @Binding var alertPresented: Bool
  
  var body: some View {
    TextField(
      "\(lround(colorValue))",
      text: $textFieldValue,
      onEditingChanged: { (isBegin) in
        guard !isBegin == true else {
          textFieldValue = ""
          return
        }
        guard let textFieldNumber = Double(textFieldValue) else {
          alertPresented.toggle()
          textFieldValue = String(lround(colorValue))
          return
        }
        
        if textFieldNumber <= 255 && textFieldNumber >= 0 {
          colorValue = textFieldNumber
          textFieldValue = String(lround(colorValue))
        } else {
          alertPresented.toggle()
          textFieldValue = String(lround(colorValue))
        }
      }
    )
    .bordered()
  }
}

// MARK: Custom modifier for TextField

struct BorderedViewModifier: ViewModifier {
  
  func body(content: Content) -> some View {
    content
      .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
      .frame(width: 50)
      .background(Color.white)
      .foregroundColor(.black)
      .multilineTextAlignment(.center)
      .cornerRadius(4)
      .overlay(
        RoundedRectangle(cornerRadius: 4)
          .stroke(lineWidth: 0.5)
          .foregroundColor(.white)
      )
      .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
  }
}

extension TextField {
  func bordered() -> some View {
    ModifiedContent(content: self, modifier: BorderedViewModifier())
  }
}
