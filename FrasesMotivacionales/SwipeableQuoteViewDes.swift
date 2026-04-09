//
//  TestView.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 08/04/26.
//

import Foundation
import SwiftUI


struct SwipeableQuoteViewDes: View {
    
    @State private var currentIndex: Int = 0
    
    @State private var cards: [QuoteCard] = [
        QuoteCard(date: "Viernes, 09", quote: "Lo imposible solo cuesta un poco más", author: "Autor desconocido", backgroundHex: "#1B1B2F"),
        QuoteCard(date: "Viernes, 09", quote: "El éxito es la suma de pequeños esfuerzos repetidos día tras día", author: "Robert Collier", backgroundHex: "#1C3A4A"),
        QuoteCard(date: "Viernes, 09", quote: "No cuentes los días, haz que los días cuenten", author: "Muhammad Ali", backgroundHex: "#2C2C54"),
        QuoteCard(date: "Viernes, 09", quote: "La disciplina es el puente entre metas y logros", author: "Jim Rohn", backgroundHex: "#1B4332"),
        QuoteCard(date: "Viernes, 09", quote: "Cae siete veces, levántate ocho", author: "Proverbio japonés", backgroundHex: "#2D132C"),
    ]
    
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging = false
    
    private let swipeThreshold: CGFloat = 120
    
    var body: some View {
        ZStack {
            // Tarjeta de atrás
            let nextIndex = (currentIndex + 1) % cards.count
            if cards.count > 1 {
                QuoteCardView(card: cards[nextIndex])
                    .scaleEffect(backCardScale)
                    .animation(.spring(response: 0.4, dampingFraction: 0.7), value: dragOffset)
            }
            
            // Tarjeta principal
            if let current = cards.first {
                QuoteCardView(card:  cards[currentIndex])
                    .id(currentIndex)
                    .offset(x: dragOffset.width)
                    .rotationEffect(.degrees(tiltAngle), anchor: .bottom)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                dragOffset = CGSize(width: value.translation.width, height: 0)
                                isDragging = true
                            }
                            .onEnded { value in
                                let swipedRight = dragOffset.width > swipeThreshold
                                let swipedLeft  = dragOffset.width < -swipeThreshold
                                
                                if swipedRight || swipedLeft {
                                    swipeCard(toRight: swipedRight)
                                } else {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                                        dragOffset = .zero
                                    }
                                }
                                isDragging = false
                            }
                    )
                    .animation(isDragging ? nil : .spring(response: 0.4, dampingFraction: 0.7), value: dragOffset)
            }
        }
    }
    
    // MARK: - Computed
    
    private var tiltAngle: Double {
        Double(dragOffset.width / 20)
    }
    
    private var backCardScale: CGFloat {
        let progress = min(abs(dragOffset.width) / swipeThreshold, 1.0)
        return 0.92 + (0.08 * progress)
    }
    
    // MARK: - Actions
    
    private func swipeCard(toRight: Bool) {
        let direction: CGFloat = toRight ? 600 : -600
        
        withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
            dragOffset = CGSize(width: direction, height: 0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            currentIndex = (currentIndex + 1) % cards.count
            dragOffset = .zero
        }
    }
}


#Preview {
    SwipeableQuoteViewDes()
}
