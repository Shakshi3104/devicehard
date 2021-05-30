//
//  main.swift
//  GetDeviceInformation
//
//  Created by MacBook Pro on 2021/03/19.
//

import Foundation
import ArgumentParser
import DeviceHardware

// MARK: - Argment Parser
struct DeviceHarder: ParsableCommand {
    static var configuration: CommandConfiguration = CommandConfiguration(
        commandName: "devicehard",
        abstract: "Output Mac device hardware information.",
        discussion: """
        Check the output of the package DeviceHardware.
        DeviceHardware: https://github.com/Shakshi3104/DeviceHardware
        """,
        version: "1.1.0",
        shouldDisplay: true
    )
    
    @Flag(help: "Show information not implemented in DeviceHardware.")
    var verbose: Bool = false
    
    func run() throws {
        let device = MacDeviceHardware.deviceHardware
        let _ = device.gpu
        
        // Output device hardware information implemented in DeviceHardware
        print("--------- Mac Device Hardware Information ---------")
        print("Model Name        : \(device.modelName)")
        print("Processor         : \(device.processorName)")
        print("CPU               : \(device.cpu)")
        print("Processor Count   : \(device.processorCount)")
        print("GPU               : \(device.gpu)")
        print("Neural Engine     : \(device.neuralEngine)")
        print("RAM               : \(device.ramString)")

        if verbose {
            // Output device information not implemented in DeviceHardware
            // But, hw.machine and hw.model are implemented in DeviceHardware as modelIdentifier
            print("")
            let uiDevice = UIDeviceHardware.deviceHardware
            print("--------------- Detail Information ----------------")
            print("hw.machine        : \(uiDevice.modelIdentifier)")
            print("hw.model          : \(device.modelIdentifier)")
            print("cpu.brand_string  : \(getCpuBrand())")
            print("hw.ncpu           : \(getNCpu())")
            print("hw.physicalcpu    : \(getPhysicalCpu())")
            print("hw.logicalcpu     : \(getLogicalCpu())")
            print("hw.cpufrequency   : \(getCpuFrequency())")
            print("Default Metal GPU : \(getGpuDevice())")
            print("RAM [B]           : \(device.ram)")
        }
        
        print("---------------------------------------------------")
    }
}

// MARK: - Run
DeviceHarder.main()
