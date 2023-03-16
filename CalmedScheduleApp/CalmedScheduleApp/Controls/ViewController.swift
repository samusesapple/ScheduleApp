//
//  ViewController.swift
//  CalmedScheduleApp
//
//  Created by Sam Sung on 2023/03/09.
//

import UIKit

final class ViewController: UIViewController, UITabBarDelegate {
    let colorHelper = ColorHelper()
    var mainView = MainView()
    // 모델(저장 데이터를 관리하는 코어데이터)
    let toDoManager = CoreDataManager.shared
    
    var shortDateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd (EEE)"
        let date = Date()
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
    
    override func loadView() {
        view = mainView
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIwithData()
    }
    

    
    // MARK: - set UI with Data
    func setUIwithData() {
        mainView.dateLabel.text = shortDateString
    }
    
    
    
    // MARK: - addTarget
    
    @objc func firstButtonTapped() {
        print("first button tapped")
    }
    @objc func secondButtonTapped() {
        print("second button tapped")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear 호출됨")
        
    }
}
