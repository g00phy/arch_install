make_assets() {
  local dest="${1}"
  local name="${2}"
  local theme="${3}"
  local color="${4}"
  local size="${5}"
  local scheme="${6}"
  local window="${7}"

  [[ ${color} == '-Light' ]] && local ELSE_LIGHT="${color}"
  [[ ${color} == '-Dark' ]] && local ELSE_DARK="${color}"

  local THEME_DIR="${1}/${2}${3}${4}${5}${6}"

  case "$theme" in
  '')
    theme_color_dark='#3c84f7'
    theme_color_light='#5b9bf8'
    ;;
  -Purple)
    theme_color_dark='#AB47BC'
    theme_color_light='#BA68C8'
    ;;
  -Pink)
    theme_color_dark='#EC407A'
    theme_color_light='#F06292'
    ;;
  -Red)
    theme_color_dark='#E53935'
    theme_color_light='#F44336'
    ;;
  -Orange)
    theme_color_dark='#F57C00'
    theme_color_light='#FB8C00'
    ;;
  -Yellow)
    theme_color_dark='#FBC02D'
    theme_color_light='#FFD600'
    ;;
  -Green)
    theme_color_dark='#4CAF50'
    theme_color_light='#66BB6A'
    ;;
  -Teal)
    theme_color_dark='#009688'
    theme_color_light='#4DB6AC'
    ;;
  -Grey)
    theme_color_dark='#464646'
    theme_color_light='#DDDDDD'
    ;;
  esac

  if [[ $scheme == '-Nord' ]]; then
    case "$theme" in
    '')
      theme_color_dark='#5e81ac'
      theme_color_light='#89a3c2'
      ;;
    -Purple)
      theme_color_dark='#b57daa'
      theme_color_light='#c89dbf'
      ;;
    -Pink)
      theme_color_dark='#cd7092'
      theme_color_light='#dc98b1'
      ;;
    -Red)
      theme_color_dark='#c35b65'
      theme_color_light='#d4878f'
      ;;
    -Orange)
      theme_color_dark='#d0846c'
      theme_color_light='#dca493'
      ;;
    -Yellow)
      theme_color_dark='#e4b558'
      theme_color_light='#eac985'
      ;;
    -Green)
      theme_color_dark='#82ac5d'
      theme_color_light='#a0c082'
      ;;
    -Teal)
      theme_color_dark='#63a6a5'
      theme_color_light='#83b9b8'
      ;;
    -Grey)
      theme_color_dark='#3a4150'
      theme_color_light='#d9dce3'
      ;;
    esac
  fi

  if [[ $scheme == '-Dracula' ]]; then
    case "$theme" in
    '')
      theme_color_dark='#a679ec'
      theme_color_light='#bd93f9'
      ;;
    -Purple)
      theme_color_dark='#a679ec'
      theme_color_light='#bd93f9'
      ;;
    -Pink)
      theme_color_dark='#f04cab'
      theme_color_light='#ff79c6'
      ;;
    -Red)
      theme_color_dark='#f44d4d'
      theme_color_light='#ff5555'
      ;;
    -Orange)
      theme_color_dark='#f8a854'
      theme_color_light='#ffb86c'
      ;;
    -Yellow)
      theme_color_dark='#e8f467'
      theme_color_light='#f1fa8c'
      ;;
    -Green)
      theme_color_dark='#4be772'
      theme_color_light='#50fa7b'
      ;;
    -Teal)
      theme_color_dark='#20eed9'
      theme_color_light='#50fae9'
      ;;
    -Grey)
      theme_color_dark='#3c3f51'
      theme_color_light='#d9dae3'
      ;;
    esac
  fi

  if [[ $scheme == '-Gruvbox' ]]; then
    case "$theme" in
    '')
      theme_color_dark='#458588'
      theme_color_light='#83a598'
      ;;
    -Purple)
      theme_color_dark='#ab62b1'
      theme_color_light='#d386cd'
      ;;
    -Pink)
      theme_color_dark='#b16286'
      theme_color_light='#d3869b'
      ;;
    -Red)
      theme_color_dark='#cc241d'
      theme_color_light='#fb4934'
      ;;
    -Orange)
      theme_color_dark='#d65d0e'
      theme_color_light='#fe8019'
      ;;
    -Yellow)
      theme_color_dark='#d79921'
      theme_color_light='#fabd2f'
      ;;
    -Green)
      theme_color_dark='#98971a'
      theme_color_light='#b8bb26'
      ;;
    -Teal)
      theme_color_dark='#689d6a'
      theme_color_light='#8ec07c'
      ;;
    -Grey)
      theme_color_dark='#3c3836'
      theme_color_light='#a89984'
      ;;
    esac
  fi

  if [[ $scheme == '-Everforest' ]]; then
    case "$theme" in
    '')
      theme_color_dark='#458588'
      theme_color_light='#83a598'
      ;;
    -Purple)
      theme_color_dark='#ab62b1'
      theme_color_light='#d386cd'
      ;;
    -Pink)
      theme_color_dark='#b16286'
      theme_color_light='#d3869b'
      ;;
    -Red)
      theme_color_dark='#cc241d'
      theme_color_light='#fb4934'
      ;;
    -Orange)
      theme_color_dark='#d65d0e'
      theme_color_light='#fe8019'
      ;;
    -Yellow)
      theme_color_dark='#d79921'
      theme_color_light='#fabd2f'
      ;;
    -Green)
      theme_color_dark='#98971a'
      theme_color_light='#b8bb26'
      ;;
    -Teal)
      theme_color_dark='#689d6a'
      theme_color_light='#8ec07c'
      ;;
    -Grey)
      theme_color_dark='#3c3836'
      theme_color_light='#a89984'
      ;;
    esac
  fi

  if [[ $blackness == 'true' ]]; then
    case "$scheme" in
    '')
      background_light='#FFFFFF'
      background_dark='#0F0F0F'
      background_dark_alt='#121212'
      titlebar_light='#F2F2F2'
      titlebar_dark='#030303'
      ;;
    -Nord)
      background_light='#f8fafc'
      background_dark='#0d0e11'
      background_dark_alt='#0f1115'
      titlebar_light='#f0f1f4'
      titlebar_dark='#020203'
      ;;
    -Dracula)
      background_light='#f9f9fb'
      background_dark='#0d0d11'
      background_dark_alt='#0f1015'
      titlebar_light='#f0f1f4'
      titlebar_dark='#020203'
      ;;
    -Gruvbox)
      background_light='#f9f5d7'
      background_dark='#0f0e0e'
      background_dark_alt='#121110'
      titlebar_light='#fbf1c7'
      titlebar_dark='#0d0907'
      ;;
    -Everforest)
      background_light='#fffbef'
      background_dark='#1e2326'
      background_dark_alt='#232a2e'
      titlebar_light='#f2efdf'
      titlebar_dark='#020203'
      ;;
    esac
  else
    case "$scheme" in
    '')
      background_light='#ffffff'
      background_dark='#2c2c2c'
      background_dark_alt='#3c3c3c'
      titlebar_light='#f2f2f2'
      titlebar_dark='#242424'
      ;;
    -Nord)
      background_light='#f8fafc'
      background_dark='#242932'
      background_dark_alt='#333a47'
      titlebar_light='#f0f1f4'
      titlebar_dark='#1e222a'
      ;;
    -Dracula)
      background_light='#f9f9fb'
      background_dark='#242632'
      background_dark_alt='#343746'
      titlebar_light='#f0f1f4'
      titlebar_dark='#1f2029'
      ;;
    -Gruvbox)
      background_light='#f9f5d7'
      background_dark='#282524'
      background_dark_alt='#3c3836'
      titlebar_light='#fbf1c7'
      titlebar_dark='#242220'
      ;;
    -Everforest)
      background_light='#fffbef'
      background_dark='#232A2E'
      background_dark_alt='#343F44'
      background_light='#edeada'
      background_dark='#1e2326'
      ;;
    esac
  fi

  mkdir -p "${THEME_DIR}/cinnamon/assets"
  cp -r "${SRC_DIR}/assets/cinnamon/theme/"*'.svg' "${THEME_DIR}/cinnamon/assets"
  cp -r "${SRC_DIR}/assets/cinnamon/thumbnail${color}.svg" "${THEME_DIR}/cinnamon/thumbnail.png"

  mkdir -p "${THEME_DIR}/gnome-shell/assets"
  cp -r "${SRC_DIR}/assets/gnome-shell/theme/"*'.svg' "${THEME_DIR}/gnome-shell/assets"

  cp -r "${SRC_DIR}/assets/gtk/assets" "${THEME_DIR}/gtk-3.0"
  cp -r "${SRC_DIR}/assets/gtk/assets" "${THEME_DIR}/gtk-4.0"
  cp -r "${SRC_DIR}/assets/gtk/thumbnail${ELSE_DARK:-}.svg" "${THEME_DIR}/gtk-3.0/thumbnail.png"
  cp -r "${SRC_DIR}/assets/gtk/thumbnail${ELSE_DARK:-}.svg" "${THEME_DIR}/gtk-4.0/thumbnail.png"

  sed -i "s/#5b9bf8/${theme_color_light}/g" "${THEME_DIR}/cinnamon/assets/"*'.svg'
  sed -i "s/#3c84f7/${theme_color_dark}/g" "${THEME_DIR}/cinnamon/assets/"*'.svg'

  sed -i "s/#5b9bf8/${theme_color_light}/g" "${THEME_DIR}/gnome-shell/assets/"*'.svg'
  sed -i "s/#3c84f7/${theme_color_dark}/g" "${THEME_DIR}/gnome-shell/assets/"*'.svg'

  sed -i "s/#5b9bf8/${theme_color_light}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/assets/*'.svg'
  sed -i "s/#3c84f7/${theme_color_dark}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/assets/*'.svg'
  sed -i "s/#ffffff/${background_light}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/assets/*'.svg'
  sed -i "s/#2c2c2c/${background_dark}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/assets/*'.svg'
  sed -i "s/#3c3c3c/${background_dark_alt}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/assets/*'.svg'

  if [[ ${color} == '-Dark' ]]; then
    sed -i "s/#2c2c2c/${background_dark}/g" "${THEME_DIR}/cinnamon/thumbnail.png"
    sed -i "s/#5b9bf8/${theme_color_light}/g" "${THEME_DIR}/cinnamon/thumbnail.png"
    sed -i "s/#2c2c2c/${background_dark}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/thumbnail.png
    sed -i "s/#5b9bf8/${theme_color_light}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/thumbnail.png
  else
    sed -i "s/#ffffff/${background_light}/g" "${THEME_DIR}/cinnamon/thumbnail.png"
    sed -i "s/#f2f2f2/${titlebar_light}/g" "${THEME_DIR}/cinnamon/thumbnail.png"
    sed -i "s/#3c84f7/${theme_color_dark}/g" "${THEME_DIR}/cinnamon/thumbnail.png"
    sed -i "s/#f2f2f2/${titlebar_light}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/thumbnail.png
    sed -i "s/#3c84f7/${theme_color_dark}/g" "${THEME_DIR}/"{gtk-3.0,gtk-4.0}/thumbnail.png
  fi

  cp -r "${SRC_DIR}/assets/cinnamon/common-assets/"*'.svg' "${THEME_DIR}/cinnamon/assets"
  cp -r "${SRC_DIR}/assets/cinnamon/assets${ELSE_DARK:-}/"*'.svg' "${THEME_DIR}/cinnamon/assets"

  cp -r "${SRC_DIR}/assets/gnome-shell/common-assets/"*'.svg' "${THEME_DIR}/gnome-shell/assets"
  cp -r "${SRC_DIR}/assets/gnome-shell/assets${ELSE_DARK:-}/"*'.svg' "${THEME_DIR}/gnome-shell/assets"

  cp -r "${SRC_DIR}/assets/gtk/symbolics/"*'.svg' "${THEME_DIR}/gtk-3.0/assets"
  cp -r "${SRC_DIR}/assets/gtk/symbolics/"*'.svg' "${THEME_DIR}/gtk-4.0/assets"

  cp -r "${SRC_DIR}/assets/gtk-2.0/assets-common${ELSE_DARK:-}" "${THEME_DIR}/gtk-2.0/assets"
  cp -r "${SRC_DIR}/assets/gtk-2.0/assets${theme}${ELSE_DARK:-}${scheme}/"*"png" "${THEME_DIR}/gtk-2.0/assets"

  cp -r "${SRC_DIR}/assets/metacity-1/assets${window}" "${THEME_DIR}/metacity-1/assets"
  cp -r "${SRC_DIR}/assets/metacity-1/thumbnail${ELSE_DARK:-}.png" "${THEME_DIR}/metacity-1/thumbnail.png"

  cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${scheme}${window}/"*.png "${THEME_DIR}/xfwm4"
  cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${scheme}${window}-hdpi/"*.png "${THEME_DIR}-hdpi/xfwm4"
  cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${scheme}${window}-xhdpi/"*.png "${THEME_DIR}-xhdpi/xfwm4"
}
