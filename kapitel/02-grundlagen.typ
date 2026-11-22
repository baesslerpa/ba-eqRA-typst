#import "/lib/helpers.typ": *
#import "/lib/theorems.typ": *

= Grundlagen
Durch Reguläre Ausdrücke lassen sich Reguläre Sprachen kompakt durch ein Wort, statt durch einen Automaten, beschreiben.
#definition(name: [Reguläre Ausdrücke (RA)])[
  Sei $Sigma$ ein Alphabet mit
  $Sigma inter {\(, \), +, dot, *, emptyset, epsilon} = emptyset$.
  Die Menge der _regulären Ausdrücke_ über $Sigma$ ist die kleinste Menge
  von Wörtern über $Sigma union {\(, \), +, dot, *, emptyset, epsilon}$,
  für die gilt:
  + $emptyset$ und $epsilon$ sind reguläre Ausdrücke.
  + Jedes $a in Sigma$ ist ein regulärer Ausdruck.
  + Sind $S$ und $T$ reguläre Ausdrücke, so sind auch
    $(S + T)$, $(S dot T)$ und $(S)^*$ reguläre Ausdrücke.
]

#todo("präzendenz regeln, klammer regeln, vereinfachungen aci")