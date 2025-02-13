 Brief aside: **What is LSP?**

 LSP is an initialism you've probably heard, but might not understand what it is.

 LSP stands for Language Server Protocol. It's a protocol that helps editors
 and language tooling communicate in a standardized fashion.

 In general, you have a "server" which is some tool built to understand a particular
 language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
 (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
 processes that communicate with some "client" - in this case, Neovim!

 LSP provides Neovim with features like:
  - Go to definition
  - Find references
  - Autocompletion
  - Symbol Search
  - and more!

 Thus, Language Servers are external tools that must be installed separately from
 Neovim. This is where `mason` and related plugins come into play.

 If you're wondering about lsp vs treesitter, you can check out the wonderfully
 and elegantly composed help section, `:help lsp-vs-treesitter`

  This function gets run when an LSP attaches to a particular buffer.
    That is to say, every time a new file is opened that is associated with
    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    function will be executed to configure the current buffer

