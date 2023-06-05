//
//  LottieAnimations.swift
//  help reader
//
//  Created by Jonatas Brisotti on 05/06/23.
//

import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
        
        animationView.animation = LottieAnimation.named("applauso")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)

                                    ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //
    }
}
