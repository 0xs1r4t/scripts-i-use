#!/bin/bash

# .git/hooks/pre-commit
# a pre-commit hook.
# called before a commit is made

echo "🏁 pre-commit started!"

tree ./ > README.md
sed -i '1i ```bash' README.md
echo '```' >> README.md
git add README.md

echo "👌 pre-commit completed!"

# end
