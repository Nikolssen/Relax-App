//
//  DashboardTabView.swift
//  Relax App
//
//  Created by Ivan Budovich on 2/21/22.
//

import SwiftUI

struct DashboardTabView: View {
    @State var dashboardViewModel: DashboardViewModel
    var body: some View {
        ZStack {
            Color.outerSpace.ignoresSafeArea()
            VStack {
            NavigationBar()
            TabView {
                DashboardView(viewModel: dashboardViewModel)
                    .tag(0)
                    .tabItem {
                        Image.Icons.logo
                    }
                PlayerView()
                    .tag(1)
                    .tabItem {
                        Image.Icons.tunes
                    }
                
                UserView(viewModel: dashboardViewModel)
                    .tag(2)
                    .tabItem {
                        Image.Icons.user
                    }
                HealthView()
                    .tag(3)
                    .tabItem {
                        Image.Icons.caduceus
                    }
                AuthorView()
                    .tag(4)
                    .tabItem {
                        Image.Icons.misc
                    }
            }
            .accentColor(Color.white)
            }
        }
    }
    
    init(dashboardViewModel: DashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
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
