//
//  TaskListView.swift
//  Klingt
//
//  Created by Juan Sanchez on 16/07/26.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel

    private var progress: Double {
        guard !viewModel.tasks.isEmpty else { return 0 }
        let completed = viewModel.tasks.filter(\.isCompleted).count
        return Double(completed) / Double(viewModel.tasks.count)
    }

    private var groupedTasks: [(section: String, tasks: [HomeTask])] {
        let groups = Dictionary(grouping: viewModel.tasks, by: \.section)
        return groups.keys.sorted().map { ($0, groups[$0] ?? []) }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                progressCard

                ForEach(groupedTasks, id: \.section) { group in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(group.section)
                            .font(.headline)

                        ForEach(group.tasks) { task in
                            taskRow(task)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Tu Lista de Tareas")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var progressCard: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                VStack {
                    Text("\(Int(progress * 100))%").font(.title.bold())
                    Text("Completado").font(.caption)
                }
                .foregroundStyle(.white)
            }
            .frame(width: 120, height: 120)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.accentColor))
        .foregroundStyle(.white)
    }

    private func taskRow(_ task: HomeTask) -> some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? Color.accentColor : .secondary)
            Text(task.title)
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
    }
}

#Preview {
    NavigationStack {
        TaskListView(viewModel: TaskListViewModel(homeCoordinator: HomeCoordinator(), tabCoordinator: MainTabCoordinator()))
    }
}
