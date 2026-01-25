{ lib, config, ... }:
let
  # Секреты лежат в hosts/<host>/sing-box-secrets.nix
  # Файл должен возвращать attrset:
  # { server = "..."; server_port = ...; method = "..."; password = "..."; }
  cfg = config.my.singbox;
  secrets = cfg.secretsSingBox;
in
{
  services.sing-box.enable = true;

  services.sing-box.settings = {
    inbounds = [
      {
        type = "socks";
        tag = "socks-in";
        listen = "127.0.0.1";
        listen_port = 1080;
      }
    ];

    outbounds = [
      {
        type = "shadowsocks";
        tag = "ss-out";

        server = secrets.server;
        server_port = secrets.server_port;

        method = secrets.method;
        password = secrets.password;
      }
    ];

    route = {
      rules = [
        { inbound = "socks-in"; outbound = "ss-out"; }
      ];
    };
  };
}
