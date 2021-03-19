//
//  DeviceInfo.swift
//  GetDeviceInformation
//
//  Created by MacBook Pro on 2021/03/20.
//

import Foundation
import Metal

func getCpuBrand() -> String {
    var size: Int = 0
    sysctlbyname("machdep.cpu.brand_string", nil, &size, nil, 0)
    var machine = [CChar](repeating: 0, count: Int(size))
    sysctlbyname("machdep.cpu.brand_string", &machine, &size, nil, 0)
    let cpuInfo: String = String(cString:machine)
    return cpuInfo
}

func getNCpu() -> Int32 {
    var core: Int32 = 0
    var size = MemoryLayout<Int32>.size
    sysctlbyname("hw.ncpu", &core, &size, nil, 0)
    return core
}

func getPhysicalCpu() -> Int32 {
    var core: Int32 = 0
    var size = MemoryLayout<Int32>.size
    sysctlbyname("hw.physicalcpu", &core, &size, nil, 0)
    return core
}

func getLogicalCpu() -> Int32 {
    var core: Int32 = 0
    var size = MemoryLayout<Int32>.size
    sysctlbyname("hw.logicalcpu", &core, &size, nil, 0)
    return core
}

func getCpuFrequency() -> Int64 {
    var freq: Int64 = 0
    var size = MemoryLayout<Int64>.size
        
    sysctlbyname("hw.cpufrequency", &freq, &size, nil, 0)
    return freq
}

func getGpuDevice() -> String {
    guard let device = MTLCreateSystemDefaultDevice() else {
        fatalError("Failed to get the system's default Metal device.")
    }
    
    return device.name
}

