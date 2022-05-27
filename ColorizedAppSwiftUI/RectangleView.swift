//
//  ColorizedView.swift
//  ColorizedAppSwiftUI
//
//  Created by Артём Дмитриев on 26.05.2022.
//

import SwiftUI

struct RectangleView: View {
  let backgroundColor: Color
  
  var body: some View {
    Rectangle()
      .frame(height: 200)
      .cornerRadius(10)
      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5))
      .foregroundColor(backgroundColor)
      .padding()
      .shadow(color: Color.black.opacity(0.5), radius: 4, x: 2, y: 2)
  }
}

struct RectangleView_Previews: PreviewProvider {
  static var previews: some View {
    RectangleView(backgroundColor: Color.init(red: 0.4, green: 0.3, blue: 0.7))
  }
}
