//
//  ChangeForwarder.swift
//  Klingt
//
//  Created by Juan Sanchez on 25/07/26.
//

import Combine

/// Adapter: hides Combine's sink/cancellable mechanics behind a
/// plain, imperative interface. This is the ONLY type in the project
/// that needs to know about AnyCancellable/sink.
final class ChangeForwarder {
    private var cancellables = Set<AnyCancellable>()

    /// Forwards change notifications from multiple sources into a single closure.
    func forward(_ sources: [Coordinator], onChange: @escaping () -> Void) {
        sources.forEach { source in
            source.objectWillChangePublisher
                .sink { _ in onChange() }
                .store(in: &cancellables)
        }
    }

    /// Forwards change notifications from a single source (e.g. OnboardingViewModel's coordinator).
    func forward(_ source: Coordinator, onChange: @escaping () -> Void) {
        forward([source], onChange: onChange)
    }
}
