//
//  DashboardTabView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/21/22.
//

import SwiftUI

struct DashboardTabView: View {
    var body: some View {
        TabView {
            Text("1")
                .tag(0)
                .tabItem {
                    Image.Icons.logo
                }
            Text("2")
                .tag(1)
                .tabItem {
                    Image.Icons.tunes
                }
            Text("3")
                .tag(2)
                .tabItem {
                    Image.Icons.user
                }
        }
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
