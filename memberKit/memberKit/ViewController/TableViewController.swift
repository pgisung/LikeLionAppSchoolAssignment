//
//  TableViewController.swift
//  memberKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/14.
//

import UIKit
import AVFoundation

enum enumSections : Int, CaseIterable {
    case FIRST_SECTION = 0
    case SECOND_SECTION
    case THIRD_SECTION
}

class TableViewController: UITableViewController {
    var objSpeechSynthesizer: AVSpeechSynthesizer?
    var strLabel: String = "Select a member"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objSpeechSynthesizer = AVSpeechSynthesizer()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return enumSections.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case enumSections.FIRST_SECTION.rawValue:
            return 1
        case enumSections.SECOND_SECTION.rawValue:
            return members.count
        case enumSections.THIRD_SECTION.rawValue:
            return 1
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "memberCell")
        
        switch indexPath.section {
        case enumSections.FIRST_SECTION.rawValue:
            cell.textLabel?.text = strLabel
        case enumSections.SECOND_SECTION.rawValue:
            let index: Int = indexPath.row
            let member: Member = members[index]
            
            let name: String = member.strName
            let nickName: String = member.strNickName
            
            cell.textLabel?.text = "\(name)"
            cell.detailTextLabel?.text = "\(nickName)"
        case enumSections.THIRD_SECTION.rawValue:
            cell.textLabel?.text = "Stop speaking"
        default:
            break
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case enumSections.FIRST_SECTION.rawValue:
            break
        case enumSections.SECOND_SECTION.rawValue:
            let index: Int = indexPath.row
            let member: Member = members[index]
            
            let name: String = member.strName
            let nickName: String = member.strNickName
            
            strLabel = "\(nickName), Nice to meet you \(name)"
            
            let objSpeechUtterance = AVSpeechUtterance(string: strLabel)
            objSpeechSynthesizer?.speak(objSpeechUtterance)
        case enumSections.THIRD_SECTION.rawValue:
            objSpeechSynthesizer?.stopSpeaking(at: .immediate)
        default:
            break
        }
        
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
