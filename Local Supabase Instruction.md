# 1. ssh to instance
```
ssh ubuntu@130.61.187.2 -i ~/.ssh/ssh-key-2023-10-25.key
```

#2. Instalation
```
# Get the code
git clone --depth 1 https://github.com/supabase/supabase
# Make your new supabase project directory
mkdir supabase-project
# Tree should look like this
# .
# ├── supabase
# └── supabase-project
# Copy the compose files over to your project
cp -rf supabase/docker/* supabase-project
# Copy the fake env vars
cp supabase/docker/.env.example supabase-project/.env
# Switch to your project directory
cd supabase-project

# Switch to your project directory
nano .env
Set pass for database and for application

# Switch to your project directory
nano docker-compose.yml

```

# 3. Run installation
```
# Pull the latest images
docker compose pull
# Start the services (in detached mode)
docker compose up -d
```

#4. Insert data to DB
```
psql postgresql://postgres:<PASSWORD>@130.61.187.2:9876/postgres -f dumpFile.sql

```
