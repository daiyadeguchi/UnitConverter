//
//  TemperatureView.swift
//  UnitConverter
//
//  Created by Daiya Deguchi on 2022/08/30.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var inputNumber = ""
    @State private var inputUnit = "Celcius"
    @State private var outputUnit = "Celcius"
    
    private var result = ""
    
    private let units = ["Celcius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        Form {
            Section {
                TextField("Enter temperature", text: $inputNumber)
                    .keyboardType(.decimalPad)
                Picker("From", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                Picker("To", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Enter temperature for conversion")
            }
            
            Section {
                Text(result)
            } header: {
                Text("In \(outputUnit), temperature is")
            }
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
