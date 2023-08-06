//
//  ExercisesView.swift
//  GSLP 3x5
//
//  Created by Nazar on 31.07.2023.
//

import UIKit

final class ExercisesView: GSBaseView {

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.layer.cornerRadius = 5
        pageControl.backgroundColor = R.Colors.separator.withAlphaComponent(1)
        return pageControl
    }()
    
    private let collectionView: UICollectionView = {
      
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            // Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            // Define header
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
            let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    
             // Section
             let section = NSCollectionLayoutSection(group: group)
             section.orthogonalScrollingBehavior = .groupPaging
             section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
           
            section.boundarySupplementaryItems = [headerSupplementary]
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.cornerRadius = 8
        collectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewCell.identifier)
        collectionView.isScrollEnabled = false
        collectionView.register(ExercisesHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExercisesHeaderCollectionReusableView.identifier)
    
        return collectionView
    }()
}

extension ExercisesView {
    override func setupViews() {
        super.setupViews()
        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
        collectionView.delegate = self
        collectionView.dataSource = self
       
        collectionView.backgroundColor = R.Colors.background
        setupViews(collectionView, pageControl)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 10),
          
        ])
    }
    
    @objc
    func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        collectionView.scrollToItem(at: [0, current], at: .centeredHorizontally, animated: true)
    }
}

extension ExercisesView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else {
            fatalError()
        }
        cell.cellIndex = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ExercisesHeaderCollectionReusableView.identifier, for: indexPath) as? ExercisesHeaderCollectionReusableView else { fatalError("Unsupported") }
        
        return header
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
    }
}


