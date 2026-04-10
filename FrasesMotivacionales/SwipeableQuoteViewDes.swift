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
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging = false
    @ObservedObject  var vm : PhraseViewViewModel
    private let swipeThreshold: CGFloat = 120
    
    var body: some View {
        
        VStack {
            ZStack {
                let nextIndex = (currentIndex + 1) % vm.phrases.count
                if vm.phrases.count > 1 {
                    QuoteCardView(card: vm.phrases[nextIndex])
                        .scaleEffect(backCardScale)
                        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: dragOffset)
                }
                
                if let current = vm.phrases.first {
                    QuoteCardView(card:  vm.phrases[currentIndex])
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
            
            HStack {
                Button(action: {
//                    let image = takeScreenshot()
//                    
//                    shareImage(image)
                }) {
                    Image(systemName: "square.and.arrow.up.fill")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                }
                .background(Color.gray.opacity(0.6))
                .clipShape(Circle())
                
                Button(action : {
                    vm.onTapButton_AddPhraseToFavourites(vm.phrases[currentIndex])
                }) {
                    Image(systemName: "heart.fill")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding()
                }
                .background(Color.gray.opacity(0.6))
                .clipShape(Circle())
            }
            .padding(.top, 24)
        }
        .onAppear {
            vm.initPhrasesView()
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
            currentIndex = (currentIndex + 1) % vm.phrases.count
            dragOffset = .zero
        }
    }
}


//#Preview {
//    SwipeableQuoteViewDes()
//}
