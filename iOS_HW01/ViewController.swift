//
//  ViewController.swift
//  iOS_HW01
//
//  Created by Prerana Singh on 11/5/18.
//  Copyright © 2018 Prerana Singh. All rights reserved.
//
/* Assignment - iOS HW1
 FileNme - ViewController.swift
 Student: Prerana Singh
 */

import UIKit
import Alamofire
import SDWebImage

//
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var categoryList = [String]()
    var categories = [String]()
    var category1 = [Dictionary<String,Any>]()
    var category2 = [Dictionary<String,Any>]()
    var category3 = [Dictionary<String,Any>]()
    var category4 = [Dictionary<String,Any>]()
    var category5 = [Dictionary<String,Any>]()
    var category6 = [Dictionary<String,Any>]()
    var category7 = [Dictionary<String,Any>]()
    var category8 = [Dictionary<String,Any>]()
    var category9 = [Dictionary<String,Any>]()
    var appTitle = ""
    var appDeveloper = ""
    var appPrice = ""
    var appDate = ""
    var appSmallUrl = ""
    var appLargeUrl = ""
    var appSummary = ""
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        Alamofire.request("http://dev.theappsdr.com/apis/apps.json").responseJSON{
            (response) in
            
            //check if the result has value
            if let jsonRoot = response.result.value as? [String:Any]{
             //   let feedArray = jsonRoot["feed"] as! [[String:Any]]
             //  let categoryArray = jsonRoot["feed"].flatMap{$0["category"] as? String}
                
                if let feedArray = jsonRoot["feed"] as? [[String:Any]]{
                   // print(feedArray)
                    let dict = Dictionary(grouping: feedArray) { $0["category"] as! String }
                  //  print(dict)
                    self.categories = Array(dict.keys)
                   // print(self.categories)
                    self.category1 = dict[self.categories[0]]!
                    self.category2 = dict[self.categories[1]]!
                    self.category3 = dict[self.categories[2]]!
                    self.category4 = dict[self.categories[3]]!
                    self.category5 = dict[self.categories[4]]!
                    self.category6 = dict[self.categories[5]]!
                    self.category7 = dict[self.categories[6]]!
                    self.category8 = dict[self.categories[7]]!
                    self.category9 = dict[self.categories[8]]!
                   // print(self.category1)
         
                }
            }
            self.tableView.reloadData()
            self.tableView.setNeedsLayout()
            self.tableView.layoutIfNeeded()
            self.tableView.reloadData()
           // self.tableView.scrollsToTop()
        }
    }
   
    
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return category1.count
        case 1:
            return category2.count
        case 2:
            return category3.count
        case 3:
            return category4.count
        case 4:
            return category5.count
        case 5:
            return category6.count
        case 6:
            return category7.count
        case 7:
            return category8.count
        default:
            return category9.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
        var cell = tableView.dequeueReusableCell(withIdentifier: "listGeneral", for: indexPath)
        switch (indexPath.section) {
        case 0:
            appLargeUrl = category1[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category1[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                 cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                 let imgLarge = cell.viewWithTag(6) as! UIImageView
                 imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                 cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                 let lblSummary = cell.viewWithTag(7) as! UILabel
                 lblSummary.text = appSummary
            }

            appTitle = category1[indexPath.row]["title"] as! String
            print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category1[indexPath.row]["developer"] as! String
           // print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category1[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category1[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category1[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
            
            
        case 1:
            appLargeUrl = category2[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category2[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            
            appTitle = category2[indexPath.row]["title"] as! String
            print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category2[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category2[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category2[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category2[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
            
        case 2:
            appLargeUrl = category3[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category3[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category3[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category3[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category3[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category3[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category3[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
           
            
        case 3:
            appLargeUrl = category4[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category4[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category4[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category4[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category4[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category4[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category4[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
            
            
        case 4:
            appLargeUrl = category5[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category5[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category5[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category5[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category5[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category5[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category5[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
           
            
        case 5:
            appLargeUrl = category6[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category6[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category6[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category6[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category6[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category6[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category6[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
            
        case 6:
            appLargeUrl = category7[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category7[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category7[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category7[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category7[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category7[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category7[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
        case 7:
            appLargeUrl = category8[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category8[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category8[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category8[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category8[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category8[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category8[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
        case 8:
            appLargeUrl = category9[indexPath.row]["otherImage"] as? String ?? ""
            appSummary = category9[indexPath.row]["summary"] as? String ?? ""
            if appLargeUrl != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listCells", for: indexPath)
                let imgLarge = cell.viewWithTag(6) as! UIImageView
                imgLarge.sd_setImage(with: URL(string: appLargeUrl), placeholderImage: nil)
            }
            else if appSummary != ""{
                cell = tableView.dequeueReusableCell(withIdentifier: "listSummary", for: indexPath)
                let lblSummary = cell.viewWithTag(7) as! UILabel
                lblSummary.text = appSummary
            }
            appTitle = category9[indexPath.row]["title"] as! String
            //print(appTitle)
            let lblTitle = cell.viewWithTag(2) as! UILabel
            lblTitle.text = appTitle
            appDeveloper = category9[indexPath.row]["developer"] as! String
            print(appDeveloper)
            let lblDeveloper = cell.viewWithTag(3) as! UILabel
            lblDeveloper.text = appDeveloper
            appPrice = category9[indexPath.row]["price"] as! String
            let lblPrice = cell.viewWithTag(5) as! UILabel
            lblPrice.text = appPrice
            appDate = category9[indexPath.row]["releaseDate"] as! String
            let lblReleaseDate = cell.viewWithTag(4) as! UILabel
            let dateFormatter = DateFormatter()
            let inputDate = appDate
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ" //iso 8601
            let outputDate = dateFormatter.date(from: inputDate)
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            // again convert your date to string
            let dateString = formatter.string(from: outputDate!)
            lblReleaseDate.text = dateString
            
            appSmallUrl = category9[indexPath.row]["squareIcon"] as! String
            let imgSmall = cell.viewWithTag(1) as! UIImageView
            imgSmall.sd_setImage(with: URL(string: appSmallUrl), placeholderImage: nil)
            
        default:
            print("no section")
            
        }
        return cell
    }
    


   
    
}

