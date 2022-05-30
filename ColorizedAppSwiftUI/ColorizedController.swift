//
//  ColorizedController.swift
//  ColorizedAppSwiftUI
//
//  Created by Артём Дмитриев on 30.05.2022.
//

import SwiftUI

struct ColorizedController: View {
  @Binding var colorValue: Double
  @State private var textFieldValue: String = ""
  
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
  }
}


struct ColorizedController_Previews: PreviewProvider {
    static var previews: some View {
      ColorizedController(colorValue: .constant(100), color: .red)
    }
}
