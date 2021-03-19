//
//  main.swift
//  GetDeviceInformation
//
//  Created by MacBook Pro on 2021/03/19.
//

import Foundation
import DeviceHardware

let device = MacDeviceHardware.deviceHardware

print("------ Mac Device Hardware Information ------")
print("Model Name      : \(device.modelName)")
print("Processor       : \(device.processorName)")
print("CPU             : \(device.cpu)")
print("Processor Count : \(device.processorCount)")
print("GPU             : \(device.gpu)")
print("Neural Engine   : \(device.neuralEngine)")
print("RAM             : \(device.ramString)")
