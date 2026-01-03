#import "@preview/ctheorems:1.1.3": *

// color configs
#let colors = (
  blue-stroke: rgb("#1a1aff"), blue-bg: rgb("#E0FFFF"),
  red-stroke:  rgb("#FF0000"), red-bg:  rgb("#FFF5E6"),
  green-stroke:rgb("#2E8B57"), green-bg: rgb("#F0F8F4"),
  note-stroke: rgb("#A52A2A"), note-bg:  rgb("#FFFFF0"),
  lem-stroke:  rgb("#6A5ACD"), lem-bg:  rgb("#F5F5FA"),
)

// project setup
#let project(
  title: "",
  author: "",
  language: "en",
  body
) = {
  set document(title: title, author: author)
  
  set page(
    paper: "us-letter",
    margin: (x: 0.8in, y: 1.0in),
    header: context {
      if counter(page).get().first() > 1 {
        align(right, text(style: "italic", author))
        line(length: 100%, stroke: 0.5pt)
      }
    },
    numbering: "1"
  )

  set heading(numbering: "1.1")

  // ============================================
  // font setting
  // ============================================
  
  let target_font = if language == "en" {
    ("New Computer Modern Sans",)
  } else if language == "zh" {
    ("Alibaba PuHuiTi 3.0")
  } // Adding more languages here as needed

  set text(font: target_font)
  
  show math.equation: set text(
    font: ("New Computer Modern Sans Math",), 
  )

  set math.mat(delim: "[")

  set par(leading: 0.8em, justify: true)
  show heading: set text(weight: "bold")

  align(center)[
    #text(1.8em, weight: "bold", title) \
    #v(1em)
    #text(1.2em, author) \
    #v(0.5em)
    #text(0.9em, datetime.today().display("[month repr:long] [day], [year]"))
  ]

  // theorem rules
  show: thmrules.with(qed-symbol: $square$)

  body
}

// Theorem box settings
#let my_thmbox = thmbox.with(
  base: "heading", 
  titlefmt: strong, 
  radius: 0pt, 
  inset: 1em
)

#let theorem = my_thmbox("thm", "Theorem", base: "heading", 
  fill: colors.blue-bg, stroke: colors.blue-stroke
)
#let proposition = my_thmbox("prop", "Proposition", base: "heading",
  fill: colors.blue-bg, stroke: colors.blue-stroke
)
#let corollary = my_thmbox("cor", "Corollary", base: "heading",
  fill: colors.blue-bg, stroke: colors.blue-stroke
)
#let definition = my_thmbox("def", "Definition", base: "heading",
  fill: colors.red-bg, stroke: colors.red-stroke
)
#let example = my_thmbox("ex", "Example", base: "heading",
  fill: colors.green-bg, stroke: colors.green-stroke
)
#let lemma = my_thmbox("lem", "Lemma", base: "heading",
  fill: colors.lem-bg, stroke: colors.lem-stroke
)
#let fact = my_thmbox("fact", "Fact", base: "heading",
  fill: colors.note-bg, stroke: colors.note-stroke
)
#let proof = thmproof("proof", "Proof")
#let remark = thmplain("remark", "Remark").with(base: "heading")

// Math Helper (deprecated)
#let vocab(x) = text(fill: rgb("#0000CD"), weight: "bold", x)