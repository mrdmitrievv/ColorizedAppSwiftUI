//
//  SliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Артём Дмитриев on 26.05.2022.
//

import SwiftUI

struct SliderView: View {
  @Binding var sliderValue: Double
  
  let color: Color
  
    var body: some View {
      Slider(value: $sliderValue, in: 0...255, step: 1)
        .accentColor(color)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
      SliderView(sliderValue: Binding.constant(30), color: .red)
    }
}
