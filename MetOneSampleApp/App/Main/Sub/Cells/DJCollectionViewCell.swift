//
//  DJCollectionViewCell.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/29/23.
//

import UIKit
import SnapKit
import Foundation

class DJCollectionViewCell: UICollectionViewCell {
    
    weak var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.contentView.backgroundColor = .lightGray
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.black.cgColor
        
        let label = UILabel()
        label.textAlignment = .center
        label.frame = self.contentView.frame
        
        self.contentView.addSubview(label)
        
        self.label = label
    }
    
    func configure(text: String) {
        self.label?.text = text
    }
    
}
