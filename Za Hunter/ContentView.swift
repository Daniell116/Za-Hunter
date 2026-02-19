//
//  ContentView.swift
//  Za Hunter
//
//  Created by daniell Escareno on 2/10/26.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var startPosition = MapCameraPosition.userLocation(fallback: .automatic)
    @State private var mapRegion = MKCoordinateRegion()
    @State private var locationManager = LocationManager()
    @State private var places = [Place]()
    var body: some View {
        NavigationView {
            Map(position: $startPosition) {
                UserAnnotation()
                ForEach(places) { place in
                    Annotation(place.mapItem.name!, coordinate: place.mapItem.placemark.coordinate) {
                        Image("Pizza")
                    }
                }
            }
            .onMapCameraChange { context in
                mapRegion = context.region
                peformSearch(item: "Pizza")
            }
            .navigationBarTitle("Za Hunter", displayMode: .inline)
            .toolbarBackgroundVisibility(.hidden, for: .navigationBar)
        }
    }
    func peformSearch(item: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = item
        searchRequest.region = mapRegion
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            if let response = response {
                places.removeAll()
                for mapItem in response.mapItems {
                    places.append(Place(mapItem: mapItem))
                }
            }
        }
        }
        }

#Preview {
    ContentView()
}
struct Place: Identifiable {
    var id = UUID()
    var mapItem: MKMapItem
}
