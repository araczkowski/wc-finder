1. prepare keywords.txt


2. run scraper

```
./google_maps_scraper-1.8.1-linux-amd64 -depth 1 -input keywords.txt -results results.csv -exit-on-inactivity 3m -lang 'pl'
```

```
./google_maps_scraper-1.8.1-linux-amd64 -depth 1 -input keywords.txt -results results.csv -exit-on-inactivity 3m -geo '51.10995678713055, 17.0322888918338' -radius 50000 -zoom 15 -lang 'pl'
```


3. convert csv to sql

```
npm run csv-to-sql ./scraper/your_data.csv ./scraper/your_data.sql
```

```
node ../scripts/csv-to-sql.js results.csv -o results.sql
```

4. import data to postgres via pgAdmin
