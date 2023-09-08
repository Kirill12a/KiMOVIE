//
//  MainViewController.swift
//  KiMOVIE
//
//  Created by Kirill Drozdov on 05.09.2023.
//

import UIKit
import Lottie


protocol iMainDisplayLogic: iBaseViewDisplayLogic, AnyObject {

	func loadCategoriesAndMovies(viewModel: MainViewModel)

	func showEmptyStateView(emptyStateViewModel: MainViewModel)

}

class MainViewController: BaseViewController {

	// MARK: VIP

	var interactor: iMainBusinessLogic?
	var router: iMainRoutingLogic?

	// MARK: Variables

	private var movieCategories: [iDrawerItem] = []
	private let refreshControl = UIRefreshControl()
	var categoryOfItemTapped: MainCategory?
	var indexOfItemTapped: IndexPath?

	// MARK: Views

	let tableView: UITableView = {
		let table = UITableView()
		table.separatorStyle = .none
		table.estimatedRowHeight = 200
		table.rowHeight = UITableView.automaticDimension
		table.allowsSelection = false
		table.backgroundColor = Constants.Styles.backGroundColor
		return table
	}()

	// MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViews()
		setupTableView()
		getMoviesList()

	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}


	private func setupViews() {
		self.view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.edges.equalTo(self.view.safeAreaLayoutGuide)
		}
	}

	private func setupTableView() {
		tableView.delegate = self
		tableView.dataSource = self
		refreshControl.attributedTitle = NSAttributedString(string: Constants.TableViewRefreshControl.description)
		refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
		tableView.addSubview(refreshControl)
	}

	@objc
	func refresh(_ sender: AnyObject) {
		getMoviesList()
	}

	private func getMoviesList(){
		showSpinner()
		interactor?.fetchMovies()
	}

	/// закрыть протоколом viewModel
	private func loadNewInfoInTable(viewModel: MainViewModel) {
		refreshControl.endRefreshing()
		self.movieCategories = viewModel.movieCategories
		tableView.reloadData()
	}
}

//MARK: -Display logic implementation

extension MainViewController: iMainDisplayLogic {
	func showEmptyStateView(emptyStateViewModel: MainViewModel) {
		hideSpinner()
		loadNewInfoInTable(viewModel: emptyStateViewModel)
	}

	func loadCategoriesAndMovies(viewModel: MainViewModel) {
		hideSpinner()
		loadNewInfoInTable(viewModel: viewModel)
	}
}

//MARK: -TableView management (сделать при помощи tableViewDataProvider)

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.movieCategories.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellModel = self.movieCategories[indexPath.row]
		let drawer = cellModel.cellDrawer
		let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
		drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if self.movieCategories[indexPath.row] is EmptyStateCellModel {
			return tableView.frame.height
		} else {
			return UITableView.automaticDimension
		}
	}
}

//MARK: -MovieCategoryTap protocol implementation
extension MainViewController: iMoviewCategoryTap {
	func userDidSelectedElement(indexSelected: IndexPath, additionalInfo: Any?) {
		if let homeCategorySelected = additionalInfo as? MainCategory {
			self.categoryOfItemTapped = homeCategorySelected
			self.indexOfItemTapped = indexSelected
			router?.routeToMovieDetail()
		}
	}
}
