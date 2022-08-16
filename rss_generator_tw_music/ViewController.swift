//
//  ViewController.swift
//  rss_generator_tw_music
//
//  Created by rjjq on 2022/8/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    var items = [Item]()
    
    var pickerData = ["Albums", "Music Videos", "Playlists", "Songs"]
    let musicTypes = ["albums", "music-videos", "playlists", "songs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        fetchItems(type: musicTypes.first!)
    }
    
   
    
    @IBSegueAction func show(_ coder: NSCoder) -> MusicTableViewController? {
        guard items.count > 0, let controller = MusicTableViewController(coder: coder) else {return nil}
        
        controller.items = items
        return controller
    }
        
    func fetchItems(type: String) {
        if let url = URL(string: "https://rss.applemarketingtools.com/api/v2/tw/music/most-played/50/\(type).json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    do {
                        let decoder = JSONDecoder()
                        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.items = searchResponse.feed.results
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(musicTypes[row])
        let type = musicTypes[row]
        
        self.fetchItems(type: type)
    }
}
