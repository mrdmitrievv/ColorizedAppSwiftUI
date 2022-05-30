//
//  ColorizedTF.swift
//  ColorizedAppSwiftUI
//
//  Created by Артём Дмитриев on 30.05.2022.
//

import SwiftUI

struct ColorizedTF: View {
  @Binding var colorValue: Double
  @Binding var textFieldValue: String
  @State private var alertPresented = false
  
  var body: some View {
    TextField(
      "\(lround(colorValue))",
      text: $textFieldValue,
      onCommit: checkValue
    )
    .bordered()
    .alert(isPresented: $alertPresented) {
        Alert(title: Text("Wrong Format!"),
              message: Text("Enter number from 0 to 255"))
    }
  }
}
 
extension ColorizedTF {
  private func checkValue() {
    if let value = Int(textFieldValue), (0...255).contains(value) {
      colorValue = Double(value)
    } else {
      alertPresented.toggle()
      textFieldValue = "\(lround(colorValue))"
    }
  }
  
}


struct ColorizedTF_Previews: PreviewProvider {
    static var previews: some View {
      ColorizedTF(colorValue: .constant(100),
                  textFieldValue: .constant("100"))
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
