{ mkDerivation, base, mtl, parsec, stdenv, text }:
mkDerivation {
  pname = "text-render";
  version = "0.1.0.0";
  src = ./.;
  buildDepends = [ base mtl parsec text ];
  homepage = "http://github.com/thinkpad20/text-render";
  description = "A type class for rendering objects as text, pretty-printing, etc";
  license = stdenv.lib.licenses.mit;
}
