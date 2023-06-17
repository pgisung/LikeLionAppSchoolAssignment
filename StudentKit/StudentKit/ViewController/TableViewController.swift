//
//  TableViewController.swift
//  StudentKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import UIKit

class TableViewController: UITableViewController {

    var message: String = "Select a student"
    
    override func viewDidLoad() {
        
    }

    // MARK: - Table view data source
    
    // 테이블에 몇 개의 section이 있는지 알려준다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    // section마다 몇 개의 row가 포함되었는지 알려준다
    // 그래서 section 숫자 만큼 호출된다
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            // 우리는 학생 숫자 만큼 row를 만들거라서 이렇게 답한다.
            return students.count
        default:
            return 0
        }
    }
    // section과 row 정보가 모아져 나온 indexPath값에 맞춰 적절한 cell을 만들어 던져준다
    // 마치 여러분은 "몇학년 몇반" 얘기만 듣고 학생목록에서 적절한 이름을 찾아서 명함을 만들어 보내주는 역할과 같다
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 새로운 cell을 만드는데, 스타일도 정해주고, 반복사용될 때의 내부이름도 정해준다
        let cell =  UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = message
        case 1:
            let row: Int = indexPath.row
            let student = students[row]
            
            let name: String = student.name
            let number: Int = student.number
            
            // 이제 만들어진 기본 cell의 모양을 다듬어주자 (명함의 이름을 새겨주자)
            cell.textLabel?.text = "\(name)"
            cell.detailTextLabel?.text = "\(number)"
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            break
        case 1:
            let row: Int = indexPath.row
            let student = students[row]
            
            let name: String = student.name
            let number: Int = student.number
            
            message = "Hello \(number), \(name)"
        default:
            break
        }
        
        // 테이블 좀 다시 그려봐라
        // 그래야 우리가 바꾼 내용이 반영된다
        tableView.reloadData()
    }
}
