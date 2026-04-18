//  HomeWidget.swift
//  HomeWidget

import WidgetKit
import SwiftUI

private let appGroupId = "group.com.example.calendarproject2407"

struct WorkEntry: TimelineEntry {
    let date: Date
    let workRecord: Double
    let wage: Int
}

struct WorkProvider: TimelineProvider {
    func placeholder(in context: Context) -> WorkEntry {
        WorkEntry(date: Date(), workRecord: 0.0, wage: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (WorkEntry) -> Void) {
        completion(loadEntry())
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WorkEntry>) -> Void) {
        let entry = loadEntry()
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }

    private func loadEntry() -> WorkEntry {
        let defaults = UserDefaults(suiteName: appGroupId)
        let workRecord = defaults?.double(forKey: "workRecord") ?? 0.0
        let wage = defaults?.integer(forKey: "wage") ?? 0
        return WorkEntry(date: Date(), workRecord: workRecord, wage: wage)
    }
}

// MARK: - Lock Screen View

struct AccessoryRectangularView: View {
    let entry: WorkEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("이번주")
                .font(.system(size: 13))
                .foregroundColor(.secondary)
            Text(String(format: "%.1f공수", entry.workRecord))
                .font(.system(size: 18, weight: .bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .modifier(WidgetBackgroundModifier())
    }
}

struct WidgetBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content.containerBackground(for: .widget) { Color.clear }
        } else {
            content
        }
    }
}

// MARK: - Widget

struct HomeWidget: Widget {
    let kind: String = "HomeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WorkProvider()) { entry in
            AccessoryRectangularView(entry: entry)
        }
        .configurationDisplayName("이번주 공수")
        .description("잠금 화면에서 이번주 공수를 확인합니다.")
        .supportedFamilies([.accessoryRectangular])
        .contentMarginsDisabled()
    }
}

// MARK: - Preview

struct HomeWidget_Previews: PreviewProvider {
    static var previews: some View {
        AccessoryRectangularView(entry: WorkEntry(date: .now, workRecord: 1.5, wage: 164000))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
