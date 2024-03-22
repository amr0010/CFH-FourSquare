//
//  LocationAccessDeniedView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI

struct LocationAccessDeniedView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Location Access Required")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text("To use this app, please enable location services in Settings.")
                .multilineTextAlignment(.center)
                .padding()

            Button(action: openSettings) {
                Text("Open Settings")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
    }

    private func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url) else {
            return
        }

        UIApplication.shared.open(url)
    }
}

struct LocationAccessDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationAccessDeniedView()
    }
}
