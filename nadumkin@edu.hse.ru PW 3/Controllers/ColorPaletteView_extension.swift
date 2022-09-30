//
//  ColorPaletteView_extension.swift
//  nadumkin@edu.hse.ru PW 3
//
//  Created by Никита Думкин on 29.09.2022.
//

import UIKit

extension ColorPaletteView{
    final class ColorSliderView: UIControl {
        private let slider = UISlider()
        private let colorLabel = UILabel()
        private(set) var value: Float
        
        init(colorName: String, value: Float) {
            self.value = value
            super.init(frame: .zero)
            slider.value = value
            colorLabel.text = colorName
            colorLabel.textColor = .systemGray
            
            setupView()
            
            slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .touchDragInside)
            slider.addTarget(self, action: #selector(sliderTouched), for: .touchDown)
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            let stackView = UIStackView(arrangedSubviews: [colorLabel, slider])
            stackView.axis = .horizontal
            stackView.spacing = 8
            addSubview(stackView)
            stackView.pin(to: self, [.left: 12, .top: 12, .right: 12, .bottom: 12])
        }
                                    
        @objc
        private func sliderMoved(_ slider: UISlider) {
            self.value = slider.value
            sendActions(for: .touchDragInside)
        }
        
        @objc
        private func sliderTouched(){
            sendActions(for: .touchDown)
        }
    }
}
