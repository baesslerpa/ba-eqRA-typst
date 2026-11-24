#import "/lib/helpers.typ": *
#import "/lib/theorems.typ": *

= Praxis
- Nachdem wir nun das Problem aus theoretischer Sicht betrachtet haben, Praxis
- Vorheriger Teil hat gezeigt das wir im schlimmsten Fall exponentielle Laufzeiten haben
  - harte Schranke für alle Algorithmen
- Brozowski-Ableitungen
  - Bisher haben wir nur betrachtet wie man Gleichheit zwischen zwei Ausdrücken zeigen kann, aber nicht wie man Algorithmisch auswerten kann ob ein Wort von einem Ausdruck erkannt wird
  - Ableitungen sind hier ein einfacher weg
    - Liste der Ableitungsregeln
      - meiste Regeln sind einfach zu verstehen auf die Plus regeln etwas mehr eingehen
    - $epsilon(r)$ Funktion
    - Bsp. auf einfachen RA angewendet
  - Verbindung zu Myhill-Nerode\
    Ableitung: $D_a(L) = { w | a w in L }$\
    MN-Relation: $u =_L v <=> forall w : (u w in L <=> v w in L)$\
    daher: $u =_L v <=>D_u(L) = D_v(L)$
  - Endlichkeits-Satz mod ACI
    - TH 4.3 aus Brozowski
    - Folgerung: mein Suchbaum muss höchsten $d_R-1$ tief gehen damit ich alles zustände gefunden haben
  - Ableitungsautomat
    - Man kann onthefly einen Automaten erzeugen wenn man die Ableitungen nimmt und spart sich eine Umwandlung
    - ergibt einen DEA
      - Zustände sind die Ableitungen
      - für jeden Zustand und Zeichen gibt es genau einen Folgezustand, also vollständig und determ.
    - brauchen aber Vereinfachungs-Regeln, sonst kann Automat unendlich groß werden
- Hoppcroft-Karp Algorithmus
  - ist zunächst ein exakter Test und meistens sehr schnell
  - Ablauf des Algorithmus
    - zunächst der baisc algo
      - initiale Annahme
      - Union-Find Algo
    - dann mit der Verbesserung
      - early return und mit Ableitungen
    - Anpassung für unsere App
      - zeuge mit ausgeben
- Heuristiken
  - obwohl exakter Algorithmus existiert kann er expo. Laufzeit haben. was in der Praxis schlecht sein kann
  - untersuchen im folgenden versch. Heuristiken
  - vorstellungen der einfachen Heur.
  - WP-Algorithmus zum finden einer testwortmenge
  - Kombination von Heuristik und HK
- Evaluation
  - Testpaar menge 
    - wie wurde die synthetisiert
    - auswertung der Methoden
      - treffer
      - laufzeit auf meinem rechner
- Implementierung der WebApp
  - Anforderungen
  - Technologie
    - Typescript / React
  - ...
  
