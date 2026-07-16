//
//  MapView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.2442, longitude: -75.5812),
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )
    )

    var body: some View {
        VStack(spacing: 0) {
            searchBar
            filterChips

            ZStack(alignment: .bottom) {
                Map(position: $cameraPosition, selection: $viewModel.selectedResource) {
                    ForEach(viewModel.filteredResources) { resource in
                        Marker(resource.name, systemImage: resource.category.iconName, coordinate: resource.coordinate)
                            .tint(resource.category.tintColor)
                            .tag(resource)
                    }
                }

                if let resource = viewModel.selectedResource {
                    resourceCard(resource)
                        .padding()
                }
            }
        }
        .task { await viewModel.load() }
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
            TextField("Buscar ayuda legal, refugios...", text: $viewModel.searchText)
            Image(systemName: "mic.fill").foregroundStyle(.secondary)
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
        .padding(.horizontal)
        .padding(.top, 8)
    }

    private var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                filterChip(title: "Filtros", category: nil)
                ForEach(ResourceCategory.allCases) { category in
                    filterChip(title: category.rawValue, category: category)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }

    private func filterChip(title: String, category: ResourceCategory?) -> some View {
        let isSelected = viewModel.selectedCategory == category
        return Button {
            viewModel.selectedCategory = isSelected ? nil : category
        } label: {
            Text(title)
                .font(.footnote.weight(.medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule().fill(isSelected ? Color.accentColor : Color(.secondarySystemBackground))
                )
                .foregroundStyle(isSelected ? .white : .primary)
        }
    }

    private func resourceCard(_ resource: Resource) -> some View {
        Button {
            viewModel.openDetail(resource)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(resource.name).font(.headline).foregroundStyle(.primary)
                    Text("\(resource.distanceInKm, specifier: "%.1f") km · ⭐️ \(resource.rating, specifier: "%.1f")")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text("Cómo llegar")
                    .font(.subheadline.bold())
                    .foregroundStyle(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(Color.accentColor))
            }
            .padding()
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MapView(viewModel: MapViewModel(coordinator: MapCoordinator()))
}
