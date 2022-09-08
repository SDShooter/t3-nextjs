FROM jarredsumner/bun:edge
WORKDIR /app
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
COPY package.json package.json
COPY bun.lockb bun.lockb
RUN bun install
COPY . .
RUN npx tailwindcss -c ./tailwind.config.cjs -i ./src/styles/globals.css -o ./dist/styles/globals.css
RUN npm run build
EXPOSE 8080
ENV PORT=8080
#Secrets should be set securely..  docker secrets, flyctl secret or other manager
ENV DATABASE_URL=http://fake.com
ENV NEXTAUTH_SECRET=bleh
ENV NEXTAUTH_URL=http://fake.com
ENV DISCORD_CLIENT_ID=blah
ENV DISCORD_CLIENT_SECRET=blah

ENTRYPOINT ["bun", "start"]