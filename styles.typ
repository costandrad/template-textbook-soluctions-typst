#let primary-color = rgb("#096164")

#let mkcover(book-title, book-author, author, primary-color) = [
  #set page(margin:20pt, fill: white)
  #set text(size: 24pt, font: "Arial", weight: "bold", fill: black)
  #set align(center)
  #place(
    bottom+right,
    dx: 25pt, dy: 60pt,
    float: false,
  )[#image("assets/images/cover.svg", width: 110%)]
  #table(
    columns: (auto, 1fr),
    inset: 0pt, stroke: none, 
    align: (left+horizon, right+horizon),
    table.header(
      [#image("assets/images/logo.svg", width: 2.5cm)],
      [#author]
    )
  )

  #upper[
    #text(size: 16pt, weight: 500)[Resolução Comentada dos Exercícios de]\
    #text(size: 32pt, weight: 700, fill: primary-color)[#book-title]\
    #text(size: 16pt, weight: 500)[de]\
    #text(size: 24pt, weight: 700, fill: primary-color)[#book-author]
  ]
]

#let mkcontents() = [
  #show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }

  #outline(indent: auto)

  #pagebreak()
]

#let template(
  book: (
    title: none,
    author: (
      long: none,
      short: none
    )
  ),
  author: none,
  frontpage-input: none,
  body
) = {
  set page(
    paper: "a4",
    margin: (
      top: 3cm, bottom: 2cm, left: 2cm, right: 2cm
    ),
  )

  set text(
    font: "Arial", size: 12pt, lang: "pt", hyphenate: false
  )

  set par(
    first-line-indent: (
      all: true, amount: 1.25cm
    ),
    justify: true
  )

  set heading(numbering: "1.1.")

  mkcover(book.title, book.author.long, author, primary-color)

  counter(page).update(1)

  mkcontents()
  pagebreak()

  set page(
    header: context {
      let current-page = counter(page).get().at(0)
      rect(width: 100%, stroke: (bottom: (thickness: 1pt, paint: primary-color)))[
        #if calc.even(current-page) [
          #counter(page).get().at(0)
          #h(1fr)
          #author
        ] else [
          Solucionário / *#book.title (#book.author.short)*
          #h(1fr)
          #counter(page).get().at(0)
        ]
      ]
    },
    footer: context {
      let current-page = counter(page).get().at(0)
      rect(width: 100%, stroke: (top: (thickness: 1pt, paint: primary-color)))[
        #if calc.even(current-page) {
          grid(
            columns: (auto, 1fr),
            align: (left+horizon, right+horizon),
            [#image("assets/images/logo.svg", width: 0.8cm)],
            [#link("https://costandrad.github.io/")[costandrad.github.io]]
          )
          
        } else {
          grid(
            columns: (auto, 1fr),
            align: (left+horizon, right+horizon),
            [#link("https://costandrad.github.io/")[costandrad.github.io]],
            [#image("assets/images/logo.svg", width: 0.8cm)],
          )
        } 
      ]
    }
  )

  set heading()
  
  body
}