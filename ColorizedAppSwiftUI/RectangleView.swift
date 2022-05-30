//
//  ColorizedView.swift
//  ColorizedAppSwiftUI
//
//  Created by Артём Дмитриев on 26.05.2022.
//

import SwiftUI

struct RectangleView: View {
  let red: Double
  let green: Double
  let blue: Double
  
  
  var body: some View {
    Color(
      red: red / 255,
      green: green / 255,
      blue: blue / 255
    )
    .cornerRadius(10)
    .overlay(RoundedRectangle(cornerRadius: 10)
              .stroke(Color.white, lineWidth: 5))
    .frame(height: 200)
    .shadow(color: Color.black.opacity(0.5), radius: 4, x: 2, y: 2)
  }
}

struct RectangleView_Previews: PreviewProvider {
  static var previews: some View {
    RectangleView(red: 100, green: 100, blue: 100)
  }
}
