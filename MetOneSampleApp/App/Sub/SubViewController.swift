//
//  SubViewController.swift
//  MetOneSampleApp
//
//  Created by Do Kiyong on 11/24/23.
//

import UIKit
import SnapKit

class SubViewController: UIViewController {
    
    enum Section: CaseIterable {
        case main
    }
    
    var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        return searchController
    }()
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        
        return isActive && isSearchBarHasText
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    private var viewModel = SubViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello Sub view controller")
        
        self.view.backgroundColor = .white
        
        setViews()
    
        self.setupDataSource()
        self.performQuery(with: nil)
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setViews() {
        self.setViewStyle()
        self.createSearchController()
        
        view.addSubview(collectionView)
        
        self.collectionView.snp.makeConstraints({
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
        })
    }
    
    func setViewStyle() {
        self.collectionView.collectionViewLayout = self.createCollectionViewLayout()
    }
    
    func createSearchController() {
        self.navigationItem.searchController = self.searchController
        self.navigationItem.searchController?.searchResultsUpdater = self
        self.navigationItem.title = "Search DJ"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            let contentSize = layoutEnvironment.container.effectiveContentSize
            let columns = contentSize.width > 800 ? 3 : 2
            let spacing = CGFloat(10)
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .absolute(32))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: columns)
            group.interItemSpacing = .fixed(spacing)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = spacing
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

            return section
        }
        
        return layout
    }
    
    func setupDataSource() {
        // MARK: - Way 1
        self.collectionView.register(DJCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.dataSource =
            UICollectionViewDiffableDataSource<Section, String>(collectionView: self.collectionView) { (collectionView, indexPath, dj) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DJCollectionViewCell else { preconditionFailure() }
            cell.configure(text: dj)
                
            return cell
        }
        
        // MARK: - Way 2
        /*
        let cellRegistration = UICollectionView.CellRegistration
        <DJCollectionViewCell, String> { (cell, indexPath, dj) in
            cell.configure(text: dj)
        }
        
        self.dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: self.collectionView) {
            (collectionView, indexPath, dj) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: dj)
        }
        */
    }

    func performQuery(with filter: String?) {
        let filtered = viewModel.dj.filter { $0.hasPrefix(filter ?? "") }

        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(filtered)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension SubViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        print("text:", text ?? "")
        self.performQuery(with: text)
    }
    
}

