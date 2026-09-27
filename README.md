# Facility Escape System

Enhance your FiveM experience with speed boosts, sound effects, and ESP markers.

## Features

- Speed boost when near facility coordinates
- Sound effects upon speed boost activation
- ESP markers to highlight facility locations
- Tracking and display of escape counts

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script files.
2. Place the files in your FiveM server's resources directory.
3. Add `ensure FacilityEscapeSystem` to your server.cfg file.
4. Import the database.sql file into your MySQL database.

## Usage

The script will automatically activate when a player is within the specified distance of a facility coordinate. The speed boost, sound effects, and ESP markers will be displayed accordingly. The escape count will be tracked and displayed to the player.

## Configuration

The script can be configured in the config.lua file. You can adjust the speed boost multiplier, duration, sound effect, ESP distance, and facility coordinates as needed.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=facility-escape-system&utm_content=bottom) — describe it in one sentence and get the full source code.