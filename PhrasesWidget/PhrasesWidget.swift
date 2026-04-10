import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), phrase: "Frase motivacional")
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), phrase: loadRandomPhrase())
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, phrase: loadRandomPhrase())
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

    private func loadRandomPhrase() -> String {
        guard let url = Bundle.main.url(forResource: "phrases", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let phrases = try? JSONDecoder().decode([FrasesModel].self, from: data),
              let random = phrases.randomElement() else {
            return "Hoy es un buen día para empezar."
        }
        return random.text
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let phrase: String
}

struct PhrasesWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text("Frase del día:")
                .font(.body)
                .foregroundStyle(.white)
            Text(entry.phrase)
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.semibold)
        }
        .containerBackground(for: .widget) {
            MeshGradient(width: 3, height: 3, points: [
                .init(0, 0), .init(0.5, 0), .init(1, 0),
                .init(0, 0.5), .init(0.6, 0.4), .init(1, 0.5),
                .init(0, 1), .init(0.5, 1), .init(1, 1)
            ], colors: [
                Color(.sRGB, red: 0.9569, green: 0.9412, blue: 0.9255),
                Color(.sRGB, red: 0.7686, green: 0.7216, blue: 0.9098),
                Color(.sRGB, red: 0.5451, green: 0.4902, blue: 0.7490),
                Color(.sRGB, red: 0.9490, green: 0.8667, blue: 0.9098),
                Color(.sRGB, red: 0.8627, green: 0.8118, blue: 0.7216),
                Color(.sRGB, red: 0.6078, green: 0.6588, blue: 0.7686),
                Color(.sRGB, red: 0.9098, green: 0.8667, blue: 0.8157),
                Color(.sRGB, red: 0.7216, green: 0.6588, blue: 0.8471),
                Color(.sRGB, red: 0.4784, green: 0.5451, blue: 0.6863)
            ], smoothsColors: true)
            .overlay(Color.black.opacity(0.08))
        }
    }
}

struct PhrasesWidget: Widget {
    let kind: String = "PhrasesWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            PhrasesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Frases del día")
        .description("Muestra una frase inspiradora.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct FrasesModel: Decodable {
    var id:Int
    var text:String
    enum CodingKeys: String, CodingKey {
        case id
        case text
    }
}

#Preview(as: .systemSmall) {
    PhrasesWidget()
} timeline: {
    SimpleEntry(date: .now, phrase: "Frase Motivacional")
    SimpleEntry(date: .now, phrase: "2da Frase Motivacional")
}
