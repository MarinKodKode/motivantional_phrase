//
//  PhrasesWidgetLiveActivity.swift
//  PhrasesWidget
//
//  Created by Edgar Calderón on 07/04/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PhrasesWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PhrasesWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PhrasesWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PhrasesWidgetAttributes {
    fileprivate static var preview: PhrasesWidgetAttributes {
        PhrasesWidgetAttributes(name: "World")
    }
}

extension PhrasesWidgetAttributes.ContentState {
    fileprivate static var smiley: PhrasesWidgetAttributes.ContentState {
        PhrasesWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PhrasesWidgetAttributes.ContentState {
         PhrasesWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PhrasesWidgetAttributes.preview) {
   PhrasesWidgetLiveActivity()
} contentStates: {
    PhrasesWidgetAttributes.ContentState.smiley
    PhrasesWidgetAttributes.ContentState.starEyes
}
