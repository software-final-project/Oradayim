#!/bin/bash

# Script'in bulunduğu klasörden proje kök dizinini belirle
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROJECT_ROOT=$(cd "$SCRIPT_DIR/../.." && pwd)
BASE_PATH="$PROJECT_ROOT/lib/screens"

# Kullanıcıdan ekran adını al
echo "Enter the screen name (e.g., add_business):"
read screen_name

# Küçük harfe çevir ve alt çizgili formata uyumlu hale getir
screen_name_snake_case=$(echo "$screen_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

# Hedef ekran yolu
screen_path="$BASE_PATH/$screen_name_snake_case"

# Eğer 'lib/screens' klasörü yoksa oluştur
if [ ! -d "$BASE_PATH" ]; then
  mkdir -p "$BASE_PATH"
  echo "Created missing base directory: $BASE_PATH"
fi

# Gerekli klasörler ve dosyalar
directories=(
  "$screen_path/viewmodels"
  "$screen_path/services"
  "$screen_path/views"
)
files=(
  "$screen_path/${screen_name_snake_case}_screen.dart"
  "$screen_path/services/${screen_name_snake_case}_service.dart"
  "$screen_path/viewmodels/${screen_name_snake_case}_view_model.dart"
)

# Klasörleri oluştur
for dir in "${directories[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    echo "Created directory: $dir"
  else
    echo "Directory already exists: $dir"
  fi
done

# Dosyaları oluştur
for file in "${files[@]}"; do
  if [ ! -f "$file" ]; then
    touch "$file"
    echo "Created file: $file"
  else
    echo "File already exists: $file"
  fi
done

echo "Screen structure for '$screen_name' created successfully inside 'lib/screens'!"
