#import "/lib/helpers.typ": *
#import "/lib/theorems.typ": *

= Grundlagen

- Vorstellung wichtiger Grundlagen, es werden nicht alle Grundlagenthemen vorgestellt
  - Gehen davon aus das Basics bekannt sind und verweisen ggf. auf andere Stelle
- Definition von DEA und NEA
  - Formal
  - Wann akzeptiert welcher
  - Umwandlung von NEA in DEA
    - hat im Worst-Case $O(2^n)$ Laufzeit
- Myhill-Nerode Klassen
- Reguläre Ausdrücke
  - Hier verwendete Konventionen und Definition
  - Abkürzungen die evtl. verwendet werden "+, $ a^2, Delta - a$"
- TM und NTM
  - Welche Akzeptiert wann
  - Nichtdeterminismus erklären
- PSPACE
  - Was ist das
    - Wichtigstes Modell neben Laufzeit
  - Wie messen wir es
    - Benutze Zellen bei TM 
    - maximale Anzahl der benutzten Zellen bei NTM
  - Zusammenhang der Platzklassen
    - anders als bei Zeit ist NP = P Problem hier schon gelöst
    - Savitch
      - NSPACE($f(n)$) $subset.eq$ PSPACE($f(n)^2$)
      - und daraus folgt NSPACE = PSPACE
    - Satz von Immermann
      - NSPACE($f(n)$) = co-NSPACE($f(n)$)
  - Vollständigkeit
    - Ein Problem das selbst in PSPACE liegt und PSPACE-schwer ist ist Vollständig. 
      - untere und obere Schranke

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