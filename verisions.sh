#!/bin/bash -x

# The base name for the new directories
base="charts/CH"

new_version=2.0.0

# Loop over all directories from CH1 to CH500
for i in {1..500}
do
  # Define the file
  file="${base}${i}/Chart.yaml"

  # Use sed to replace the version and appVersion
  if [ -f "$file" ]; then
    sed -i "s/version: [0-9]\+\.[0-9]\+\.[0-9]\+/version: ${new_version}/g" $file
    sed -i "s/appVersion: \"[0-9]\+\.[0-9]\+\.[0-9]\+\"/appVersion: \"${new_version}\"/g" $file
  fi
done