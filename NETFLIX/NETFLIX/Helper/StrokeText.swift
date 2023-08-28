//
//  StrokeText.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import SwiftUI

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width+2, y:  width+2)
                Text(text).offset(x: -width-2, y: -width-2)
                Text(text).offset(x: -width-2, y:  width+2)
                Text(text).offset(x:  width+2, y: -width-2)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeText(text: "", width: 0, color: .black).preferredColorScheme(.dark)
    }
}
