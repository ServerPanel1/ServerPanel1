#!/bin/bash

# Function to update the system and install Java
update_system() {
    sudo apt update
    sudo apt install -y openjdk-17-jre
}

# Function to download the Minecraft server
download_minecraft_server() {
    local url=$1
    local download_path=$2
    wget -O $download_path $url
}

# Function to create the start script
create_start_script() {
    local base_dir=$1
    local start_script_path="$base_dir/s.sh"

    cat << 'EOF' > $start_script_path
#!/bin/bash
cd "$(dirname "$0")/MC" && java -Xmx14G -Xms12G -jar server.jar nogui
EOF

    chmod +x $start_script_path
}

# Main script execution
main() {
    echo "Welcome to the Minecraft Server Setup Script for Linux"

    # Define paths
    base_dir=$(dirname "$(realpath "$0")")
    mc_dir="$base_dir/MC"
    mc_plugins_dir="$mc_dir/plugins"

    # Create necessary directories
    mkdir -p "$mc_dir" "$mc_plugins_dir"

    # Update and install OpenJDK
    update_system

    # Download the Minecraft server jar
    read -p "Enter the URL for the Minecraft server jar: " minecraft_server_url
    download_minecraft_server "$minecraft_server_url" "$mc_dir/server.jar"

    # Download the Playit plugin
    playit_plugin_url="https://github.com/playit-cloud/playit-minecraft-plugin/releases/latest/download/playit-minecraft-plugin.jar"
    download_minecraft_server "$playit_plugin_url" "$mc_plugins_dir/playit-minecraft-plugin.jar"

    # Create the start script
    create_start_script "$base_dir"

    # Start the Minecraft server
    cd "$mc_dir" && java -Xmx14G -Xms12G -jar server.jar nogui
}

main
