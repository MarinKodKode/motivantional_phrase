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
        let targetSize = CGSize(width: 365, height: 250)
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        let format = UIGraphicsImageRendererFormat()
        format.scale = 3
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image {context in
            let rect = CGRect(origin: .zero, size: targetSize)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
            path.addClip()
            view?.drawHierarchy(in: rect, afterScreenUpdates: true)
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


