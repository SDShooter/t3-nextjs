bun add -d bun-framework-next
bun install --verbose
npx tailwindcss -c ./tailwind.config.cjs -i ./src/styles/globals.css -o ./public/styles/globals.css
bun build