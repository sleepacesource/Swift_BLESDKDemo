//
//  SearchViewController.swift
//  BLENOX2Demo-Swift
//
//  Created by San on 12/9/2019.
//  Copyright © 2019 medica. All rights reserved.
//

import UIKit
import BluetoothManager

protocol scanDelegate {
    func didSelectPeripheal(peripheralInfo : SLPPeripheralInfo)
}

class SearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    var deviceList = NSMutableArray.init()
    
    var delegate : scanDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.dataSource = self;
        self.tableview.delegate = self;
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellID")
        
        self.scan()
        
    }
    
    func scan() -> Void {
        let bleOpen = SLPBLEManager.shared()?.blueToothIsOpen()
        if !bleOpen! {
            print("ble not open!")
            return ;
        }
        
        deviceList.removeAllObjects()
        self.tableview.reloadData()
        
        let ret = SLPBLEManager.shared()?.scanBluetooth(withTimeoutInterval: 3.0, completion: { (code: SLPBLEScanReturnCodes, handleID: Int, peripheralInfo: SLPPeripheralInfo?) in
            if code == SLPBLEScanReturnCodes.normal{//SLPBLEScanReturnCode_Normal
                self.appendPeripheral(info: peripheralInfo!)
            }
            else if code == SLPBLEScanReturnCodes.disable{
                print("ble not open!")
            }
        })
        
        if !ret! {
            print("ble not open!")
        }
    }
    
    func appendPeripheral(info:SLPPeripheralInfo) -> Void {
        if info.name.count == 0 {
            return ;
        }
            
        for ainfo in deviceList {
            if info.name == (ainfo as AnyObject).name
            {
                return ;
            }
        }
        
        deviceList.add(info)
        self.tableview.reloadData()
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        
        self.scan()
    }
    
    
    
    func selectDevice( per : SLPPeripheralInfo) -> Void {
        
        self.navigationController?.popViewController(animated: true)
        if (self.delegate != nil) {
            self.delegate?.didSelectPeripheal(peripheralInfo: per);
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return deviceList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = (deviceList[indexPath.row] as AnyObject).name
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let peripher : SLPPeripheralInfo = deviceList[indexPath.row] as! SLPPeripheralInfo
        self.selectDevice(per: peripher)
    }
    

}
