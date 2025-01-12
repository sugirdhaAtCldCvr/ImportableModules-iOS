//
//  ProgressBarView.swift
//  ProgressBarImplementation
//
//  Created by Sugirdha Vaithyanathan on 1/10/23.
//

import UIKit

class ProgressBarView: UIView {

    var progress: Float = 0.0
    let progressView = UIView()
    var trailingConstraint: NSLayoutConstraint?
        
    init(frame: CGRect = .zero, progress: Float) {
        super.init(frame: frame)
        self.progress = progress
        showProgress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showProgress() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .systemGray6
        
        progressView.backgroundColor = .systemGray3
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(progressView)
        
        layoutProgress()
    }
    
    func layoutProgress() {
        progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        progressView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        progressView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        trailingConstraint = progressView.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.size.width * CGFloat(progress))
        trailingConstraint?.isActive = true
    }
    
}

// MARK: - Adding UIView extension
extension UIView {
    func displayProgressBar(progress: Float) {
        let progressBar = ProgressBarView(frame: self.frame, progress: progress)
        self.addSubview(progressBar)
        progressBar.topAnchor.constraint(equalTo: bottomAnchor, constant: 10).isActive = true
        progressBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 6).isActive = true
    }
}
