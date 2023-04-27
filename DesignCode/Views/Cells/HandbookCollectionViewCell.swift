//
//  HandbookCollectionViewCell.swift
//  DesignCode
//
//  Created by Mohamed Atallah on 08/04/2023.
//

import UIKit


class HandbookCollectionViewCell: UICollectionViewCell {
    @IBOutlet var overlay: UIView!
    @IBOutlet var bannerImage: UIImageView!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    
    let gradient = CAGradientLayer()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = overlay.frame
        gradient.cornerCurve = .continuous
        gradient.cornerRadius = 30
        
        overlay.layer.insertSublayer(gradient, at: 0)
        overlay.layer.cornerCurve = .continuous
        overlay.layer.cornerRadius = 30
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
