//
//  ShareHelper.swift
//  FrasesMotivacionales
//
//  Created by Erika Garcia Gaonaon 08/04/26.
//

// ImageShareUtils.swift

import UIKit
import SwiftUI



extension View {
    func takeScreenshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = CGSize(width: 350, height: 250)

        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            view?.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
        }
    }
}


func shareImage(_ image: UIImage) {
    let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    
    if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let root = scene.windows.first?.rootViewController {
        root.present(vc, animated: true)
    }
}


