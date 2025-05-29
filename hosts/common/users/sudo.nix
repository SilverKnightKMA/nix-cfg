{
  security.sudo.extraRules = [
    {
      users = [ "tungvt" ];
      commands = [
        { command = "ALL"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];
}