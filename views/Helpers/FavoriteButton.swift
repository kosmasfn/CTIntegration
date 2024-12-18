/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A button that acts as a favorites indicator.
*/

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var body: some View {
        Button {
            isSet.toggle()
            if(isSet) { CTevent.onFavorite(landmark: landmark) }
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true), landmark: ModelData().landmarks[0])
}
