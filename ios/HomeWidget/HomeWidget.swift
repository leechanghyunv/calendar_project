//
//  HomeWidget.swift
//  HomeWidget
//

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

// MARK: - Lock Screen Views

struct AccessoryRectangularView: View {
    let entry: WorkEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(String(format: "%.1f공수", entry.workRecord))
                    .font(.headline)
            }
            HStack {
                Text("\(entry.wage.formatted())원")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AccessoryInlineView: View {
    let entry: WorkEntry

    var body: some View {
        Text(String(format: "%.1f공수  %@원", entry.workRecord, entry.wage.formatted()))
    }
}

// MARK: - Home Screen View

struct HomeScreenWidgetView: View {
    let entry: WorkEntry

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("공수")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text(String(format: "%.1f공수", entry.workRecord))
                    .font(.headline.bold())
            }
            Divider()
            HStack {
                Text("임금")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(entry.wage.formatted())원")
                    .font(.headline.bold())
            }
        }
        .padding(12)
    }
}

// MARK: - Entry View

struct HomeWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: WorkEntry

    @ViewBuilder
    var body: some View {
        if #available(iOS 17.0, *) {
            Group {
                switch family {
                case .accessoryRectangular:
                    AccessoryRectangularView(entry: entry)
                case .accessoryInline:
                    AccessoryInlineView(entry: entry)
                default:
                    HomeScreenWidgetView(entry: entry)
                }
            }
            .containerBackground(for: .widget) {
                Color(.systemFill)
            }
        } else {
            ZStack {
                Color(.systemFill)
                switch family {
                case .accessoryRectangular:
                    AccessoryRectangularView(entry: entry)
                case .accessoryInline:
                    AccessoryInlineView(entry: entry)
                default:
                    HomeScreenWidgetView(entry: entry)
                }
            }
        }
    }
    
}

// MARK: - Widget

struct HomeWidget: Widget {
    let kind: String = "HomeWidget"

    static var supportedFamilies: [WidgetFamily] {
        var families: [WidgetFamily] = [.systemSmall]
        #if os(iOS)
        families += [.accessoryRectangular, .accessoryInline]
        #endif
        return families
    }

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: WorkProvider()) { entry in
            HomeWidgetEntryView(entry: entry)
                
        }
        .configurationDisplayName("한주간 근로기록")
        .description("공수와 임금을 확인합니다.")
        .supportedFamilies(Self.supportedFamilies)
    }
}

// MARK: - Background Helper

extension View {
    @ViewBuilder
    func widgetContainerBackground() -> some View {
        if #available(iOS 17.0, *) {
            self.containerBackground(for: .widget) {
                Color(.systemFill)
            }
        } else {
            self.background(Color(.systemFill))
        }
    }
}

// MARK: - Preview

struct HomeWidget_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenWidgetView(entry: WorkEntry(date: .now, workRecord: 1.5, wage: 150000))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        #if os(iOS)
        AccessoryRectangularView(entry: WorkEntry(date: .now, workRecord: 1.5, wage: 150000))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
        #endif
    }
}
