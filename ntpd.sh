#! bin/shell/
#this script checks that if ntpd is installed and running. If not it installs and starts the service.

if ! rpm -qa | grep -qw ntp; then
    yum install ntp
fi

# start the service if not running
if ps aux | grep -v grep | grep "[n]tpd" > /dev/null
then
  echo "ntpd is running." > /dev/null
  else
    systemctl start ntpd > /dev/null
    echo " started NTP."
    fi
    # make sure ntpd is enabled at boot
    systemctl enable ntp
