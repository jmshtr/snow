{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    openssl # Secure Sockets Layer and Transport Layer Security toolkit
  ];
}
