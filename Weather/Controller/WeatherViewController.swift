//
//  ViewController.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/22/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properites
    let weatherViewModel: WeatherViewModel = WeatherViewModel()
    let refresher = UIRefreshControl()
    let weatherCellHeight: CGFloat = 160.0
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        weatherViewModel.getCachedWeatherData()
        getDataFromAPI()
        weatherViewModel.onDataDidChange = { [weak self] in
            self?.refresher.endRefreshing()
            self?.reloadData()
        }
    }

    //MARK: FetchData
    func getDataFromAPI(){
        weatherViewModel.weather.removeAll()
        weatherViewModel.getWeatherData(city: .delhi)
        weatherViewModel.getWeatherData(city: .mumbai)
        weatherViewModel.getWeatherData(city: .kolkata)
        weatherViewModel.getWeatherData(city: .goa)
        weatherViewModel.getWeatherData(city: .hyderabad)
        weatherViewModel.getWeatherData(city: .chennai)
        weatherViewModel.getWeatherData(city: .nagpur)
        weatherViewModel.getWeatherData(city: .amritsar)
        weatherViewModel.getWeatherData(city: .kochi)
        weatherViewModel.getWeatherData(city: .surat)
    }
    
    @objc func refreshData(){
        refresher.beginRefreshing()
        getDataFromAPI()
    }
    
    // MARK: Configurations
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.addSubview(refresher)
    }
    
    func reloadData(){
        collectionView.reloadData()
    }
}

