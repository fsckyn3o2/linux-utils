
function _z_podman-mongo() {
  podman run --name local-mongo -p 127.0.0.1:27017:27017 --net=host -d mongo
  podman ps
}

function _z_podman-mariadb() {
  podman run --name local-mariadb -p 127.0.0.1:3306:3306 -e MYSQL_ROOT_PASSWORD=admin -d mariadb
  podman ps
}

function _z_podmand_postgres() {
  podman run --name local-postgres -p 127.0.0.1:5432:5432 -e POSTGRES_PASSWORD=admin -e POSTGRES_USER=admin -d postgres 
  podman ps
}

function _z_extract-pubkey(){
 ssh-keygen -y -f $1
}

alias terraform='/srv/Applications/terraform/terraform'

function _z_clion_debug() {
  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
}

function _z_bluetooth_restart() {
  echo "kill bluetoothd"
  sudo killall bluetoothd
  echo "wait 5 sec."
  sleep 5
  echo "restart bluetooth"
  sudo systemctl start bluetooth
}

function _z_mouse_reset() {
  killall xbindkeys
  sh mouse-detect-and-config.sh
}

function _z_dpi() {
  case "$1" in
    "96" | "125" | "150")
      xfconf-query -c xsettings -p /Xft/DPI -s $1
      ;;
    *)
      echo "Option is DPI value [96,125,150]"
      echo "";;
  esac
}

alias _z_qt-app-hdpi="sh /srv/Applications/my_scripts/qt-apps/hdpi.sh"


