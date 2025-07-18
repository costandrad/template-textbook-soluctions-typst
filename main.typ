#import "styles.typ": *

#show: template.with(
  book: (
    title: [Título do Livro],
    author: (
      long: [Nome Sobrenome],
      short: [Sobrenome, N.]
    )
  ),
  author: [Igo da Costa Andrade]
)

= Introdução

#lorem(20)

#lorem(40)

#lorem(30)

#lorem(20)

#pagebreak()

= Capítulo Segundo

#lorem(20)

#lorem(40)

#lorem(30)

#lorem(20)