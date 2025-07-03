# 1. prepare keywords.txt

## Standardowo
```
npm run generate-keywords
```

## Lub bezpośrednio
```
node scripts/generate-keywords-postal-codes.js
```

2. run scraper

```
./google_maps_scraper-1.8.1-linux-amd64 -depth 1 -input keywords-postal-codes.txt -results results.csv -exit-on-inactivity 3m -lang 'pl'
```

```
./google_maps_scraper-1.8.1-linux-amd64 -depth 1 -input keywords.txt -results results.csv -exit-on-inactivity 3m -geo '51.10995678713055, 17.0322888918338' -radius 50000 -zoom 15 -lang 'pl'
```


3. convert csv to sql

```
npm run csv-to-sql ./scraper/results.csv ./scraper/results.sql
```

```
node --stack-size=12000 ../scripts/csv-to-sql.js results.csv -o results.sql
```

```
mlr --csv split -n 10000 results_restaurant.csv
```

4. import data to postgres via pgAdmin

```
psql postgresql://postgres.hzkvqzhvgdwlbienjgjx:<PASSWORD>@aws-0-eu-north-1.pooler.supabase.com:5432/postgres -f cleanup.sql
```

```
psql postgresql://postgres.hzkvqzhvgdwlbienjgjx:<PASSWORD>>@aws-0-eu-north-1.pooler.supabase.com:5432/postgres -f results.sql
```

5. remove duplicates

```
psql postgresql://postgres.hzkvqzhvgdwlbienjgjx:<PASSWORD>>@aws-0-eu-north-1.pooler.supabase.com:5432/postgres -f remove-duplicates.sql
```
