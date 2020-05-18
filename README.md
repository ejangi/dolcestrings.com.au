# dolcestrings.com.au wordpress website

This dockerised version of wordpress runs locally using:

```bash
docker-compose build
docker-compose up
```

... and in production on Google App Engine:

```bash
gcloud app deploy
gcloud app deploy cron.yaml
```