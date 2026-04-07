//
//  AppIntent.swift
//  PhrasesWidget
//
//  Created by Edgar Calderón on 07/04/26.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configure Phrases" }
    
    @Parameter(title: "Frase Motivacional", default: "Hola Mundo!")
    var phrase: String
}
