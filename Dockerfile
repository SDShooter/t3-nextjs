FROM jarredsumner/bun:edge
WORKDIR /app
COPY package.json package.json
COPY bun.lockb bun.lockb
RUN bun install
COPY . .
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