#import "@preview/cetz:0.4.2": canvas, draw, tree
#import "@preview/diagraph:0.3.6"
#import "@preview/lovelace:0.3.0": *

#let accent = rgb(0,108,108)

#let todo(message) = box(fill: red,inset: 10pt, message)

#let hBox(title, c) = block(
  [
    #block(width: 100%, sticky: true, inset: 0em, stroke: accent.lighten(50%), spacing: 0pt )
    #block(
      text(title, size: 9pt, font: "Source Sans Pro"),
      sticky: true,
      fill: accent.lighten(50%),
      radius: 1pt,
      inset: 0.5em
    )
    #block(c, inset: (top: 0em, bottom: 0em, rest: 1em)) //body
    #box(width: 100%, stroke: accent.lighten(50%))
  ],

  stroke: (
    left: accent.lighten(50%),
    right: accent.lighten(50%),
    rest: none
  ),
  width: 100%,
  breakable: true
)

#let c2(a,b) = grid(
  columns: (5fr, 1fr),
  gutter: 10pt,
  a,align(right + bottom , b)
)

#let margin-note(body) = {
  place(
    right,
    dx: 15%,  // Verschiebt die Notiz nach links
    block(
      width: 20%,
      text(size: 1em, body)
    )
  )
}

#let stick-together(a, b, threshold: 3em) = {
  block(a + v(threshold), breakable: false)
  v(-1 * threshold)
  b
}