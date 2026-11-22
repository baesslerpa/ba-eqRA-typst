#import "lib/thesis.typ": thesis
#show: thesis.with(title: [Testen der Äquivalenz Regulärer Ausdrücke in Theorie und Praxis])

// Einzelnes Kapitel bauen: typst compile main.typ out.pdf --input kapitel=03-beweis
#let kapitel = ("01-einleitung", "02-grundlagen", "03-beweis")
#let nur = sys.inputs.at("kapitel", default: none)

#for (i, k) in kapitel.enumerate() {
  if nur == none or nur == k {
    if nur != none { counter(heading).update(i) }
    include "kapitel/" + k + ".typ"
  }
}