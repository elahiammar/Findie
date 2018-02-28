//
//  FDResultsTableViewController.swift
//  Findie
//
//  Created by elahiammar on 26/11/2017.
//  Copyright © 2017 elahiammar. All rights reserved.
//

import UIKit
import MapKit

class FDResultsTableViewController: UITableViewController {

    // MARK: - Properties
    
    fileprivate var viewModel: FDResultsViewModel = FDResultsViewModel(intWebServices: WebServices())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Private Functions
    
     func setupTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(FDSearchResultsTableViewCell.self, forCellReuseIdentifier: "FDSearchResultsTableViewCell")
    }
    
    // MARK: - Public Functions
    
    func searchLocation(with name: String) {
        viewModel.callWebService(with: name)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FDSearchResultsTableViewCell", for: indexPath) as! FDSearchResultsTableViewCell
        return cell
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
