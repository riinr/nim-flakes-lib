{lib, ...}:
{
  nimcfg."/nim.cfg".HEADER   = "# HEADER";
  nimcfg."/nim.cfg".FOOTER   = "# FOOTER";
  nimcfg."/nim.cfg".app      = "console";
  nimcfg."/nim.cfg".docCmd   = "myCmd from space";
  nimcfg."/nim.cfg".asm      = true;
  nimcfg."/nim.cfg".errorMax = 5;
  nimcfg."/nim.cfg".index    = false;
  nimcfg."/nim.cfg".define.A = true;
  nimcfg."/nim.cfg".define.B = false;
  nimcfg."/nim.cfg".define.C = "GO";
  nimcfg."/nim.cfg".NimblePath.A = true;
  nimcfg."/nim.cfg".NimblePath.B = false;
  # nimcfg."/nim.cfg".NimblePath.B = lib.mkForce true;
}
