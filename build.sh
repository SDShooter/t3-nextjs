bun add -d bun-framework-next && \
echo "added bun-framework-next" && \
bun install --verbose && \
echo "bun installed" && \
bun bun --use next && \
echo "bun bun done" && \
npx tailwindcss -c ./tailwind.config.cjs -i ./src/styles/globals.css -o ./public/styles/globals.css && \
echo "npx tailwind done" && \
bun build
