import Lake
open Lake DSL

package «melp» {
  -- add package configuration options here
}

lean_lib «Melp» {
  -- add library configuration options here
}

require socket from git "https://github.com/xubaiw/lean4-socket.git"
require lina from git "https://github.com/algebraic-sofia/lina"