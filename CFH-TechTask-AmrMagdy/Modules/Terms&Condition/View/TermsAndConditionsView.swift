//
//  TermsAndConditionsView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI
import WebKit

struct TermsAndConditionsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            WebView(urlString: "https://generator.lorem-ipsum.info/terms-and-conditions")
                .navigationBarTitle("Terms and Conditions", displayMode: .inline)
    }
}

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsView()
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
