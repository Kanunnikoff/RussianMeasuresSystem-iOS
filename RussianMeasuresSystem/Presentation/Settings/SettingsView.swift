//
//  SettingsView.swift
//  Glagolitsa
//
//  Created by Дмитрiй Канунниковъ on 12.07.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("SettingsView.isSystemFontAndSize")
    private var isSystemFontAndSize: Bool = true
    
    var body: some View {
        List {
            Section {
                Toggle("Системный шрифт и размер", isOn: $isSystemFontAndSize)
                    .font(isSystemFontAndSize ? .body : Config.customBodyFont)
            } header: {
                Text("Основные")
                    .font(isSystemFontAndSize ? .footnote : Config.customSectionTitleFont)
            } footer: {
                Text("Возможность отображения текста в старинном начертании.")
                    .font(isSystemFontAndSize ? .footnote : Config.customSectionFooterFont)
            }
        }
#if os(iOS)
        .listStyle(.insetGrouped)
#else
        .listStyle(.inset)
#endif
        .navigationTitle("Настройки")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}