package = "randbytes"
version = "scm-1"
description = {
   summary = "Get some random bytes already.",
   detailed = [[
      This is a tiny module for accessing random bytes.
      Requires a Unix-like platform - pulls bytes from
      /dev/random & /dev/urandom
   ]],
   homepage = "https://github.com/Okahyphen/randbytes",
   maintainer = "yo@oka.io",
   license = "MIT"
}
source = {
  url = "git://github.com/Okahyphen/randbytes"
}
build = {
  type = "builtin",
  modules = {
    randbytes = "src/randbytes.lua"
  }
}
dependencies = {
  "lua >= 5.1"
}
