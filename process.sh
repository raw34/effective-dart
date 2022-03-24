#bin/sh

grep '^    - \[' style.md | wc -l &&
grep '^- \[' style.md | wc -l &&
grep '^    - \[' documentation.md | wc -l &&
grep '^- \[' documentation.md | wc -l &&
grep '^    - \[' usage.md | wc -l &&
grep '^- \[' usage.md | wc -l &&
grep '^    - \[' design.md | wc -l &&
grep '^- \[' design.md | wc -l &&
