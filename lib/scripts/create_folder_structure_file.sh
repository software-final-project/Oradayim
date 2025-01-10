#!/bin/bash

# Projenin mevcut lib klasörünü temel al
BASE_PATH="."

# Oluşturulacak klasörler
directories=(
  "$BASE_PATH/components"
  "$BASE_PATH/core/base/constants"
  "$BASE_PATH/core/base/init/lang"
  "$BASE_PATH/core/base/init/notifier"
  "$BASE_PATH/core/base/init/theme"
  "$BASE_PATH/core/base/notifications"
  "$BASE_PATH/core/base/services"
  "$BASE_PATH/core/base/viewmodels"
  "$BASE_PATH/core/base/views"
  "$BASE_PATH/constants"
  "$BASE_PATH/enums"
  "$BASE_PATH/extensions"
  "$BASE_PATH/models"
  "$BASE_PATH/screens"
  "$BASE_PATH/scripts"
  "$BASE_PATH/translations"
  "$BASE_PATH/utils"
)

# Klasörleri oluştur
for dir in "${directories[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    echo "Created: $dir"
  else
    echo "Already exists: $dir"
  fi
done

echo "Folder structure created successfully!"
