SCRIPTS_DIR=sql-output
password=$1

for file in $SCRIPTS_DIR/*.sql
    do psql postgresql://postgres:$password@130.61.187.2:9876/postgres -f $file
done
