using Documenter

makedocs()

deploydocs(
   #options
   deps = Deps.pip("pygments", "mkdocs", "python-markdown-math", "mkdocs-cinder"),
   repo = "github.com/pranavtbhat/JuliaCookbook.git",
   julia = "0.5"
)
