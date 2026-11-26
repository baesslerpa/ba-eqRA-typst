#import "/lib/helpers.typ": *
#import "/lib/theorems.typ": *

= Grundlagen und Notation

In diesem Kapitel werden wir kurz die für das Verständnis notwendigen Grundlagen wiederholen; eine Kenntnis der Inhalte wird vorausgesetzt. Die verwendete Notation orientiert sich am Lehrbuch "Grundlagen der Theoretischen Informatik" @schulz_grundlagen_2022.


#definition(name: "Deterministischer Endlicher Automat")[
  Wir definieren einen *DEA* durch ein Tupel $(Q, Sigma, delta, q_0, F)$ wobei
  - $Q$ eine endliche, nicht-leere Menge der Zustände $q_0, ..., q_n$, 
  - $Sigma$ ein endliches Alphabet, 
  - $delta: Q times Sigma -> Q$ die Übergangsfunktion,
  - $q_0$ der Startzustand,
  - $F subset.eq Q$, die Menge der akzeptierenden Zustände ist

  Ein Wort $w in Sigma^*$ wird von $A$ akzeptiert, wenn der Lauf von $A$ auf $w$ in einem Zustand aus $F$ endet @schulz_grundlagen_2022[S. 30]
]<def-DEA>

Die Menge der von einem DEA $A$ erkannten Wörter bildet die Sprache des Automaten $L(A)$.
Wir nennen alle von einem DEA erkennbaren Sprachen die Menge der *regulären Sprachen*. 

#definition(name: "Nichtdeterministischer Endlicher Automat")[
  Wir definieren einen *NEA* durch ein Tupel $(Q, Sigma, delta, q_0, F)$ wobei
  - $Q$ eine endliche, nicht-leere Menge der Zustände $q_0, ..., q_n$, 
  - $Sigma$ ein endliches Alphabet, 
  - $delta: Q times (Sigma union {epsilon})-> scr(P)(Q)$ die Übergangsfunktion,
  - $q_0$ der Startzustand,
  - $F subset.eq Q$, die Menge der akzeptierenden Zustände ist

Ein Wort $w$ wird von $A$ akzeptiert, wenn _es einen_ Lauf von $A$ auf $w$ gibt, der in einem Zustand aus $F$ endet @schulz_grundlagen_2022[S. 35] 
]<def-NEA>

Damit ist jeder DEA kann auch als NEA aufgefasst werden. Umgekehrt lässt sich jeder NEA mit $n$ Zuständen über die Potenzmengenkonstruktion in einen äquivalenten DEA umwandeln, der jedoch bis zu $2^n$ Zustände haben kann @schulz_grundlagen_2022[S. 38].

Zu einer regulären Sprache gibt es im Allgemeinen viele DEA, die sie erkennen. Unter diesen ist der _minimale_ DEA, also der mit den wenigsten Zuständen, jedoch bis auf Umbenennung der Zustände eindeutig. Seine Zustände entsprechen genau den Äquivalenzklassen der Myhill-Nerode-Relation von $L$ @schulz_grundlagen_2022[S. 48-49]. Für NEA gilt dies nicht: Minimale NEA sind im Allgemeinen nicht eindeutig.

#definition(name: "Myhill-Nerode-Relation")[
  Für eine Sprache $L$ über dem Alphabet $Sigma$ und zwei Wörtern $u,v in Sigma^*$ definieren wir die Relation $eqL$:

  $ u eqL v <=> forall w in Sigma^*: (u w in L <=> v w in L) $
]<def-MN>


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