//
//  ViewController.swift
//  Ejercicio 4 Matriz
//
//  Created by Manuel Soberanis on 29/04/20.
//  Copyright © 2020 Manuel Soberanis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sideContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    
    let collectionViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Ejercicio 4"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.numberOfLines = 1
        return lb
    }()
    
    let matrixInstLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Genera la matriz (NxN)"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.numberOfLines = 1
        return lb
    }()
    
    let addToMatrixLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Agrega valores a la matriz"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.numberOfLines = 1
        return lb
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.titleLabel!.text = "Login"
//        let customFont = UIFont(name: Theme.current.fontSemiBold, size: 21)
//        button.titleLabel?.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customFont!)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Generar Matriz", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
//        button.setTitleColor(Theme.current.tint, for: .normal)
//        button.backgroundColor = Theme.current.tinTabNav
        button.addTarget(self, action: #selector(createMatrix), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let matrizXTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
//        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
//        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        tf.placeholder = "X"
        //        tf.text = "Asasasdasd"
        
//        tf.tintColor = Theme.current.tint
        tf.textAlignment = .center
        tf.keyboardAppearance = .dark
        tf.keyboardType = .numberPad
        tf.textColor = .white
        tf.backgroundColor = UIColor.black
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let matrizYTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        //        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        //        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        tf.placeholder = "Y"
        //        tf.text = "Asasasdasd"
        //        tf.textColor = Theme.current.textColor
        //        tf.tintColor = Theme.current.tint
        tf.textAlignment = .center
        tf.keyboardAppearance = .dark
        tf.keyboardType = .numberPad
        tf.textColor = .white
        tf.backgroundColor = UIColor.black
        //        tf.backgroundColor = Theme.current.viewColor
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let addValueToMatrixTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        //        let customFont = UIFont(name: Theme.current.fontNormal, size: 20)
        //        tf.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: customFont!)
        //        tf.font = UIFont.preferredFont(forTextStyle: .title3)
        tf.adjustsFontForContentSizeCategory = true
        tf.placeholder = "Add Value"
        //        tf.text = "Asasasdasd"
        //        tf.textColor = Theme.current.textColor
        //        tf.tintColor = Theme.current.tint
        tf.textAlignment = .center
        tf.keyboardAppearance = .dark
        tf.keyboardType = .default
        tf.textColor = .white
        tf.backgroundColor = UIColor.black
        //        tf.backgroundColor = Theme.current.viewColor
        tf.layer.cornerRadius = 10
        tf.layer.masksToBounds = true
        return tf
    }()
    
    lazy var addValueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.titleLabel!.text = "Login"
        //        let customFont = UIFont(name: Theme.current.fontSemiBold, size: 21)
        //        button.titleLabel?.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customFont!)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Add", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        //        button.setTitleColor(Theme.current.tint, for: .normal)
        //        button.backgroundColor = Theme.current.tinTabNav
        button.addTarget(self, action: #selector(tapAddValueToMatrix), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.titleLabel!.text = "Login"
        //        let customFont = UIFont(name: Theme.current.fontSemiBold, size: 21)
        //        button.titleLabel?.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: customFont!)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor.black
        button.setTitleColor(.white, for: .normal)
        //        button.backgroundColor = Theme.current.tinTabNav
        button.addTarget(self, action: #selector(clearArray), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var collectionView : UICollectionView!
    
    var arrayData : [String] = []
    var alphabetArray : [String] = []
    var opcion2 : [String] = []
    var opcion3 : [String] = []
    var opcion4 : [String] = []
    var opcion5 : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewLoad()
    }
    
    func setupViewLoad(){
        view.backgroundColor = .clear
        hideKeyboardWhenTappedAround()
        setupContainers()
        setupArrays()
    }
    
    func setupArrays(){
        //Just for making testing easy lol
        alphabetArray = ["a", "e","i", "o","u", "a","1", "1", "1", "a", "u", "1", "1", "1", "e", "o", "1", "1", "1", "i", "i", "e", "a", "u", "o"]
        
        opcion2 = ["a", "b","c", "d","e", "f","g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x"]
        
        opcion3 = ["1", "2","3", "4","5", "2","4", "6", "8", "10", "3", "6", "9", "12", "15", "4", "8", "12", "14", "20", "5", "10", "15", "20", "25"]
        
        opcion4 = ["1", "x","x", "x","x", "x","2", "x", "x", "x", "x", "x", "3", "x", "x", "x", "x", "x", "4", "x", "x", "x", "x", "x", "5"]
        
        opcion5 = ["5", "1","5", "1","5", "4","2", "4", "2", "4", "3", "3", "3", "3", "3", "2", "4", "2", "4", "2", "1", "5", "1", "5", "1"]
    }
    
    func setupContainers(){
        view.addSubview(sideContainer)
        sideContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sideContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        sideContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        sideContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        view.addSubview(collectionViewContainer)
        collectionViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionViewContainer.leadingAnchor.constraint(equalTo: sideContainer.trailingAnchor).isActive = true
        collectionViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        sideContainerElements()
        setupCollectionView()
    }
    
    func sideContainerElements(){
        //All elements
        sideContainer.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: sideContainer.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor).isActive = true
        
        sideContainer.addSubview(matrixInstLabel)
        matrixInstLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        matrixInstLabel.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor, constant: 5).isActive = true
        matrixInstLabel.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor).isActive = true
        
        sideContainer.addSubview(matrizXTF)
        matrizXTF.topAnchor.constraint(equalTo: matrixInstLabel.bottomAnchor, constant: 5).isActive = true
        matrizXTF.widthAnchor.constraint(equalTo: sideContainer.widthAnchor, multiplier: 0.5, constant: -20).isActive = true
        matrizXTF.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor, constant: 10).isActive = true
        matrizXTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        sideContainer.addSubview(matrizYTF)
        matrizYTF.topAnchor.constraint(equalTo: matrixInstLabel.bottomAnchor, constant: 5).isActive = true
        matrizYTF.widthAnchor.constraint(equalTo: sideContainer.widthAnchor, multiplier: 0.5, constant: -20).isActive = true
        matrizYTF.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor, constant: -10).isActive = true
        matrizYTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        sideContainer.addSubview(submitButton)
        submitButton.topAnchor.constraint(equalTo: matrizXTF.bottomAnchor, constant: 5).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: sideContainer.centerXAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalTo: sideContainer.widthAnchor, multiplier: 0.5).isActive = true
        
        sideContainer.addSubview(addToMatrixLabel)
        addToMatrixLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 10).isActive = true
        addToMatrixLabel.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor, constant: 5).isActive = true
        addToMatrixLabel.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor).isActive = true
        
        sideContainer.addSubview(addValueToMatrixTF)
        addValueToMatrixTF.topAnchor.constraint(equalTo: addToMatrixLabel.bottomAnchor, constant: 5).isActive = true
        addValueToMatrixTF.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor, constant: 5).isActive = true
        addValueToMatrixTF.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor, constant: -5).isActive = true
        addValueToMatrixTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        sideContainer.addSubview(addValueButton)
        addValueButton.topAnchor.constraint(equalTo: addValueToMatrixTF.bottomAnchor, constant: 5).isActive = true
        addValueButton.widthAnchor.constraint(equalTo: sideContainer.widthAnchor, multiplier: 0.5, constant: -10).isActive = true
        addValueButton.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor, constant: 5).isActive = true
        
        sideContainer.addSubview(clearButton)
        clearButton.topAnchor.constraint(equalTo: addValueToMatrixTF.bottomAnchor, constant: 5).isActive = true
        clearButton.widthAnchor.constraint(equalTo: sideContainer.widthAnchor, multiplier: 0.5, constant: -10).isActive = true
        clearButton.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor, constant: -5).isActive = true
        
    }
    
    func setupCollectionView(){
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionViewContainer.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: collectionViewContainer.bottomAnchor).isActive = true
        
        collectionView.register(dataCell.self, forCellWithReuseIdentifier: "cell")
    }

    var xValue : CGFloat = 0.0
    var arrayLimit : Int?
    @objc func createMatrix(){
        guard let valueA = Int(matrizXTF.text!) else {return}
        guard let valueB = Int(matrizYTF.text!) else {return}
        
        xValue = CGFloat(valueA)
        arrayLimit = valueA * valueB
    }
    
    @objc func clearArray(){
        arrayData.removeAll()
        
        collectionView.reloadData()
    }
    
    
    @objc func tapAddValueToMatrix(){
        if xValue != 0.0 {
            guard let value = addValueToMatrixTF.text else {return}
            guard let arrayLimitCheck = arrayLimit else { return }
            
            if value == "Op1"{
                
                for value in alphabetArray {
                    arrayData.append(value)
                }
                collectionView.reloadData()
                    
            }
            if value == "Op2"{
                
                for value in opcion2 {
                    arrayData.append(value)
                }
                collectionView.reloadData()
                    
            }
            if value == "Op3"{
                
                for value in opcion3 {
                    arrayData.append(value)
                }
                collectionView.reloadData()
            
            }
            if value == "Op4"{
                
                for value in opcion4 {
                    arrayData.append(value)
                }
                collectionView.reloadData()
                
            }
            if value == "Op5"{
                
                for value in opcion5 {
                    arrayData.append(value)
                }
                collectionView.reloadData()
                
            }
            else {
                if arrayData.count < arrayLimitCheck {
                    arrayData.append(value)
                    collectionView.reloadData()
                } else {
                    print("Array limit reached")
                }
            }
        }
    }
    

}// end class

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! dataCell
        cell.valueLabel.text = arrayData[indexPath.row].self
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: (collectionView.frame.width / xValue ) - 10, height: collectionView.frame.width / xValue )
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: view.frame.width, height: view.frame.height)
    //    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //         return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

