{ mkDerivation, base, mtl, parsec, stdenv, text, classy-prelude }:
mkDerivation {
  pname = "text-render";
  version = "0.1.0.2";
  src = ./.;
  buildDepends = [ base mtl parsec text classy-prelude ];
  homepage = "http://github.com/thinkpad20/text-render";
  description = "A type class for rendering objects as text, pretty-printing, etc";
  license = stdenv.lib.licenses.mit;
}
