{ pkgs, ... }:
{
  systemd.user.services.gammastep = {
    Unit = {
      Description = "Adjust display temperature based on time-of-day.";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "${pkgs.writeShellScript "gammastep-start" ''
        #!/run/current-system/sw/bin/bash
        ${pkgs.gammastep}/bin/gammastep -vv -l 59.19:18.4 -t "6500:2500"
      ''}";
    };
  };
}
