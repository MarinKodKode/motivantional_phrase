//
//  PhrasesWidgetBundle.swift
//  PhrasesWidget
//
//  Created by Edgar Calderón on 07/04/26.
//

import WidgetKit
import SwiftUI

@main
struct PhrasesWidgetBundle: WidgetBundle {
    var body: some Widget {
        PhrasesWidget()
        PhrasesWidgetControl()
        PhrasesWidgetLiveActivity()
    }
}
