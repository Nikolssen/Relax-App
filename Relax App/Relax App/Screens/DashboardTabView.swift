//
//  DashboardTabView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/21/22.
//

import SwiftUI

struct DashboardTabView: View {
    var body: some View {
        ZStack {
            Color.outerSpace.ignoresSafeArea()
            VStack {
            NavigationBar()
            TabView {
                DashboardView()
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
            .accentColor(Color.white)
            }
        }
    }
    
    init() {
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.selected.iconColor = UIColor.white
        itemAppearance.normal.iconColor = UIColor.white.withAlphaComponent(0.5)
        let appeareance = UITabBarAppearance()
        appeareance.configureWithOpaqueBackground()
        appeareance.stackedLayoutAppearance = itemAppearance
        appeareance.inlineLayoutAppearance = itemAppearance
        appeareance.compactInlineLayoutAppearance = itemAppearance
        appeareance.backgroundColor = UIColor.outerSpace
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appeareance
        }
        UITabBar.appearance().standardAppearance = appeareance

    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
