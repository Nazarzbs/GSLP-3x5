//
//  ExerciseCollectionViewCell.swift
//  GSLP 3x5
//
//  Created by Nazar on 31.07.2023.
//

import UIKit

final class ExerciseCollectionViewCell: UICollectionViewCell {
   
    static let identifier: String = "ExerciseCollectionViewCell"
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ExercisesCollectionViewCellTableViewCell.self, forCellReuseIdentifier: ExercisesCollectionViewCellTableViewCell.cellIdentifier)
        tableView.clipsToBounds = true
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = R.Colors.background
        contentView.setupViews(tableView)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        ])
    }
    
    public func configure() {
       
    }
}

extension ExerciseCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesCollectionViewCellTableViewCell.cellIdentifier, for: indexPath) as? ExercisesCollectionViewCellTableViewCell else { fatalError() }
        cell.configure()
        let customSelectionView = ExercisesCollectionViewCellTableViewCell.CustomSelectionView()
        customSelectionView.backgroundColor = R.Colors.inActive.withAlphaComponent(0.2)
            cell.selectedBackgroundView = customSelectionView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
}
    

