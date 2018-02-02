//
//  BlockCollectionViewCell.swift
//  BlockSegment
//
//  Created by Jorel Cruz on 02/02/2018.
//

import Foundation
import UIKit


class BlockCollectionViewCell: UICollectionViewCell {
    
    let Icon: UIImageView = {
        let imgv = UIImageView()
        imgv.contentMode = .center
        return imgv
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
   
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = UILayoutConstraintAxis.vertical
        sv.alignment = UIStackViewAlignment.center
        sv.spacing = 5.0
        sv.distribution = UIStackViewDistribution.equalCentering
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
    
    
    
    func addViews()  {
        stackView.backgroundColor = .red
        self.addSubview(stackView)
        self.addConstraints([NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 15),
                                  NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -15),
                                  NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 15),
                                  NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -15)])
        
        stackView.addArrangedSubview(Icon)
        stackView.addArrangedSubview(title)
        
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0,height: 0)
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.cornerRadius = 6
    }
    

    
}


