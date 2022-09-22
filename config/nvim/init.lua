local load = function(mod)
  package.loaded[mod] = nil
    require(mod)
  end

-- user modules
load("cj.settings")
load("cj.keymaps")
load("cj.plugins")

