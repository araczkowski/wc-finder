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
mlr --csv split -n 10000 results_restaurant.csv
```

```
node ../scripts/csv-to-sql.js ./csv-files -o ./sql-output
```

```
node --stack-size=12000 ../scripts/csv-to-sql.js csv -o sql
```



4. import data to postgres

```
./load-data.sh <password>
```

```
psql postgresql://postgres:<PASSWORD>@130.61.187.2:9876/postgres -f cleanup.sql
```

```
psql postgresql://postgres:<PASSWORD>@130.61.187.2:9876/postgres  -f results.sql
```

```
find sql/ -name *.sql -exec psql postgresql://postgres:<PASSWORD>@130.61.187.2:9876/postgres -f {} \;
```
pg_dump -U postgres.hzkvqzhvgdwlbienjgjx -h aws-0-eu-north-1.pooler.supabase.com -p 5432 postgres >> dumpFile.sql
```

5. remove duplicates

```
psql postgresql://postgres:<PASSWORD>@130.61.187.2:9876/postgres -f remove-duplicates.sql
```


6. log to server
```
ssh ubuntu@130.61.187.2 -i ~/.ssh/ssh-key-2023-10-25.key
```
