/* JellyfinPlayer/Swiftfin is subject to the terms of the Mozilla Public
 * License, v2.0. If a copy of the MPL was not distributed with this
 * file, you can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * Copyright 2021 Aiden Vigue & Jellyfin Contributors
 */

import Combine
import JellyfinAPI
import Stinsen
import SwiftUI

struct NextUpView: View {
    @EnvironmentObject var homeRouter: HomeCoordinator.Router

    var items: [BaseItemDto]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Next Up")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(items, id: \.id) { item in
                        Button {
                            homeRouter.route(to: \.item, item)
                        } label: {
                            PortraitItemView(item: item)
                        }
                    }.padding(.trailing, 16)
                }
                .padding(.leading, 20)
            }
            .frame(height: 200)
        }
    }
}
