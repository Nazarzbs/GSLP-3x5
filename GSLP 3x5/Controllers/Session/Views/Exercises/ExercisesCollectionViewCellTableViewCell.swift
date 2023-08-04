//
//  ExercisesCollectionViewCellTableViewCell.swift
//  GSLP 3x5
//
//  Created by Nazar on 01.08.2023.
//

import UIKit

final class ExercisesCollectionViewCellTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "ExercisesCollectionViewCellTableViewCell"

    private let prevLabel: UILabel = {
        let label = UILabel()
        label.text = "5x50kg"
        label.font = R.Fonts.helvelticaRegular(with: 22)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = R.Fonts.helvelticaRegular(with: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let repsNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.layer.cornerRadius = 10.0
        button.backgroundColor = R.Colors.backgroundSecondaryGray
        button.addTarget(self, action: #selector(didTapRepsNumberButton), for: .touchUpInside)
        return button
    }()
    
    private let picker: UIPickerView = {
        let picker = UIPickerView()
        picker.isHidden = true
        picker.alpha = 0
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let pickerViewContainer: UIView = {
        let pickerViewContainer = UIView()
        pickerViewContainer.clipsToBounds = true
        pickerViewContainer.backgroundColor = R.Colors.backgroundSecondaryGray
        pickerViewContainer.isHidden = true
        pickerViewContainer.alpha = 0
        pickerViewContainer.layer.cornerRadius = 10.0

        return  pickerViewContainer
    }()

    private let kgTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10.0
        textField.backgroundColor = R.Colors.backgroundSecondaryGray
        textField.textColor =  R.Colors.active
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.layer.cornerRadius = 10.0
        textField.backgroundColor = R.Colors.backgroundSecondaryGray
        textField.text = "20"
        return textField
    }()
    
    private let roundedBackgroundView:  ExercisesCollectionViewCellTableViewCell.RoundedBackgroundView = {
        let roundedBackgroundView = ExercisesCollectionViewCellTableViewCell.RoundedBackgroundView()
        roundedBackgroundView.backgroundColor = R.Colors.inActive.withAlphaComponent(0.5)

        return roundedBackgroundView
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        roundedBackgroundView.setupViews(numberLabel)
        backgroundColor = .white
        kgTextField.delegate = self
        picker.delegate = self
        picker.dataSource = self
        pickerViewContainer.addSubview(picker)
        contentView.setupViews(prevLabel, roundedBackgroundView, repsNumberButton,  pickerViewContainer, kgTextField)
        setupConstraints()
        self.accessoryType = UITableViewCell.AccessoryType.checkmark
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Public
    public func configure() {
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            prevLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            prevLabel.leadingAnchor.constraint(equalTo: roundedBackgroundView.trailingAnchor, constant: 8),
            
            roundedBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            roundedBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedBackgroundView.heightAnchor.constraint(equalToConstant: 30),
            roundedBackgroundView.widthAnchor.constraint(equalToConstant: 30),
            
            numberLabel.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor),
            numberLabel.centerXAnchor.constraint(equalTo: roundedBackgroundView.centerXAnchor),
           
            
            repsNumberButton.centerXAnchor.constraint(equalTo: pickerViewContainer.centerXAnchor),
            repsNumberButton.centerYAnchor.constraint(equalTo: pickerViewContainer.centerYAnchor),
            repsNumberButton.widthAnchor.constraint(equalToConstant: 80),
            repsNumberButton.heightAnchor.constraint(equalToConstant: 45),
            
            
            pickerViewContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
            pickerViewContainer.leadingAnchor.constraint(equalTo: prevLabel.trailingAnchor, constant: 20),
            pickerViewContainer.widthAnchor.constraint(equalToConstant:  80),
            pickerViewContainer.heightAnchor.constraint(equalToConstant: 55),
            
            picker.centerXAnchor.constraint(equalTo: pickerViewContainer.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: pickerViewContainer.centerYAnchor),
            
            kgTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            kgTextField.leadingAnchor.constraint(equalTo: repsNumberButton.trailingAnchor, constant: 20),
            kgTextField.widthAnchor.constraint(equalToConstant:  80),
            kgTextField.heightAnchor.constraint(equalToConstant: 45),
           
        ])
    }
    
    @objc
    func didTapRepsNumberButton() {
        UIView.animate(withDuration: 0.33, delay: 0) {
            self.pickerViewContainer.isHidden = false
            self.pickerViewContainer.alpha = 1
            self.picker.isHidden = false
            self.picker.alpha = 1
            self.repsNumberButton.alpha = 0
        }
    }
}

extension ExercisesCollectionViewCellTableViewCell {
    class CustomSelectionView: UIView {
        override var backgroundColor: UIColor? {
            didSet {
                // opaque to avoid unwanted transparency
                self.isOpaque = true
            }
        }
    }
    
    class RoundedBackgroundView: UIView {
        override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = bounds.height / 2 // Adjust this value to control the roundness
            layer.masksToBounds = true
        }
    }
}

extension ExercisesCollectionViewCellTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }
   
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        20
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        UIView.animate(withDuration: 0.3) {
            self.picker.isHidden = true
            self.picker.alpha = 0
        }
        
        UIView.animate(withDuration: 0.3) {
            self.pickerViewContainer.isHidden = true
            self.pickerViewContainer.alpha = 0
        }
        
        repsNumberButton.setTitle("\(row)", for: .normal)
        repsNumberButton.isHidden = false
        repsNumberButton.alpha = 1
            
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = UILabel()
            label.textColor = .black // Set the color for the component
            label.text = "\(row)"
            label.textAlignment = .center
            return label
        }
}

extension ExercisesCollectionViewCellTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Hide the keyboard
        return true
    }

}



