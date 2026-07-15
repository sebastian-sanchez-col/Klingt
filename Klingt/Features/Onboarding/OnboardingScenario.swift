//
//  OnboardingScenario.swift
//  Klingt
//
//  Created by Juan Sanchez on 15/07/26.
//

import Foundation

enum OnboardingScenario: Int, CaseIterable {
    case tasks = 0
    case map
    case community
    
    var title: String {
        switch self {
        case .tasks:
            return "Organiza tu llegada"
        case .map:
            return "Encuentra apoyo cercano"
        case .community:
            return "Conecta con la comunidad"
        }
    }
    
    var description: String {
        switch self {
        case .tasks:
            return "Sigue una lista de tareas personalizada para realizar tus trámites legales, buscar vivienda y empleo sin complicaciones."
        case .map:
            return "Localiza puntos de ayuda legal gratuita, centros de salud, alimentación y servicios esenciales en el mapa de la ciudad."
        case .community:
            return "Resuelve tus dudas sobre arriendos, transporte o empleo conversando con personas que ya pasaron por lo mismo."
        }
    }
    
    var imageName: String {
        switch self {
        case .tasks:
            return "onboarding_tasks"
        case .map:
            return "onboarding_map"
        case .community:
            return "onboarding_community"
        }
    }
}
