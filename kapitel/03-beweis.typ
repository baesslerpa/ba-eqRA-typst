#import "/lib/helpers.typ": *
#import "/lib/theorems.typ": *


== Unterschied zu DFA

- Equivalenz von zwei DFA ist nicht in PSPACE
  - man kann gleichheit mit mehreren algorithmen zeigen
    - Produkt Automat
    - Beide minimieren und dann vergleichen
      - minimierung ist eindeutig
      - in Polynomial Zeit berechnenba

= Beweis

Das Problem, zu entscheiden, ob zwei reguläre Ausdrücke $s, t$ dieselbe Sprache beschreiben (EQUIV), ist PSPACE-vollständig. Wir zeigen dazu im Folgenden zum einen, dass EQUIV in PSPACE liegt, und zum anderen, dass EQUIV PSPACE-schwer ist, sich also jedes beliebige Problem aus PSPACE in Polynomialzeit auf EQUIV reduzieren lässt.

== Zugehörigkeit zu PSPACE
Für die Zugehörigkeit zu PSPACE geben wir einen nichtdeterministischen Algorithmus mit polynomialem Platzbedarf an, der entscheidet, ob die Sprachen verschieden sind. Damit gilt $overline("EQUIV") in "NPSPACE"$. Nach dem Satz von Savitch ist $"NPSPACE" = "PSPACE"$, also $overline("EQUIV") in "PSPACE"$. 
Da PSPACE unter Komplement abgeschlossen ist, folgt $"EQUIV" in "PSPACE"$.

Der Algorithmus rät hierzu nichtdeterministisch eine Eingabe $x$, die von genau einem der beiden Ausdrücke akzeptiert wird. Also ein Wort aus der symmetrischen Differenz der beiden Sprachen, das von einem der Automaten akzeptiert wird und vom anderen nicht.

Zunächst wandeln wir $s$ und $t$ in NFAs $M$ und $N$ um. Mit der Konstruktion aus dem Satz von Kleene ist das in linearer Zeit möglich, die Automaten haben also $O(|s|)$ bzw. $O(|t|)$ Zustände (Quelle). Anschließend rät eine NTM $T$ mit polynomial beschränktem Band die Eingabe $x$ Zeichen für Zeichen. Dabei speichert $T$ nicht das bisher geratene Teilwort, sondern nur die Mengen der Zustände von $M$ und $N$, die unter diesem Teilwort erreichbar sind. Die unter dem bisher geratenen Teilwort erreichbaren Zustände bezeichnen wir als markiert. Nummerieren wir die Zustände eines Automaten mit $k$ Zuständen durch, lässt sich jede Markierung als Bitvektor der Länge $k$ kodieren. Hat etwa $M$ vier Zustände, von denen aktuell der zweite und vierte markiert sind, speichert die NTM den Vektor $(0,1,0,1)$. Pro Automat gibt es zwar $2^k$ mögliche Markierungen, die NTM hält aber stets nur eine davon, also $k$ Bits. Insgesamt benötigt sie damit $|M| + |N|$ Bits, was nach der linearen Umwandlung polynomial in $|s| + |t|$ ist.

Die $2^k$ möglichen Markierungen entsprechen genau den Zuständen des Potenzautomaten. Die NTM simuliert diesen also schrittweise, ohne ihn explizit zu konstruieren.

Zu Beginn sind die Startzustände der beiden NFAs sowie alle von dort über ε-Übergänge erreichbaren Zustände markiert. Die NTM rät nun nichtdeterministisch eine Eingabe $x$ Zeichen für Zeichen. Nach jedem geratenen Zeichen $a$ ersetzt sie die aktuelle Markierung jedes Automaten durch die Menge der Zustände, die von einem markierten Zustand mit $a$ und anschließenden ε-Übergängen erreichbar sind. Die alte Markierung wird dabei überschrieben.

Vor dem ersten und nach jedem weiteren Zeichen prüft die NTM, ob in genau einem der beiden Automaten ein akzeptierender Zustand markiert ist. In diesem Fall liegt das bisher geratene Präfix in genau einer der beiden Sprachen, und die NTM akzeptiert.

Da es nur $2^(|M|+|N|)$ verschiedene Paare von Markierungen gibt, existiert ein unterscheidendes Wort, falls überhaupt, auch mit Länge höchstens $2^(|M|+|N|)$. Die NTM führt daher einen Schrittzähler mit $|M| + |N|$ Bits mit und verwirft, sobald er diese Grenze erreicht.

Der angegebene Algorithmus benötigt zwar nur polynomialen Platz, kann im schlimmsten Fall aber exponentiell lange laufen. Das liegt daran, dass das kürzeste Wort, das die beiden Automaten unterscheidet, exponentiell lang in der Größe der Automaten sein kann. Insgesamt benötigt die NTM $O(|M| + |N|)$ Platz, also polynomial viel in $|s| + |t|$.

#figure(image("/Bilder/shortestNonAccepting.png"),
  caption: [NFA über $Sigma = {a}$ mit Zyklen der Längen 2, 3 und 5.Das kürzeste nicht akzeptierte Wort ist $a^30$]
)<fig-shortest-non-accept>

@fig-shortest-non-accept zeigt einen NFA über $Sigma = {a}$ mit drei Zyklen der Längen 2, 3 und 5. In jedem Zyklus ist nur der vom Startzustand am weitesten entfernte Zustand nicht akzeptierend. Ein Wort $a^m$ wird daher genau dann verworfen, wenn $m > 0$ durch 2, 3 und 5 teilbar ist. Der Automat hat 11 Zustände, das kürzeste nicht akzeptierte Wort ist aber $a^30$. Vergleicht man ihn mit einem Automaten für $Sigma^*$, ist $a^30$ also das kürzeste unterscheidende Wort.

Allgemein erhält man mit $n$ Zyklen paarweise teilerfremder Längen $p_1, dots, p_n$ einen Automaten mit $1 + p_1 + dots + p_n$ Zuständen, dessen kürzestes nicht akzeptiertes Wort die Länge $p_1 dot.c p_2 dot.c dots.c p_n$ hat. Wählt man für die $p_i$ die ersten $n$ Primzahlen, wächst die Zustandszahl polynomial in $n$, die Länge des kürzesten nicht akzeptierten Wortes dagegen exponentiell.

Damit gilt $overline("EQUIV") in "NPSPACE"$ und mit der obigen Argumentation $"EQUIV" in "PSPACE"$.

== PSPACE-Schwere

#figure( image("/Bilder/tmNexample.png"),
caption: [Tets]
)<fig-tm-ex>

damit wäre ein berechnungsverlauf für @fig-tm-ex $
\#(q_0,a)a a⊔\#x(q_1,a)a⊔\#x⊔(q_2,a)⊔\# \ x⊔⊔(q_1,⊔)\#x⊔(q_3,⊔)⊔\#x(q_3,⊔)⊔⊔\#(q_3,x)⊔⊔⊔\#(q_a,⊔)⊔⊔⊔\#
$

== Zweiter teil

- Beliebige TM $N$ aus PSPACE
- Reduktion von N auf M wobei M $"EQ"_"RA"$ erkennt
- Berechnungsverläufe werden Codiert
  - Hier beispiel von TM zeigen und wie man codiert
- Was zeigen wir
  - Wird nicht direkt gezeigt sondern:
    - ausdruck erkennt alle ungültigen Läufe
    - und test ist hardcodiert $L(s) = L(Sigma^*)$
      - wenn das gleich ist sind alle Läufe verwerfend
$x in L(N) &<=> N(x) "akzeptiert" \
&<=> "es gibt einen akzeptierenden Berechnungspfad" w "für" N(x) \
&<=> exists w in Delta^*: w in.not L(M_x) \
&<=> L(M_x) != Delta^*$
- Wie wird der Ausdruck $s$ gebaut
  - $s_0$ erkennt alle Syntaktischen Fehler
  - $s_1$ erkennt falschen Start
  - $s_2$ erkennt falsches Ende
  - $s_3$ erkennt falsche Übergänge
  - $s = s_0 + s_1 + s_2 + s_3$
  - manche Ausdrücke finden selbe Fehler, ist aber kein Problem
  - hier würde ich gerne irgendwie aufdröseln wie lange das ist und wie stark das wächst
- Dann muss M nichtdeterminsitisch raten
  - es gibt hier also zwei Arten von nicht determinimus
    - TM ist nichtdeterministisch sie rät also wenn es einen akzept. berechnungspfad gäbe den richtigen

