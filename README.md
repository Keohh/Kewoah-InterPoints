# Interaction Points in FiveM

## Overview

This project provides a flexible and customizable system for interaction points within a FiveM server. Interaction points allow players to interact with the environment in various ways, triggering specific actions when a player approaches or interacts with certain locations.

## Features

- **Configurable Interaction Points:** Easily set up multiple interaction points with specific actions tied to each.
- **Customizable UI:** Display 3D draw text at interaction points with options to modify text color, font style, and position.
- **Trigger Events:** Automatically trigger events when a player interacts with a point, such as repairing a vehicle, initiating a robbery, or opening a menu.
- **Zone-Specific Actions:** Implement zone-dependent actions, like speed limits or restricted areas, that trigger when players enter or exit specific zones.

## Installation

1. **Download the Repository:** Clone or download the repository to your FiveM server’s resources folder.
    ```bash
    git clone https://github.com/Keohh/Kewoah-InterPoints.git
    ```

2. **Add to server.cfg:** Include the resource in your `server.cfg` to ensure it loads correctly.
    ```lua
    start interaction-points
    ```

## Usage

Once the interaction points are configured and the server is running, players can approach these points and trigger the associated actions. The interaction point UI will display as players enter the designated zones, providing a seamless and immersive experience.

## Contributing

Contributions are welcome! If you have suggestions for improvements or want to report issues, feel free to create a pull request or submit an issue on the [GitHub repository](https://github.com/Keohh/Kewoah-InterPoints).

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

