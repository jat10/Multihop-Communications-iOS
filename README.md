# Multihop-Communications-iOS

Objective: Design and Implement a Mobile Application (Android or IOS) that serves the purpose of multihop communications and can also be used for device neighborhood Information management

Application Requirements:

  *) Checks the connectivity state of various networking protocols on the device (Bluetooth, cellular, and WiFi) and displays their status.
  
  *) Display in a List View a specified number of entries about the state of the various networking protocol (Signal Strength, Cell tower ID, Location of data collection...). The purpose of the latter is to
  
    * Display the change in connection parameters when moving and connecting to different base stations, and 
    * Associating an area with a cell tower 
    * Determining the signal strength when connecting to particular base stations 
    
  *) Detect devices with Wi-Fi P2P enabled and displays related info about them. In this respect, the phone has to identify itself, using a  MAC address or a phone number. The phone number can be obtained programmatically through the application itself, or interactively through an option menu provided to the user. More points will be awarded for the approach with automatic retrieval of the phone number.
  
  *) List in a List View previously detected devices along with associated information. 
  
  *) When the phone detects a device, it keeps track of the length of detection (i.e., time range), and stores this information locally (deviceID, last time of detection, and last time range). It also keeps track of the number of times it detected this device, and the cumulative duration of detection (i.e., including current and all past detection events). Put it in a Connection History
database 

  *) Write a utility that exports related data in the local database to a text file for checking 

  *) Each device should have the capability to forward packets from one point to another by implementing a multihop protocol between devices. Static entries in the local database of the phone will guide the phone to the next hop, but bonus points will be awarded to dynamic routing between devices 
