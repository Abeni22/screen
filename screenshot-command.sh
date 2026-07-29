screenshot() {

  # Search text
  SEARCH_TEXT="JavaScript functions tutorial"

  # Google search URL
  SEARCH_URL="https://www.google.com/search?q=JavaScript+functions+tutorial"

  # Folder to save screenshots
  SAVE_FOLDER="$HOME/OneDrive/Desktop/browser-screenshots"

  # Create a unique filename using date and time
  FILE_NAME="search-$(date +%Y%m%d-%H%M%S).png"

  # Create the folder if it does not exist
  mkdir -p "$SAVE_FOLDER"

  # Open Chrome and search Google
  start chrome "$SEARCH_URL"

  # Wait for the page to load
  sleep 5

  # Take screenshot
  powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; \$bounds=[System.Windows.Forms.Screen]::PrimaryScreen.Bounds; \$bmp=New-Object System.Drawing.Bitmap \$bounds.Width,\$bounds.Height; \$graphics=[System.Drawing.Graphics]::FromImage(\$bmp); \$graphics.CopyFromScreen(\$bounds.Location,[System.Drawing.Point]::Empty,\$bounds.Size); \$bmp.Save('$FILE_NAME',[System.Drawing.Imaging.ImageFormat]::Png); \$graphics.Dispose(); \$bmp.Dispose();"

  # Move screenshot into the folder
  mv "$FILE_NAME" "$SAVE_FOLDER"

  # Success message
  echo "Screenshot saved successfully!"
  echo "Location: $SAVE_FOLDER/$FILE_NAME"
}