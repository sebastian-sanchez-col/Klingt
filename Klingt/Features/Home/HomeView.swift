//
//  HomeView.swift
//  Klingt
//
//  Created by Juan Sanchez on 14/08/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header

                firstStepsCard

                quickActionsGrid

                nearbyResourcesSection
            }
            .padding()
        }
        .task { await viewModel.load() }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 56, height: 56)
                .foregroundStyle(.white.opacity(0.9))

            Text("¡Bienvenido, \(viewModel.userName)!")
                .font(.title2.bold())
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.accentColor)
        )
    }

    private var firstStepsCard: some View {
        Button(action: viewModel.openTaskList) {
            HStack {
                Image(systemName: "checklist")
                    .font(.title2)
                    .foregroundStyle(Color.accentColor)
                    .padding(10)
                    .background(Circle().fill(Color.accentColor.opacity(0.12)))

                VStack(alignment: .leading, spacing: 2) {
                    Text("Tus primeros pasos")
                        .font(.subheadline.bold())
                        .foregroundStyle(.primary)
                    Text("\(viewModel.pendingTasksCount) tareas pendientes")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.tertiary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color(.secondarySystemBackground)))
        }
        .buttonStyle(.plain)
    }

    private var quickActionsGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            quickActionButton(title: "Legal y Visas", icon: "doc.text.fill")
            quickActionButton(title: "Vivienda", icon: "house.fill")
            quickActionButton(title: "Trabajo", icon: "briefcase.fill")
            quickActionButton(title: "Salud", icon: "cross.case.fill")
        }
    }

    private func quickActionButton(title: String, icon: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(Color.accentColor)
            Text(title)
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color(.secondarySystemBackground)))
    }

    private var nearbyResourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recursos Cercanos")
                .font(.headline)

            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.secondarySystemBackground))
                .frame(height: 140)
                .overlay {
                    // Vista previa simplificada — el mapa real vive en el tab "Mapa".
                    Image(systemName: "map")
                        .font(.system(size: 32))
                        .foregroundStyle(.secondary)
                }

            Button(action: viewModel.openFullMap) {
                Text("Ver Mapa Completo")
                    .font(.subheadline.bold())
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(homeCoordinator: HomeCoordinator(), tabCoordinator: MainTabCoordinator()))
}
