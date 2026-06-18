{ lib, ... }:

with lib;

{
  options.secrets = {
    githubToken = mkOption {
      type = types.str;
      default = "OVERRIDE_ME";
      description = "GitHub personal access token";
    };
    ngrokToken = mkOption {
      type = types.str;
      default = "OVERRIDE_ME";
      description = "Ngrok authentication token";
    };
    openaiApiKey = mkOption {
      type = types.str;
      default = "OVERRIDE_ME";
      description = "OpenAI API key";
    };
  };
}