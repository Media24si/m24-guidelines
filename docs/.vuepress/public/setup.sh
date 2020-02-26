#!/bin/sh

wget -nv -O .phpcs.xml https://guidelines.m24.dev/phpcs.xml
wget -nv -O .eslintrc.json https://guidelines.m24.dev/eslintrc.json
wget -nv -O .git/hooks/pre-commit https://guidelines.m24.dev/pre-commit
chmod +x .git/hooks/pre-commit