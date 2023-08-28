//
//  File.swift
//  NETFLIX
//
//  Created by MUNAVAR PM on 26/08/23.
//

import SwiftUI


struct ButtonLabel: View {
    
    let text : String
    let width : CGFloat
    let backgroundColor : Color
    let textColor : Color
    
    var body: some View {
        ZStack{
            Capsule()
                .foregroundColor(backgroundColor)
                .frame(width: width,height: 40)
            Text(text)
                .foregroundColor(textColor)
                .bold()
        }
    }
}
