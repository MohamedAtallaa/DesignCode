//
//  ViewController.swift
//  DesignCode
//
//  Created by Mohamed Atallah on 05/04/2023.
//

import UIKit
import Combine

class FeaturedViewController: UIViewController {

    @IBOutlet private var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var handbookCollectionView: UICollectionView!
    @IBOutlet weak var coursesTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbookCollectionView.delegate = self
        handbookCollectionView.dataSource = self
        handbookCollectionView.layer.masksToBounds = false
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.layer.masksToBounds = false
        
        coursesTableView.publisher(for: \.contentSize).sink { newContentSize in
            self.tableViewHeight.constant = newContentSize.height
        }
        .store(in: &tokens)
    }

}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        
        let handbook = handbooks[indexPath.item]
        cell.titleLabel.text = handbook.title
        cell.subtitleLabel.text = handbook.subtitle
        cell.descriptionLabel.text = handbook.description
        cell.gradient.colors = handbook.colors
        cell.logoImage.image = handbook.icon
        cell.bannerImage.image = handbook.banner
        
        return cell
    }
}

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        let course = courses[indexPath.section]
        
        cell.titleLabel.text = course.title
        cell.subtitleLabel.text = course.subtitle
        cell.descriptionLabel.text = course.description
        cell.courseBackground.image = course.background
        cell.courseBanner.image = course.banner
        cell.courseLogo.image = course.icon
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
