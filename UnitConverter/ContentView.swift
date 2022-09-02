//
//  ContentView.swift
//  UnitConverter
//
//  Created by Daiya Deguchi on 2022/08/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputNumber = 0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    
    var body: some View {
        NavigationView {
            TabView {
                TemperatureView()
                    .tabItem {
                        Image(systemName: "thermometer")
                        Text("Temperature")
                    }
                LengthView()
                    .tabItem {
                        Image(systemName: "ruler")
                        Text("Length")
                    }
                Text("Time")
                    .tabItem {
                        Image(systemName: "clock")
                        Text("Time")
                    }
                Text("Volume")
                    .tabItem {
                        Image(systemName: "testtube.2")
                        Text("Volume")
                    }
            }
            .navigationTitle("UnitConverter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
