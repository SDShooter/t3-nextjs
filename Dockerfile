FROM jarredsumner/bun:edge as build
WORKDIR /build
RUN apk add curl bash
RUN apk add nodejs=16.17.0-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
RUN apk add npm=8.19.1-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
COPY package.json package.json
COPY bun.lockb bun.lockb
COPY . .
RUN find -name "Dockerfile"
RUN find / -name "bun"
RUN ls -al .
RUN bun install
RUN npx tailwindcss -c ./tailwind.config.cjs -i ./src/styles/globals.css -o ./public/styles/globals.css
ENV PORT=8080
#Secrets should be set securely..  docker secrets, flyctl secret or other manager
ENV DATABASE_URL=http://fake.com
ENV NEXTAUTH_SECRET=bleh
ENV NEXTAUTH_URL=http://fake.com
ENV DISCORD_CLIENT_ID=blah
ENV DISCORD_CLIENT_SECRET=blah
RUN bun next build

FROM jarredsumner/bun:edge as run
WORKDIR /app
EXPOSE 8080
ENV PORT=8080
#Secrets should be set securely..  docker secrets, flyctl secret or other manager
ENV DATABASE_URL=http://fake.com
ENV NEXTAUTH_SECRET=bleh
ENV NEXTAUTH_URL=http://fake.com
ENV DISCORD_CLIENT_ID=blah
ENV DISCORD_CLIENT_SECRET=blah
#definately running under nodejs right now.. :-(
RUN apk add nodejs=16.17.0-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

COPY --from=build /build/.next ./.next
COPY --from=build /build/public ./public
COPY --from=build /build/*.bun .
COPY --from=build /build/package.json .
COPY --from=build /build/node_modules ./node_modules



ENTRYPOINT ["bun", "start"]