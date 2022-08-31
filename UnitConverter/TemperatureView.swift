//
//  TemperatureView.swift
//  UnitConverter
//
//  Created by Daiya Deguchi on 2022/08/30.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var inputNumber = ""
    @State private var inputUnit = K.tempUnit.celcius
    @State private var outputUnit = K.tempUnit.celcius
    
    private var convertUnit: String {
        if inputUnit == K.tempUnit.celcius && outputUnit == K.tempUnit.fahrenheit {
            return K.tempConversionUnit.celToFah
        } else if inputUnit == K.tempUnit.celcius && outputUnit == K.tempUnit.kelvin {
            return K.tempConversionUnit.celToKel
        } else if inputUnit == K.tempUnit.fahrenheit && outputUnit == K.tempUnit.celcius {
            return K.tempConversionUnit.fahToCel
        } else if inputUnit == K.tempUnit.fahrenheit && outputUnit == K.tempUnit.kelvin {
            return K.tempConversionUnit.fahToKel
        } else if inputUnit == K.tempUnit.kelvin && outputUnit == K.tempUnit.celcius {
            return K.tempConversionUnit.kelToCel
        } else if inputUnit == K.tempUnit.kelvin && outputUnit == K.tempUnit.fahrenheit {
            return K.tempConversionUnit.kelToFah
        }
        return ""
    }

    private var result: String {
        switch(convertUnit) {
        case K.tempConversionUnit.celToFah:
            return String(format: "%.1f", (Double(inputNumber) ?? 0.0 * 1.8) + 32)
        case K.tempConversionUnit.celToKel:
            return String(format: "%.1f", (Double(inputNumber) ?? 0.0) + 273.15)
        case K.tempConversionUnit.fahToCel:
            return String(format: "%.1f", (((Double(inputNumber) ?? 0.0) - 32) * 5) / 9)
        case K.tempConversionUnit.fahToKel:
            return String(format: "%.1f", ((((Double(inputNumber) ?? 0.0) - 32) * 5) / 9) + 273.15)
        case K.tempConversionUnit.kelToCel:
            return String(format: "%.1f", (Double(inputNumber) ?? 0.0) - 273.15)
        case K.tempConversionUnit.kelToFah:
            return String(format: "%.1f", ((((Double(inputNumber) ?? 0.0) - 273.15) * 5) / 9) + 32)
        default:
            return String(Double(inputNumber) ?? 0.0)
        }
    }
    
    private let units = [K.tempUnit.celcius, K.tempUnit.fahrenheit, K.tempUnit.kelvin]
    
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
