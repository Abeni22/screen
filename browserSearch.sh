#!/bin/bash

# This is the text we want to search on Google
SEARCH_TEXT="javascript arrays and objects examples"

# This is the Google search URL
SEARCH_URL="https://www.google.com/search?q=ronaldo+messi+and+their+wife"

# This is the folder where we want to save the final screenshot
DESKTOP_FOLDER="$HOME/OneDrive/Desktop/my-browser-assignment"

# This is the temporary screenshot file name
SCREENSHOT_FILE="google-search-screenshot.png"

# Create the Desktop folder
mkdir -p "$DESKTOP_FOLDER"

# Open Google Chrome
start chrome "$SEARCH_URL"

# Wait for the page to load
sleep 5

# Take a screenshot using PowerShell
powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; \$bounds=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds; \$bmp=New-Object System.Drawing.Bitmap \$bounds.Width,\$bounds.Height; \$graphics=[System.Drawing.Graphics]::FromImage(\$bmp); \$graphics.CopyFromScreen(\$bounds.Location,[System.Drawing.Point]::Empty,\$bounds.Size); \$bmp.Save('$SCREENSHOT_FILE',[System.Drawing.Imaging.ImageFormat]::Png); \$graphics.Dispose(); \$bmp.Dispose();"

# Move the screenshot to the Desktop folder
mv "$SCREENSHOT_FILE" "$DESKTOP_FOLDER"

# Print a success message
echo "===================================="
echo "✅ Screenshot saved successfully!"
echo "📁 Location: $DESKTOP_FOLDER/$SCREENSHOT_FILE"
echo "===================================="