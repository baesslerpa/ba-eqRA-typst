#import "@preview/lemmify:0.1.8": *

#let (
  theorem, lemma, corollary,
  remark, proposition, example,
  proof, rules: thm-rules,
  definition
) = default-theorems("thm-group", lang: "de",
thm-numbering: thm-numbering-heading.with(max-heading-level: 1)
)