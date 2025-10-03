{ config, ... }:

{

  systemd.user.services.update-user-flatpaks = {
    enable = true;
    wantedBy = [ "default.target" ];
    description = "Flatpak Update";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''/usr/bin/flatpak update --assumeyes --noninteractive'';
    };
  };

  
  systemd.user.timers.update-user-flatpaks = {
    wantedBy = ["timers.target"];
    description = "Flatpak Auto Update";
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

}
