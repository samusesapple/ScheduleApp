//
//  OneDayViewController.swift
//  CalmedScheduleApp
//
//  Created by Sam Sung on 2023/03/10.
//

import UIKit

final class OneDayViewController: UIViewController, UITableViewDelegate {
    
    private let colorHelper = ColorHelper()
    lazy var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorHelper.backgroundColor
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("뷰 나타날 것")
        setupTableView()
        setupNaviBar()
    }
    
    
    // MARK: - set NaviBar
    func setupNaviBar() {
        title = "Today"
        
        // 네비게이션바 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = colorHelper.backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: colorHelper.fontColor]
        //appearance.largeTitleTextAttributes = [.foregroundColor: helper.fontColor]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // Bar 버튼 추가
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    // MARK: - set TableView()
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = colorHelper.backgroundColor
        tableView.rowHeight = 120
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 5
        setupTableViewConstraints()
        // 셀의 등록과정
        tableView.register(TodayTableViewCell.self, forCellReuseIdentifier: "TodoCell")
        
        
    }
    
    // MARK: - TableView Autolayout
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func addTapped() {
        print("add button tapped")
    }
    
    
    
    
    
    
}


extension OneDayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드 (애플이 미리 잘 만들어 놓음)
        // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodayTableViewCell
    
    
    //        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
    //        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
    //        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
    //        cell.selectionStyle = .none
        
        return cell
    }
    

    
}

extension ViewController: UITableViewDelegate {
    
    
    // 셀이 선택이 되었을때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = DetailViewController()
//        detailVC.movieData = moviesArray[indexPath.row]
        //show(detailVC, sender: nil)
        print("셀이 선택됨")
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
