//
//  SymptomsView.swift
//  Covid19_Contact_Tracking_JonathanK
//
//  Created by Jonathan Kearns on 2/2/23.
//

import SwiftUI

struct SymptomsView: View {
    
    @State private var item1 = false
    @State private var item2 = false
    @State private var item3 = false
    @State private var item4 = false
    @State private var item5 = false
    @State private var item6 = false
    @State private var item7 = false
    @State private var item8 = false
    @State private var item9 = false
    
    
    
    
    @State private var showAlert = false
    
    var body: some View {
        
        
        
        VStack {
            Text("Symptoms")
                .font(.title)
                List{
                    Section{
                        HStack {
                            Toggle(isOn: $item1){
                                Text("Fever")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item2){
                                Text("Chills")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item3){
                                Text("Congestion")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item4){
                                Text("Loss of Smell")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item5){
                                Text("Loss of Taste")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item6){
                                Text("Nausia")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item7){
                                Text("Sore Throat")
                            }
                        }
                        
                        HStack {
                            Toggle(isOn: $item8){
                                Text("Difficulty Breathing")
                            }
                        }
                        HStack {
                            Toggle(isOn: $item9){
                                Text("Headache")
                            }
                        }
                        
                        
                        
                    } header:{
                        Text("Check all that apply")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(.vertical)
                    }
            
            }
              Button("Submit") {
                  showAlert = true
              }
              .alert(isPresented: $showAlert){
                  Alert(
                    title: Text("Thank you!"),
                    message: Text("Your informeation has been added to you database.\nYou can close the app")
                  )
              }
        }
        
    }
    
        
}

struct SymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsView()
    }
}
