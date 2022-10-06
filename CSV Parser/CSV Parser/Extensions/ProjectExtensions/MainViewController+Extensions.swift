//
//  MainViewController+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import Foundation
import UIKit


extension MainViewController {
    
    func registerCell(with identifier: String) {
        tableView.register(UserCell.self, forCellReuseIdentifier: identifier)
    }
    
}

extension MainViewController {
    
    internal var importFileButton: UIBarButtonItem {
        get { UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectFile)) }
    }
    
    @objc func selectFile() {
        setupPicker()
    }
    
}

extension MainViewController {
    
    private func getPickerValues() -> [String] {
        do {
            let files = try fileImporter.getFiles()
            return files
        } catch {
            print("Unable to obtain files.")
        }
        return []
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var pickerWidth: CGFloat {
        get { UIScreen.main.bounds.width - 10 }
    }
    
    private var pickerHeight: CGFloat {
        get { UIScreen.main.bounds.height / 4 }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        files.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        files[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        60.0
    }
    
    func setupPicker() {
        if files.isEmpty {
            files = getPickerValues()
        }
        let pickerVC = UIViewController()
        pickerVC.preferredContentSize = CGSize(width: pickerWidth, height: pickerHeight)
        filePicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: pickerWidth, height: pickerHeight))
        filePicker.delegate = self
        filePicker.dataSource = self
        filePicker.autoresizingMask = .flexibleWidth
        pickerVC.view.addSubview(filePicker)
        filePicker.addAnchors(cXAnchor: pickerVC.view.centerXAnchor, cYAnchor: pickerVC.view.centerYAnchor)
        
        let alert = UIAlertController(title: "Select File to import", message: "", preferredStyle: .actionSheet)
        alert.popoverPresentationController?.sourceView = importFileButton.customView
        alert.popoverPresentationController?.sourceRect = importFileButton.customView?.bounds ?? .zero
        
        alert.setValue(pickerVC, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Import", style: .default, handler: { _ in
            
        }))
        
        self.present(alert, animated: true)
    }
}
