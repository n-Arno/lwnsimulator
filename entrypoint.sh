#!/sbin/tini /bin/ash

if [ -z "$1" ]
  then
    echo "ENTRYPOINT - Starting with default config"
    /opt/lwnsim/lwnsimulator
  else
    echo "ENTRYPOINT - Switching gateway bridge to $1"
    sed -i "s/localhost/$1/g" /opt/lwnsim/simulator.json
    /opt/lwnsim/lwnsimulator
fi

