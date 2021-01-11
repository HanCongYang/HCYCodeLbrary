//
//  SwipeToDismiss.swift
//  SwiftUILearn
//
//  Created by 韩丛旸 on 2020/12/29.
//

import SwiftUI

struct SwipeToDismiss: View {
    
//    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Button("Done") {
//            self.presentation.wrappedValue.dismiss()
        }
    }
}

struct SwipeToDismiss_Previews: PreviewProvider {
    static var previews: some View {
        SwipeToDismiss()
    }
}
