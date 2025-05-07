#!/bin/zsh

build_verbosity="-silent"

# Function to show usage
usage() {
  echo "Usage: $0 [-o <output directory path>] [-n <output filename>] [-v] [-h] [-r] [-c] [-f] [-a]"
  echo "  -o            Specify the output directory (required)"
  echo "  -n            Output filename"
  echo "  -v            Enable verbose mode"
  echo "  -h            Show this help message"
  echo "  -r            Build resume"
  echo "  -c            Build cover letter"
  echo "  -f            Build references"
  echo "  -a            Build all"
}

while getopts ":o:n:vhcrfa" opt; do
  case $opt in
    o) out_dir="$OPTARG" ;;
    n) out_name="$OPTARG" ;;
    v) verbose=True; build_verbosity="-verbose" ;;
    h) usage ;;
    r) build_resume=True ;;
    c) build_cover_letter=True ;;
    f) build_references=True ;;
    a) build_resume=True; build_cover_letter=True; build_references=True ;;
    \?) echo "Invalid option: -$OPTARG" >&2; usage ;;
    :) echo "Option -$OPTARG requires an argument." >&2; usage ;;
  esac
done
shift $((OPTIND - 1))

# Check if output directory is provided
if [ -z "$out_dir" ]
then
  usage
  echo "Please provide a name for the output dir."
  exit 1
fi
if [ ! -d "$out_dir" ]
then
  mkdir -p $out_dir
    echo Created directory $out_dir
fi
# Check if output directory is provided
if [ -z "$out_name" ]
then
  usage
  echo "Please provide a name for the file names."
  exit 1
fi
echo "Creating PDF's for $out_dir"

if [ $build_resume ]
then
  if [ $verbose ]; then echo "Building resume"; fi
  latexmk -pdf -outdir=build "$build_verbosity" -jobname=${out_name} resume.tex
  mv -f "./build/${out_name}.pdf" $out_dir
fi

if [ $build_cover_letter ]
then
  if [ $verbose ]; then echo "Building cover letter"; fi
  latexmk -pdf -outdir=build "$build_verbosity" -jobname="${out_name}_cover_letter" cover_letter.tex
  mv -f "./build/${out_name}_cover_letter.pdf" $out_dir
fi

if [ $build_references ]
then
  if [ $verbose ]; then echo "Building references"; fi
  latexmk -pdf -outdir=build "$build_verbosity" -jobname="${out_name}_references" references.tex
  mv -f "./build/${out_name}_references.pdf" $out_dir
fi
