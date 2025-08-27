#!/bin/bash
echo "---------------------------------------------"
echo " Welcome to the Gemini CLI container 🎉"
echo "---------------------------------------------"
echo "Tip: Run 'gemini' to start an interactive session."
echo "     Or try 'gemini -p \"Hello world\"' for a quick prompt."
echo
echo "Running: $@"
echo

# Hand control to whatever the user asked for (default: bash)
exec "$@"

