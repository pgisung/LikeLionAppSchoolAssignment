//
//  ContentView.swift
//  SampleMap
//
//  Created by Jongwook Park on 2023/08/01.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                .frame(height: 400)
            
            Map(coordinateRegion: $region, annotationItems: [Annotation(coordinate: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769))]) { annotation in
                
                // MapPin은 iOS 16에서 사라짐
                // MapPin(coordinate: annotation.coordinate)
                
                MapMarker(coordinate: annotation.coordinate)
            }
            .frame(height: 400)
        }
    }
}

struct Annotation: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
