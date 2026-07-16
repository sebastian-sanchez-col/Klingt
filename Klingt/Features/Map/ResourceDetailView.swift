//
//  ResourceDetailView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import SwiftUI

struct ResourceDetailView: View {
    let resource: Resource

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: resource.category.iconName)
                    .font(.title)
                    .foregroundStyle(resource.category.tintColor)
                VStack(alignment: .leading) {
                    Text(resource.name).font(.title2.bold())
                    Text(resource.category.rawValue).foregroundStyle(.secondary)
                }
            }

            Label(resource.address, systemImage: "mappin.and.ellipse")
            Label("\(resource.distanceInKm, specifier: "%.1f") km de distancia", systemImage: "location")
            Label("\(resource.rating, specifier: "%.1f") de calificación", systemImage: "star.fill")

            Spacer()

            Button("Cómo llegar") { }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ResourceDetailView(resource: Resource(
            id: UUID(), name: "Clínica Legal Gratuita", category: .legal, distanceInKm: 2.3,
            rating: 4.6, coordinate: .init(latitude: 6.2447, longitude: -75.5748),
            address: "Cra 43A #10-25, El Poblado"
        ))
    }
}
