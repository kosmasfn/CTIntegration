/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    @State private var showingNews = false

    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                ArtilcleView()
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        showingNews.toggle()
                    } label: {
                        Label("News", systemImage: "newspaper.fill")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("zuck", image: "zuck")
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
            .sheet(isPresented: $showingNews) {
                ArticleListView()
            }
        } detail: {
            Text("Select a Landmark")
        }.task {
            CTevent.onHomePageVisited()
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
