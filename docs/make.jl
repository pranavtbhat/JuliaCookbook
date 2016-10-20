using Documenter

makedocs()

deploydocs(
   #options
   deps = Deps.pip("pygments", "mkdocs", "python-markdown-math", "mkdocs"),
   repo = "github.com/pranavtbhat/JuliaCookbook.git",
   julia = "0.5"
)
