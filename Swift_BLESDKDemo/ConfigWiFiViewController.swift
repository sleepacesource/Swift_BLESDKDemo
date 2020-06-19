//
//  ConfigWiFiViewController.swift
//  Swift_BLESDKDemo
//
//  Created by San on 19/6/2020.
//  Copyright © 2020 medica. All rights reserved.
//

import UIKit
import BluetoothManager
import BLEWifiConfig

class ConfigWiFiViewController: UIViewController,scanDelegate ,UITextFieldDelegate{
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var textfield4: UITextField!
    @IBOutlet weak var configureBT: UIButton!
    @IBOutlet weak var view1: UIView!
    
    var deviceType: SLPDeviceTypes?
    
    var currPer: SLPPeripheralInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initUI()
    }
    
    func initUI() -> Void {
        self.label1.text = NSLocalizedString("step1", comment: "");
        self.label2.text = NSLocalizedString("select_device", comment: "");
        self.label3.text = NSLocalizedString("select_device", comment: "");
        //    self.label4.text = @"设备连接的WiFi";
        self.label5.text = NSLocalizedString("step3", comment: "");
        self.label6.text = NSLocalizedString("select_wifi", comment: "");
        
        self.label7.text = NSLocalizedString("step2", comment: "");
        self.label8.text = NSLocalizedString("ip_address", comment: "");
        
        self.configureBT.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        self.configureBT.layer.cornerRadius = 2.0;
        self.configureBT.layer.masksToBounds = true;
        self.configureBT.setTitle(NSLocalizedString("pair_wifi", comment: ""), for:.normal)
        
        if #available(iOS 13.0, *) {
            self.view1.layer.borderColor = CGColor.init(srgbRed: 195/255.0, green: 203/255.0, blue: 214/255.0, alpha: 1.0)
        } else {
            // Fallback on earlier versions
        }
        self.view1.layer.cornerRadius = 4.0;
        self.view1.layer.borderWidth = 1.0;
        
        self.textfield1.placeholder = NSLocalizedString("input_wifi_name", comment: "");
        self.textfield2.placeholder = NSLocalizedString("input_wifi_psw", comment: "");
        
        self.textfield3.text = "172.14.1.100";
        self.textfield4.text = "3013";
        
        self.textfield1.delegate = self
        self.textfield2.delegate = self
        self.textfield3.delegate = self
        self.textfield4.delegate = self
        
        self.deviceType = SLPDeviceTypes.wifiReston
    }
    
    @IBAction func scanDevice(_ sender: Any) {
        
        self.resignTextfiled()
        let searchVC = SearchViewController()
        searchVC.delegate = self
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @IBAction func configWiFi(_ sender: Any) {
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        if self.deviceType == SLPDeviceTypes.nox2_WiFi {
//            SLPBLEManager.shared()?.scanBluetooth(withTimeoutInterval: <#T##CGFloat#>, completion: <#T##SLPBLEScanHandle!##SLPBLEScanHandle!##(SLPBLEScanReturnCodes, Int, SLPPeripheralInfo?) -> Void#>)
            
//            SLPBleWifiConfig.shared().conf
//            SLPBleWifiConfig.sharedInstance()?.conf
           
        
        }
        else
        {
            
        }
        
    }
    
    func didselectDeviceType(devicename: NSString) -> Void {
        
        if devicename.hasPrefix("SA11") {
            self.deviceType = SLPDeviceTypes.sal;
            
        }
        else if devicename.hasPrefix("EW1W"){
            self.deviceType =  SLPDeviceTypes.EW201W
        }
        else if devicename.hasPrefix("M8"){
            self.deviceType =  SLPDeviceTypes.M800
        }
        else if devicename.hasPrefix("SN91E"){
            self.deviceType =  SLPDeviceTypes.SN913E
        }
        else if devicename.hasPrefix("BM8721"){
            self.deviceType =  SLPDeviceTypes.BM8701
        }
        else if devicename.hasPrefix("BM8722"){
            self.deviceType =  SLPDeviceTypes.BM8701_2
        }
        else if devicename.hasPrefix("BM871W"){
            self.deviceType =  SLPDeviceTypes.M8701W
        }
        else if devicename.hasPrefix("FH61W"){
            self.deviceType =  SLPDeviceTypes.FH601W
        }
        else if devicename.hasPrefix("BG01A"){
            self.deviceType =  SLPDeviceTypes.BG001A
        }
        else if devicename.hasPrefix("SN22"){
            self.deviceType =  SLPDeviceTypes.nox2_WiFi
        }
        else if devicename.hasPrefix("EW22W"){
            self.deviceType =  SLPDeviceTypes.EW202W
        }
        else
        {
            self.deviceType =  SLPDeviceTypes.wifiReston
        }
    }
    
    func didSelectPeripheal(peripheralInfo: SLPPeripheralInfo) {
        
        self.currPer = peripheralInfo
        
        self.label4.text = peripheralInfo.name!
        self.didselectDeviceType(devicename: peripheralInfo.name! as NSString)
    }
    
    func resignTextfiled() -> Void {
        
        
    }
}
