#bin/sh

grep '^    - \[' style.md | wc -l &&
grep '^- \[' style.md | wc -l &&
grep '^    - \[' documentation.md | wc -l &&
grep '^- \[' documentation.md | wc -l &&
grep '^    - \[' usage.md | wc -l &&
grep '^- \[' usage.md | wc -l &&
grep '^    - \[' design.md | wc -l &&
grep '^- \[' design.md | wc -l &&

grep '^    - \[' style.md | >> style.out &&
grep '^- \[' style.md | >> style.out &&
grep '^    - \[' documentation.md | >> documentation.out  &&
grep '^- \[' documentation.md | >> documentation.out &&
grep '^    - \[' usage.md | >> usage.out &&
grep '^- \[' usage.md | >> usage.out &&
grep '^    - \[' design.md | >> design.out &&
grep '^- \[' design.md | >> design.out &&
