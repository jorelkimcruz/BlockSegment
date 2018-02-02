//
//  ViewController.swift
//  BlockSegment
//
//  Created by Salarium on 02/02/2018.
//

import UIKit

protocol BlockSegmentDelegate {
    func BlockSegmentSelected(index:Int)
}

class BlockSegment: UIView{

   internal var collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
   internal let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    internal let cell = "cell"
    
    var delegate : BlockSegmentDelegate!
    
    open class func Items(text: [String], icon: [UIImage]) -> (text: [String], icon: [UIImage]) {
        return (text:text, icon: icon)
    }
    
    open var ItemsWithImage: (text: [String], icon: [UIImage]) = ([], []) {
        didSet {
            guard ItemsWithImage.text.count == ItemsWithImage.icon.count else {
                assertionFailure("Items must be the same count")
                return
            }
            self.setup()
        }
    }
    
    var selectedIndex : Int = 0 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    var blockHeight : CGFloat = 90 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    var blockColor : UIColor = .white {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var textColor : UIColor = .white {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var IconColor : UIColor = .white {
        didSet {
            collectionView.reloadData()
        }
    }
    
    internal let height : CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        views()
        
    }
    
    private func setup(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        self.layoutIfNeeded()
       
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        views()
    }
    
    func views()  {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
        
        self.addConstraints([NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
                                       NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
                                       NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
                                       NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)])
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView.register(BlockCollectionViewCell.self, forCellWithReuseIdentifier: cell)
        collectionView.backgroundColor = .clear
        collectionView.setCollectionViewLayout(layout, animated: true)

        self.layoutIfNeeded()
    }

}

extension BlockSegment : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemsWithImage.text.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! BlockCollectionViewCell
        
        cell.backgroundColor = selectedIndex == indexPath.row ? blockColor : .lightGray
        cell.Icon.tintColor = IconColor
        cell.Icon.image = ItemsWithImage.icon[indexPath.row].withRenderingMode(.alwaysTemplate)
        cell.title.text = ItemsWithImage.text[indexPath.row]
        cell.title.textColor = textColor
        
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        collectionView.reloadData()
        guard let del = self.delegate else {
            return
        }
        
        del.BlockSegmentSelected(index: indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsize = CGSize(width: (self.frame.size.width/3) - 15, height: blockHeight)
        return cellsize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    

}
