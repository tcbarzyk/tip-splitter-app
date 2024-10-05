//
//  ContentView.swift
//  we-split
//
//  Created by Teddy Barzyk on 10/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputAmount: Double? = nil
    @State var numberOfPeople: Int? = nil
    @State var tipAmount: String = "0"
    
    var totalAmount: Double {
        let amount = inputAmount ?? 0
        return amount * (1 + (Double(tipAmount)! * 0.01))
    }
    
    var amountPerPerson: Double {
        let people = numberOfPeople ?? 1
        return people > 0 ? totalAmount / Double(people) : totalAmount
    }
    
    let tipAmounts = ["10", "15", "20", "25", "0"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Dollar Amount", value: $inputAmount, format: .number)
                            .keyboardType(.decimalPad)
                        TextField("Number of People", value: $numberOfPeople, format: .number)
                            .keyboardType(.numberPad)
                    }
                    Section ("Select Tip Amount") {
                        Picker ("Tip Amount", selection: $tipAmount) {
                            ForEach(tipAmounts, id:\.self) { tip in Text("\(tip)%") }
                        }
                        .pickerStyle(.segmented)
                    }
                    Section ("Check Total") {
                        Text("\(totalAmount, format: .currency(code: "USD"))")
                    }
                    Section ("Amount Per Person") {
                        Text("\(amountPerPerson, format: .currency(code: "USD"))")
                    }
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
