workflow Restart-And-Continue {
    # Initial script execution
    Write-Output "Running script..."

    # Restart the system
    Restart-Computer -Force

    # After system restarts, continue execution
    Write-Output "Continuing script..."
    # Add your additional script code here

    # Example: Display the current date and time after the restart
    Get-Date
}

# Start the workflow
Restart-And-Continue
