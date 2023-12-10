#!/bin/bash -x

# The directory to copy
src="charts/CH1"

# The base name for the new directories
base="charts/CH"

# The number of copies to make
copies=100

# The number of available icons
icons=15

# Start from 2 because CH1 already exists
for (( i=2; i<=copies+1; i++ ))
do
  # Construct the destination directory name
  dest="$base$i"

  # Copy the source directory to the destination
  cp -r "$src" "$dest"

    # Construct the path to the Chart.yaml file in the destination directory
  chart_file="$dest/Chart.yaml"

  # Use sed to replace 'ch1' with the new chart name in the Chart.yaml file
  # The pattern 'name: ch1' is used to ensure that only the chart name is replaced
  sed -i "s/name: ch1/name: ch$i/g" "$chart_file"

  # Calculate the icon number to use
  icon_num=$(( (i-1) % icons + 1 ))

  # Use sed to replace the icon number in the Chart.yaml file
  sed -i "s/ch1.jpg/ch$icon_num.jpg/g" "$chart_file"

done