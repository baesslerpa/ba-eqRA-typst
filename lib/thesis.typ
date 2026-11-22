#import "template.typ": ams-article
#import "helpers.typ": accent
#import "theorems.typ": thm-rules, thm-selector

// Alle globalen Set- und Show-Regeln der Arbeit.
#let thesis(title: none, body) = {
  set math.equation(numbering: "(1)")
  set text(lang: "de")
  show heading: set text(accent, font: "Source Sans Pro")
  set page(paper: "a4")
  show: ams-article.with(
    title: title,
    authors: (
      (
        name: "Patrick Bässler",
        department: [Fakultät für Mathematik und Informatik],
        organization: [Fernuniversität Hagen],
        location: [Seminar 01926 – "Datenstrukturen"],
        email: "baesslerpa@gmail.com",
      ),
    ),
    paper-size: "a4",
    bibliography: bibliography("../refs.bib"),
  )

  show figure.caption: set text(size: 0.9em)
  set par(spacing: 1.5em)
  show: thm-rules
  show thm-selector("thm-group"): it => box(
    it,
    fill: accent.lighten(90%),
    radius: 2pt,
    inset: 1em
  )
  set bibliography(style: "ieee")

  body
}