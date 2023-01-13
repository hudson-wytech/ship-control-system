#!/bin/bash

# Function for SETTINGS
function settings() {
    echo "Changing settings for the ship."
    cat ./config/ship-settings.cfg
    echo "Settings successfully changed."
}

# Function for SHIP CONTROL SYSTEMS
function ship_control() {
    echo "Starting ship control systems."
    systemctl start ship_control_service
    echo "Ship control systems successfully started."
}

# Function for PANIC
function panic() {
    echo "Initiating emergency protocols."
    echo "PANIC: Emergency protocols initiated at $(date)" >> /ship/control/log/emergency.log
    read -p "Enter reason code: " reason
    echo "REASON CODE: $reason"
    echo "Emergency protocols successfully initiated."
}

# Function for FLAG
function flag() {
    echo "Raising the flag."
    cat ./ship/control/flag
    echo "Flag raised."
}

while true; do
  echo "Please select an option:"
  echo "0. SETTINGS"
  echo "1. SHIP CONTROL SYSTEMS"
  echo "2. PANIC"
  echo "3. FLAG"
  read -p "Selection: " selection

  case $selection in
    0)
      echo "Accessing SETTINGS..."
      settings
      ;;
    1)
      echo "Accessing SHIP CONTROL SYSTEMS..."
      ship_control
      ;;
    2)
      echo "Initiating PANIC..."
      panic
      ;;
    3)
      echo "Accessing FLAG..."
      flag
      ;;
    *)
      echo "Invalid selection. Please try again."
      ;;
  esac
done

