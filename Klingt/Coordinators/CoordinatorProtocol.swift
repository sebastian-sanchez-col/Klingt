//
//  CoordinatorProtocol.swift
//  Klingt
//
//  Created by Juan Sanchez on 25/07/26.
//

import Combine

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var objectWillChangePublisher: AnyPublisher<Void, Never> { get }
    
    func start()
}

protocol SelfInstantiatingCoordinator: Coordinator {
    static func make() -> Self
}

extension Coordinator {
    func existingChildCoordinator<T: Coordinator>(ofType type: T.Type) -> T? {
        childCoordinators.first { $0 is T } as? T
    }

    func childCoordinator<T: SelfInstantiatingCoordinator>(ofType type: T.Type) -> T {
        if let existing = existingChildCoordinator(ofType: type) {
            return existing
        }
        let new = T.make()
        childCoordinators.append(new)
        return new
    }
}

extension Coordinator where Self: ObservableObject, ObjectWillChangePublisher == ObservableObjectPublisher {
    var objectWillChangePublisher: AnyPublisher<Void, Never> {
        objectWillChange
            .map { _ in () }
            .eraseToAnyPublisher()
    }
}
