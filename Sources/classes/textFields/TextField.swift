//
//  TextField.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

public enum TextFieldType {
    case line
    case bordered
}

@IBDesignable
public class TextField: UITextField {
    
    // MARK: - Private variables
    
    private var lineView = UIView()
    private var placeholderLabel = UILabel()
    
    // MARK: - Public variables
    
    /// To change x cursor point when editing by textLeftMargin
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textLeftMargin, dy: 0)
    }
    
    /// To change x cursor point by textLeftMargin
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: textLeftMargin, dy: 0)
    }
    
    /// Override UITextField's placeholder to apply on `placeholderLabel`
    public override var placeholder: String? {
        get { return placeholderLabel.text }
        set {
            placeholderLabel.text = newValue
            updatePlaceholderLabelBy(text: newValue)
        }
    }
    
    /// Verify if text field text is empty
    public var isEmpty: Bool {
        return (text ?? "").isEmpty
    }
    
    /// Placeholder color when is focused
    public var placeholderFocusedColor: UIColor = ThemeManager.shared.color.primary {
        didSet { updatePlaceholderColor() }
    }
    
    /// Placeholder color when is not focused
    public var placeholderColor: UIColor = ThemeManager.shared.color.gray3 {
        didSet { updatePlaceholderColor() }
    }
    
    /// TextField type
    public var type: TextFieldType = .line {
        didSet {
            guard type != oldValue else { return }
            prepareTextFieldByType()
        }
    }
    
    /// Text and Placeholder left margin
    public var textLeftMargin: CGFloat = 8
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    // MARK: - Public functions
    
    /// Function to prepare all TextField's attributes
    open func prepare() {
        preparePlaceholder()
        prepareTextFieldByType()
        prepareTextFieldTargets()
        
        self.borderStyle = .none
        self.tintColor = ThemeManager.shared.color.primary
    }
}

// MARK: - Events
extension TextField {
    
    /// Add targets to start editing and end editing
    private func prepareTextFieldTargets() {
        addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
    }
    
    /// Method called when text field start editing
    @objc private func textFieldEditingDidBegin() {
        placeholderEditingDidBeginAnimation()
        updateEditingColors()
    }
    
    /// Method called when text field end editing
    @objc private func textFieldEditingDidEnd() {
        placeholderEditingDidEndAnimation()
        updateEditingColors()
    }
    
    /// Method to update all accessories colors
    private func updateEditingColors() {
        updatePlaceholderColor()
        updateLineViewColor()
        updateBorderColor()
    }
}

// MARK: - Placeholder
extension TextField {
    
    /// Add placeholder on textField
    private func preparePlaceholder() {
        self.addSubview(placeholderLabel)
        
        placeholderLabel.backgroundColor = .clear
        updatePlaceholderColor()
    }
    
    /// Set placeholder color if is editing or not
    private func updatePlaceholderColor() {
        placeholderLabel.textColor = isEditing ? placeholderFocusedColor : placeholderColor
    }
    
    /// Set placeholder frame by text
    private func updatePlaceholderLabelBy(text: String?) {
        let size = ((text ?? "") as NSString).size(withAttributes: [.font : self.placeholderLabel.font])
        
        let y =  isEditing ? -(size.height/2) : ((self.bounds.size.height/2) - (size.height/2))
        placeholderLabel.frame = CGRect(x: self.textLeftMargin, y: y, width: size.width, height: size.height)
    }
    
    /// Create floating placeholder animation to begin editing
    private func placeholderEditingDidBeginAnimation() {
        guard isEmpty else {
            return
        }
        
        UIView.animate(withDuration: 0.15) {[weak self] in
            guard let self = self else { return }
            
            self.placeholderLabel.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
            
            self.placeholderLabel.frame.origin.x = self.textLeftMargin
            self.placeholderLabel.frame.origin.y = -((self.placeholderLabel.bounds.height/2) * 0.75)
        }
    }
    
    /// Create floating placeholder animation to end editing
    private func placeholderEditingDidEndAnimation() {
        guard isEmpty else {
            return
        }
        
        UIView.animate(withDuration: 0.15) {[weak self] in
            guard let self = self else { return }
            self.placeholderLabel.transform = .identity
            
            self.placeholderLabel.frame.origin.x = self.textLeftMargin
            self.placeholderLabel.frame.origin.y = (self.bounds.size.height/2) - (self.placeholderLabel.bounds.size.height/2)
        }
    }
}

// MARK: - TextField Type
extension TextField {
    
    /// Configure textField by type
    private func prepareTextFieldByType() {
        switch type {
        case .line:
            self.layer.borderWidth = 0
            prepareLineView()
            
        case .bordered:
            self.lineView.removeFromSuperview()
            prepareBorder()
        }
    }
    
    /// Create border if needed
    private func prepareBorder() {
        self.layer.borderWidth = 1
        updateBorderColor()
    }
    
    /// Update border color by textField state
    private func updateBorderColor() {
        self.layer.borderColor = isEditing ? placeholderFocusedColor.cgColor : placeholderColor.cgColor
    }
    
    /// Create line view if textField type is `.line`
    private func prepareLineView() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(lineView)
        
        let constraints = [
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        NSLayoutConstraint.activate(constraints)
        updateLineViewColor()
    }
    
    /// Update line view color by textField state
    private func updateLineViewColor() {
        lineView.backgroundColor = isEditing ? placeholderFocusedColor : placeholderColor
    }
}
