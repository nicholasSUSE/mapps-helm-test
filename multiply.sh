#!/bin/bash -x

# The directory to copy
src="charts/CH1"

# The base name for the new directories
base="charts/CH"

# The number of copies to make
copies=10

# Start from 2 because CH1 already exists
for (( i=3; i<=copies+1; i++ ))
do
  # Construct the destination directory name
  dest="$base$i"

  # Copy the source directory to the destination
  cp -r "$src" "$dest"

    # Construct the path to the Chart.yaml file in the destination directory
  chart_file="$dest/Chart.yaml"

  # Use sed to replace 'ch1' with the new chart name in the Chart.yaml file
  sed -i "s/ch1/ch$i/g" "$chart_file"
done