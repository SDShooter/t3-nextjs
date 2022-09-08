FROM jarredsumner/bun:edge
WORKDIR /app 
RUN apk add curl bash
RUN apk add nodejs=16.17.0-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
RUN apk add npm=8.19.1-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
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