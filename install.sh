#!/bin/bash

# Ask the user to input the path to main.rb
read -p "Enter the path to main.rb: " MAIN_RB_PATH

# Check if the main.rb exists
if [ ! -f "$MAIN_RB_PATH" ]; then
    echo "main.rb not found at $MAIN_RB_PATH. Please provide the correct path."
    exit 1
fi

# Make the main script executable
sudo chmod +x "$MAIN_RB_PATH"

# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

# Create a symbolic link with the name 'rubydorks'
ln -s "$MAIN_RB_PATH" ~/.local/bin/rubydorks

# Add ~/.local/bin to PATH if it's not already
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo 'Please restart your terminal or run `source ~/.bashrc` to update your PATH.'
    # Consider adding similar lines for other shells' config files if needed.
else
    echo 'Installation complete. You can now use RubyDorks from anywhere!'
fi
