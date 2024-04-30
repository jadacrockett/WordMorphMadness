//
//  TestView.swift
//  WordMorphMadness
//
//  Created by Jada Crockett on 4/29/24.
//

import SwiftUI

struct TestView : View {
    
    init() {
            UITableView.appearance().backgroundColor = .green // Uses UIColor
        }
    var body: some View {
        ZStack{
            Color.indigo2.ignoresSafeArea()
            NavigationStack {
                VStack {
                    Text("Hello World")
                    NavigationLink(destination: MainTabView()) {
                        Text("Do Something")
                    }
                }
            }
        }
    }
}

#Preview {
    TestView()
}
