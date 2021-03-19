//
//  main.swift
//  GetDeviceInformation
//
//  Created by MacBook Pro on 2021/03/19.
//

import Foundation
import DeviceHardware

let device = MacDeviceHardware.deviceHardware
let _ = device.gpu

print("--------- Mac Device Hardware Information ---------")
print("Model Name        : \(device.modelName)")
print("Processor         : \(device.processorName)")
print("CPU               : \(device.cpu)")
print("Processor Count   : \(device.processorCount)")
print("GPU               : \(device.gpu)")
print("Neural Engine     : \(device.neuralEngine)")
print("RAM               : \(device.ramString)")
print("---------------------------------------------------")
print("")

let uiDevice = UIDeviceHardware.deviceHardware
print("hw.machine        : \(uiDevice.modelIdentifier)")
print("hw.model          : \(device.modelIdentifier)")
print("cpu.brand_string  : \(getCpuBrand())")
print("hw.ncpu           : \(getNCpu())")
print("hw.physicalcpu    : \(getPhysicalCpu())")
print("hw.logicalcpu     : \(getLogicalCpu())")
print("hw.cpufrequency   : \(getCpuFrequency())")
print("Default Metal GPU : \(getGpuDevice())")
print("RAM [B]           : \(device.ram)")
