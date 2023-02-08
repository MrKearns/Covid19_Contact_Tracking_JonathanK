//
//  ContentView.swift
//  Covid19_Contact_Tracking_JonathanK
//
//  Created by Jonathan Kearns on 2/2/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var exposedToggle = false
    @State private var positiveToggle = false
    
    var body: some View {
        NavigationView{
        VStack{
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height:300)
            HStack {
                Text("Covid-19")
                    .foregroundColor(.red)
                Text("Contact Tracing")
            }
            .font(.title)
            
            
            Text("In the last week have you:")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, -15.0)
                .padding(.horizontal)
                .padding(.top)
                .foregroundColor(.secondary)
                
            
            
            Toggle(isOn: $exposedToggle){
                Text("been exposed to COVID?")
            }
            .padding()
            
            Toggle(isOn: $positiveToggle){
                Text("tested positive for COVID?")
                    
            }
            
            .padding()
            Spacer(minLength: 200)
            
            
                NavigationLink(destination: SymptomsView()){
                    Text("Submit")
                }
                .buttonStyle(.bordered)
                .cornerRadius(15)
                .foregroundColor(.red)
            
            Text("Your Currnet location will be sent to to us")
                .font(.footnote)
                .foregroundColor(.secondary)


                
            }
            
            Spacer()
            
        }
        
        .navigationTitle("back")
        .navigationBarTitleDisplayMode(.inline)
        

    }
     
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
