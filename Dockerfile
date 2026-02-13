FROM actualbudget/actual-server:latest

EXPOSE 3006

ENV NODE_ENV=production
ENV ACTUAL_PORT=3006
ENV DB_PATH=/data

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:3006/ || exit 1

CMD ["npm", "start"]
