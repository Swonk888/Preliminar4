from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import NullPool

def connection(pool):
    username = "root"
    password = "123456"
    server = "localhost"
    port = "1433"
    db = "caso3"
    driver = "ODBC Driver 17 for SQL Server"
    if pool:
        engine = create_engine(f"mssql+pyodbc://{username}:{password}@{server}:{port}/{db}?driver={driver}", pool_size=10, max_overflow=0)
    else:
        engine = create_engine(f"mssql+pyodbc://{username}:{password}@{server}:{port}/{db}?driver={driver}", poolclass=NullPool)
    return engine