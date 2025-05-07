## A LaTeX Resume, Cover Letter, and Reference Formatter

### Sample Output
[resume_sample]("./samples/sample.pdf)

[coverletter_sample]("./samples/sample_cover_letter.pdf)

[references_sample]("./samples/sample_references.pdf)

### Requirements
- LaTeX distribution (e.g., TeX Live, MikTeX)
- pdflatex (for PDF generation)

### Building

```zsh
Usage: usage [-o <output directory path>] [-n <output filename>] [-v] [-h] [-r] [-c] [-f] [-a]
  -o            Specify the output directory (required)
  -n            Output filename
  -v            Enable verbose mode
  -h            Show this help message
  -r            Build resume
  -c            Build cover letter
  -f            Build references
  -a            Build all
```

e.g. `./scripts/resume.zsh -o ./samples -n sample -a`

### Content
- Use the methods defined in main.tex to format various sections within the document
- Replace content within `./sections` with your content
- Modify root level `.tex` files for control over which sections are included and in which order
