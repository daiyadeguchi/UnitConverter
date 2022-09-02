//
//  LengthView.swift
//  UnitConverter
//
//  Created by Daiya Deguchi on 2022/09/03.
//

import SwiftUI

struct LengthView: View {
    
    @State private var inputNumber = ""
    @State private var inputUnit = K.lengthUnit.meter
    @State private var outputUnit = K.lengthUnit.meter
    
    var result = ""
    
    private let units = [K.lengthUnit.meter, K.lengthUnit.mile, K.lengthUnit.yard, K.lengthUnit.foot, K.lengthUnit.inch]
    
    var body: some View {
        Form {
            Section {
                TextField("Enter length", text: $inputNumber)
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
                Text("Enter length for conversion")
            }
            
            Section {
                Text(result)
            } header: {
                Text("In \(outputUnit), length is")
            }
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
