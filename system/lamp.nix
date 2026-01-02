{ config, lib, pkgs, ... }:
{
  services = {

    # # Apache - MariaDB - PHP (LAMP)

    # # Apache
    # httpd = {
    #   enable = true;
    #   adminAddr = "admin@example.com";
    #   virtualHosts."localhost" = {
    #     documentRoot = "/var/www/";
    #     # enablePHP = true;
    #   };
    # };


    # MariaDB
    # Enable Sql
    # use mysql_secure_installation to complete installationn
    mysql = {
      enable = true;
      package = pkgs.mariadb;
      #ensureUsers = [
      #  {
      #    name = "root";
      #    password = "6969";  # Change this
      #  }
      #  {
      #    name = "nissi";
      #    password = "6969";
      #  }
      #];
  
      ensureDatabases = [ ];  # You can optionally define initial DBs here
  
      initialScript = pkgs.writeText "mysql-init.sql" ''
        -- Remove anonymous users
        DELETE FROM mysql.user WHERE User = "";
  
        -- Disallow root login remotely
        UPDATE mysql.user SET Host = 'localhost' WHERE User = 'root';
  
        -- Remove test database
        DROP DATABASE IF EXISTS test;
  
        -- Grant root full privileges on everything
        GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

        -- Reload privilege tables
        FLUSH PRIVILEGES;
      '';
    };

    # # PHP for apache
    # phpfpm.pools.apache = {
    #   user = "wwwrun";
    #   group = "wwwrun";
    # };

  };
}
