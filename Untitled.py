#!/usr/bin/env python

import os
import pandas as pd
from sqlalchemy import create_engine
import time
import argparse

def main(params):
    user = params.user
    password = params.password
    user = params.user
    host = params.host
    port = params.port
    db = params.db
    table = params.table
    csv_url = params.url

    engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{db}")
    csv = "data.csv.gz"
    print(f"start downloading {csv_url}")
    os.system(f"wget {csv_url} -O {csv}")
    print(f"end downloading {csv}")
    df_iter = pd.read_csv(csv,iterator=True, chunksize=10000)
    pf = next(df_iter)

    pf.tpep_pickup_datetime = pd.to_datetime(pf.tpep_pickup_datetime)
    pf.tpep_dropoff_datetime = pd.to_datetime(pf.tpep_dropoff_datetime)


    pf.head(0).to_sql(name=table,con=engine,if_exists='replace')
    pf.to_sql(name=table,con=engine,if_exists='append')

    while len(pf) > 0:
        t_start = time.time()
        pf = next(df_iter)
        pf.to_sql(name=table,con=engine,if_exists='append')
        t_end = time.time()
        print(f"inserted another chunk, tool {t_end - t_start} sec")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Ingest data to postgres.')

    parser.add_argument('--user',  help='db user')
    parser.add_argument('--password',  help='db user pass')
    parser.add_argument('--host',  help='db host')
    parser.add_argument('--port',  help='db port')
    parser.add_argument('--db',  help='db name')
    parser.add_argument('--table',  help='db table')
    parser.add_argument('--url',  help='csv url to ingest')

    args = parser.parse_args()
    main(args)
