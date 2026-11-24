#import "/lib/helpers.typ": *
#import "/lib/theorems.typ": *

= Grundlagen und Notation

- Kurzer Einstieg
  - Setzen Inhalte des Grundlagenkurses voraus @schulz_grundlagen_2022
    - DEA, NEA, Potenzmengenkonstruktion, Satz von Kleene, Myhill-Nerode,
      minimaler DEA, TM/NTM, Polynomialzeit-Reduktion
  - Hier nur: verwendete Notation + was über den Kurs hinausgeht

- Myhill-Nerode Klassen
  - Folgerung: Minimaler DEA ist eindeutig.

== Reguläre Ausdrücke
- Definition (Syntax) – vorhandene Definition behalten
- Semantik $L(r)$ in einer Zeile
   - L(r): L(∅) = ∅, L(ε) = {ε}, L(a) = {a}, L(S+T) = L(S) ∪ L(T)
- Konventionen
  - Präzedenz: $*$ vor $dot$ vor $+$, Punkt und Klammern weglassen
  - Abkürzungen: $r^n$, $r^+$ (hochgestellt, wegen $+$ als Vereinigung),
    $Delta without {a}$ bzw. $Sigma$ als Kurzform für $a_1 + dots + a_k$
- Größe $|r|$ (Anzahl Symbole) – wird für Laufzeit-/Platzaussagen gebraucht
- EQUIV formal: ${(s, t) | L(s) = L(t)}$
- Verweise (nur Satz + Zitat, kein Beweis)
  - RA → ε-NEA mit $O(|r|)$ Zuständen
  - NEA → DEA: bis zu $2^n$ Zustände
  
== Platzkomplexität
// Nur ausführlich, falls nicht im Grundlagenkurs – sonst ein Absatz mit Verweisen
- Platzbedarf einer (N)TM: benutzte Bandzellen, bei NTM Maximum über alle Pfade
- DSPACE, NSPACE, PSPACE, NPSPACE
  - PSPACE
  - Was ist das
    - Wichtigstes Modell neben Laufzeit
- Einordnung: P ⊆ NP ⊆ PSPACE
  - anders als bei Zeit ist NP = P Problem hier schon gelöst
- Satz von Savitch: $"NSPACE"(f) subset.eq "DSPACE"(f^2)$ ⇒ NPSPACE = PSPACE
- Abschluss unter Komplement (trivial, da deterministisch)
- PSPACE-schwer / PSPACE-vollständig über $<=_p$
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