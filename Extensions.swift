import UIKit

extension UIView {
    
    /// Anchor the view to its superview or to the given anchors with the specified padding and size constraints.
    /// - Parameters:
    ///   - top: The top anchor to constrain the top of the view. If nil, the view will not be anchored to the top.
    ///   - left: The left anchor to constrain the left of the view. If nil, the view will not be anchored to the left.
    ///   - bottom: The bottom anchor to constrain the bottom of the view. If nil, the view will not be anchored to the bottom.
    ///   - right: The right anchor to constrain the right of the view. If nil, the view will not be anchored to the right.
    ///   - paddingTop: The padding to add to the top constraint. Default is 0.
    ///   - paddingLeft: The padding to add to the left constraint. Default is 0.
    ///   - paddingBottom: The padding to add to the bottom constraint. Default is 0.
    ///   - paddingRight: The padding to add to the right constraint. Default is 0.
    ///   - width: The width of the view. If nil, the view will not have a width constraint.
    ///   - height: The height of the view. If nil, the view will not have a height constraint.
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Center the view horizontally and vertically within the given view with an optional vertical offset.
    /// - Parameters:
    ///   - view: The view to center this view in.
    ///   - yConstant: The vertical offset from the center of the given view. Default is 0.
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    /// Center the view horizontally within the given view with an optional top anchor and padding.
    /// - Parameters:
    ///   - view: The view to center this view in.
    ///   - topAnchor: The top anchor to constrain the top of the view. If nil, the view will not be anchored to the top.
    ///   - paddingTop: The padding to add to the top constraint. Default is 0.
    func centerX(inView view: UIView, topAnchor:
                 NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    /// Center the view vertically within the given view with an optional left anchor, padding, and offset.
    /// - Parameters:
    ///   - view: The view to center this view in.
    ///   - leftAnchor: The left anchor to constrain the left of the view. If nil, the view will not be anchored to the left.
    ///   - paddingLeft: The padding to add to the left constraint. Default is 0.
    ///   - constant: The vertical offset from the center of the given view. Default is 0.
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    /// Set the height and width constraints of the view to the specified values.
    /// - Parameters:
    ///   - height: The height of the view.
    ///   - width: The width of the view.
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    /// Set the height constraint of the view to the specified value.
    /// - Parameter height: The height of the view.
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    /// Set the width constraint of the view to the specified value.
    /// - Parameter width: The width of the view.
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    /// Anchor the view to fill its superview.
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
