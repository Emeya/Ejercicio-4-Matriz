//
//  dataCell.swift
//  Ejercicio 4 Matriz
//
//  Created by Manuel Soberanis on 29/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class dataCell: UICollectionViewCell {
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let valueLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
//        lb.text = "Agrega valores a la matriz"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.numberOfLines = 1
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(valueLabel)
        valueLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
