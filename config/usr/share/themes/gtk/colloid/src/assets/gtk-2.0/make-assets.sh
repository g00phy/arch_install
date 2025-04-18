#! /usr/bin/env bash
for theme in '' '-Purple' '-Pink' '-Red' '-Orange' '-Yellow' '-Green' '-Teal' '-Grey'; do
  for color in '' '-Dark'; do
    for type in '' '-Nord' '-Dracula' '-Gruvbox' '-Everforest'; do
      if [[ $color == '' ]]; then
        case "$theme" in
        '')
          theme_color='#3c84f7'
          ;;
        -Purple)
          theme_color='#AB47BC'
          ;;
        -Pink)
          theme_color='#EC407A'
          ;;
        -Red)
          theme_color='#E53935'
          ;;
        -Orange)
          theme_color='#F57C00'
          ;;
        -Yellow)
          theme_color='#FBC02D'
          ;;
        -Green)
          theme_color='#4CAF50'
          ;;
        -Teal)
          theme_color='#009688'
          ;;
        -Grey)
          theme_color='#464646'
          ;;
        esac

        if [[ $type == '-Nord' ]]; then
          background_color='#f8fafc'

          case "$theme" in
          '')
            theme_color='#5e81ac'
            ;;
          -Purple)
            theme_color='#b57daa'
            ;;
          -Pink)
            theme_color='#cd7092'
            ;;
          -Red)
            theme_color='#c35b65'
            ;;
          -Orange)
            theme_color='#d0846c'
            ;;
          -Yellow)
            theme_color='#e4b558'
            ;;
          -Green)
            theme_color='#82ac5d'
            ;;
          -Teal)
            theme_color='#83b9b8'
            ;;
          -Grey)
            theme_color='#3a4150'
            ;;
          esac
        fi

        if [[ $type == '-Dracula' ]]; then
          background_color='#f9f9fb'

          case "$theme" in
          '')
            theme_color='#a679ec'
            ;;
          -Purple)
            theme_color='#a679ec'
            ;;
          -Pink)
            theme_color='#f04cab'
            ;;
          -Red)
            theme_color='#f44d4d'
            ;;
          -Orange)
            theme_color='#f8a854'
            ;;
          -Yellow)
            theme_color='#e8f467'
            ;;
          -Green)
            theme_color='#4be772'
            ;;
          -Teal)
            theme_color='#20eed9'
            ;;
          -Grey)
            theme_color='#3c3f51'
            ;;
          esac
        fi

        if [[ $type == '-Gruvbox' ]]; then
          background_color='#fbf1c7'

          case "$theme" in
          '')
            theme_color='#458588'
            ;;
          -Purple)
            theme_color='#ab62b1'
            ;;
          -Pink)
            theme_color='#b16286'
            ;;
          -Red)
            theme_color='#cc241d'
            ;;
          -Orange)
            theme_color='#d65d0e'
            ;;
          -Yellow)
            theme_color='#d79921'
            ;;
          -Green)
            theme_color='#98971a'
            ;;
          -Teal)
            theme_color='#689d6a'
            ;;
          -Grey)
            theme_color='#3c3836'
            ;;
          esac
        fi

        if [[ $type == "-Everforest" ]]; then
          background_color='#fffbef'
          case "$theme" in
          '')
            theme_color='#A7C080'
            ;;
          -Purple)
            theme_color='#D699B6'
            ;;
          -Pink)
            theme_color='#d3869b'
            ;;
          -Red)
            theme_color='#E67E80'
            ;;
          -Orange)
            theme_color='#E69875'
            ;;
          -Yellow)
            theme_color='#DBBC7F'
            ;;
          -Green)
            theme_color='#A7C080'
            ;;
          -Teal)
            theme_color='#83C092'
            ;;
          -Grey)
            theme_color='#9DA9A0'
            ;;
          esac
        fi

      else
        case "$theme" in
        '')
          theme_color='#5b9bf8'
          ;;
        -Purple)
          theme_color='#BA68C8'
          ;;
        -Pink)
          theme_color='#F06292'
          ;;
        -Red)
          theme_color='#F44336'
          ;;
        -Orange)
          theme_color='#FB8C00'
          ;;
        -Yellow)
          theme_color='#FFD600'
          ;;
        -Green)
          theme_color='#66BB6A'
          ;;
        -Teal)
          theme_color='#4DB6AC'
          ;;
        -Grey)
          theme_color='#DDDDDD'
          ;;
        esac

        if [[ $type == '-Nord' ]]; then
          background_color='#242932'

          case "$theme" in
          '')
            theme_color='#89a3c2'
            ;;
          -Purple)
            theme_color='#c89dbf'
            ;;
          -Pink)
            theme_color='#dc98b1'
            ;;
          -Red)
            theme_color='#d4878f'
            ;;
          -Orange)
            theme_color='#dca493'
            ;;
          -Yellow)
            theme_color='#eac985'
            ;;
          -Green)
            theme_color='#a0c082'
            ;;
          -Teal)
            theme_color='#83b9b8'
            ;;
          -Grey)
            theme_color='#d9dce3'
            ;;
          esac
        fi

        if [[ $type == '-Dracula' ]]; then
          background_color='#242632'

          case "$theme" in
          '')
            theme_color='#bd93f9'
            ;;
          -Purple)
            theme_color='#bd93f9'
            ;;
          -Pink)
            theme_color='#ff79c6'
            ;;
          -Red)
            theme_color='#ff5555'
            ;;
          -Orange)
            theme_color='#ffb86c'
            ;;
          -Yellow)
            theme_color='#f1fa8c'
            ;;
          -Green)
            theme_color='#50fa7b'
            ;;
          -Teal)
            theme_color='#50fae9'
            ;;
          -Grey)
            theme_color='#d9dae3'
            ;;
          esac
        fi

        if [[ $type == '-Gruvbox' ]]; then
          background_color='#282524'

          case "$theme" in
          '')
            theme_color='#83a598'
            ;;
          -Purple)
            theme_color='#d386cd'
            ;;
          -Pink)
            theme_color='#d3869b'
            ;;
          -Red)
            theme_color='#fb4934'
            ;;
          -Orange)
            theme_color='#fe8019'
            ;;
          -Yellow)
            theme_color='#fabd2f'
            ;;
          -Green)
            theme_color='#b8bb26'
            ;;
          -Teal)
            theme_color='#8ec07c'
            ;;
          -Grey)
            theme_color='#a89984'
            ;;
          esac
        fi

        if [[ $type == '-Everforest' ]]; then
          background_color='#232A2E'

          case "$theme" in
          '')
            theme_color='#9cb575'
            ;;
          -Purple)
            theme_color='#cb8eab'
            ;;
          -Pink)
            theme_color='#b16286'
            ;;
          -Red)
            theme_color='#db7375'
            ;;
          -Orange)
            theme_color='#db8d6a'
            ;;
          -Yellow)
            theme_color='#d0b174'
            ;;
          -Green)
            theme_color='#9cb575'
            ;;
          -Teal)
            theme_color='#78b587'
            ;;
          -Grey)
            theme_color='#7A8478'
            ;;
          esac
        fi
      fi

      if [[ $type != '' ]]; then
        cp -r "assets${color}.svg" "assets${theme}${color}${type}.svg"
        if [[ $color == '' ]]; then
          sed -i "s/#3c84f7/${theme_color}/g" "assets${theme}${color}${type}.svg"
        else
          sed -i "s/#5b9bf8/${theme_color}/g" "assets${theme}${color}${type}.svg"
        fi
      elif [[ $theme != '' ]]; then
        cp -r "assets${color}.svg" "assets${theme}${color}.svg"
        if [[ $color == '' ]]; then
          sed -i "s/#3c84f7/${theme_color}/g" "assets${theme}${color}.svg"
        else
          sed -i "s/#5b9bf8/${theme_color}/g" "assets${theme}${color}.svg"
        fi
      fi

    done
  done
done

echo -e "DONE!"
