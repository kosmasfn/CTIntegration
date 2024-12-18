/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI
import CleverTapSDK

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                .onChange(of: showFavoritesOnly) { oldValue, newValue in
                    CTevent.onFavoriteToggleOn(isOn: newValue)
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }.task {
            CTevent.onFavoritePageVisited()
        }.background(.black)
    }
    
//    private func initInAppInbox(){
//        CTevent.onInboxPageVisited()
//        CleverTap.sharedInstance()?.initializeInbox(callback: ({ (success) in
//                let messageCount = CleverTap.sharedInstance()?.getInboxMessageCount()
//                let unreadCount = CleverTap.sharedInstance()?.getInboxMessageUnreadCount()
//                print("Inbox Message:\(String(describing: messageCount))/\(String(describing: unreadCount)) unread")
//         }))
//        
//        // config the style of App Inbox Controller
//        let style = CleverTapInboxStyleConfig.init()
//        style.title = "App Inbox"
//        style.backgroundColor = UIColor.blue
//        style.messageTags = ["tag1", "tag2"]
//        style.navigationBarTintColor = UIColor.blue
//        style.navigationTintColor = UIColor.blue
//        style.tabUnSelectedTextColor = UIColor.blue
//        style.tabSelectedTextColor = UIColor.blue
//        style.tabSelectedBgColor = UIColor.blue
//        style.firstTabTitle = "My First Tab"
//        
////        if let inboxController = CleverTap.sharedInstance()?.newInboxViewController(with: style, andDelegate: self) {
////            let navigationController = UINavigationController.init(rootViewController: inboxController)
////            self.present(navigationController, animated: true, completion: nil)
////       }
//    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
