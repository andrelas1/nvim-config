return {
  filetypes = { "haskell", "lhaskell", "cabal" },
  haskell = {
    cabalFormattingProvider = "cabalfmt",
    formattingProvider = "ormolu",
  },
}
