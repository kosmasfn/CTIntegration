/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that shows a badge for hiking.
*/

import SwiftUI

struct HikeBadge: View {
    var name: String

    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 200, height: 200)
                .scaleEffect(1.0 / 2.7)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
