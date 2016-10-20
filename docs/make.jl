using Documenter

makedocs()

custom_deps() = run(`pip install --user pygments mkdocs mkdocs-material mkdocs-cinder`)

deploydocs(
   #options
   deps = custom_deps,
   repo = "github.com/pranavtbhat/JuliaCookbook.git",
   julia = "0.5"
)
