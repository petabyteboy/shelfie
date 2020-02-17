{ stdenv, lib, fetchFromGitLab, rustPlatform }:

rustPlatform.buildRustPackage rec {
  name = "shelfie-${version}";
  version = "0.1.0";

  src = ./.;

  cargoSha256 = "0085z26g6j80nf0zbwqxnbcqyjhxzknvb5wy21fmrrmy4ldrp4fl";

  meta = with lib; {
    description = "A small space to upload pictures to";
    license = licenses.agpl3;
    maintainers = [ maintainers.spacekookie ];
    platforms = platforms.all;
  };
}
