## Features:

- Authorization
- Forum
- Bag-report

## Running in development

Dependencies:
- Ruby 3.2.2
- PostgreSQL
- Node.js

Fill credentials in `.env` file as
```
THE_FIRST_BOGATYR_DEV_DATABASE_USERNAME=your_postgres_username
THE_FIRST_BOGATYR_DEV_DATABASE_PASSWORD=your_portgres_password
```

Install dependencies:

```bash
bundle install
npm install
```

Run the frontend dev build:

```bash
foreman start -f Procfile.dev
```

Run the web server from IDE or from terminal with
```bash
rails s
```