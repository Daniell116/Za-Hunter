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
    var body: some View {
        NavigationView {
            Map(position: $startPosition) {
                UserAnnotation()
            }
            .navigationBarTitle("Za Hunter", displayMode: .inline)
            .toolbarBackgroundVisibility(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
