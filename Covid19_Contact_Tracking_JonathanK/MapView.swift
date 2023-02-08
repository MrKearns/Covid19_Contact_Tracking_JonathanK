//
//  MapView.swift
//  Covid19_Contact_Tracking_JonathanK
//
//  Created by Jonathan Kearns on 2/2/23.
//

import SwiftUI
import MapKit



struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    
    
    
    var body: some View{
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(.pink)
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
            }
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3315116, longitude:-121.891054), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
            
        } else {
            print("turn on")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location restricted")
        case .denied:
            print("Location Denied. Change in Settings")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            let myLocation = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = myLocation
            annotation.title = "Here"
        @unknown default:
            break
        }
        
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
//    func addPin(coordinate: CLLocationCoordinate2D){
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = coordinate
//        annotation.title = ""
//        mapView.addAnnotation(annotation)
//    }
    
    
    
}
