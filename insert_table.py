import psycopg2
import pandas as pd

# Set up a connection to the database
conn = psycopg2.connect(database="Db_final_project", user="postgres", password="admin", host="localhost", port="5433")
    
def insert_location():
    # Load the Excel file into a pandas dataframe
    df = pd.read_excel('dummy_data/location.xlsx', sheet_name='location')

    # Iterate through the dataframe rows and insert each row into the database
    for index, row in df.iterrows():
        cur = conn.cursor()
        cur.execute("INSERT INTO locations (id, city_name, latitude, longitude) VALUES (%s, %s, %s, %s)", (row['location_id'], row['city_name'], row['latitude'], row['longitude']))
        conn.commit()
        cur.close()

    # Close the connection
    conn.close()

def insert_users():
    # Load the Excel file into a pandas dataframe
    df = pd.read_excel('dummy_data/users.xlsx', sheet_name='users')

    # Iterate through the dataframe rows and insert each row into the database
    for index, row in df.iterrows():
        cur = conn.cursor()
        cur.execute("INSERT INTO users (id, name, email, phone, location_id) VALUES (%s, %s, %s, %s, %s)", (row['user_id'], row['name'], row['email'], row['phone'], row['location_id']))
        conn.commit()
        cur.close()

    # Close the connection
    conn.close()

def insert_products():
    # Load the Excel file into a pandas dataframe
    df = pd.read_excel('dummy_data/products.xlsx', sheet_name='products')

    # Iterate through the dataframe rows and insert each row into the database
    for index, row in df.iterrows():
        cur = conn.cursor()
        cur.execute("INSERT INTO products (     id,                 user_id,        car_brand,          car_model,          car_body_type,          car_transmission_type,          car_year,           car_color,          car_mileage,        car_price,          location_id,        allow_bidding,          product_status,         created_at) VALUES (%s, %s, %s, %s, %s,%s, %s, %s, %s, %s,%s, %s, %s, %s)", 
                                            (   row['product_id'],  row['user_id'], row['car_brand'],   row['car_model'],   row['car_body_type'],   row['car_transmission_type'],   row['car_year'],    row['car_color'],   row['car_mileage'], row['car_price'],   row['location_id'], row['allow_bidding'],   row['product_status'],  row['created_at']))
        conn.commit()
        cur.close()

    # Close the connection
    conn.close()
    
def insert_bids():
    # Load the Excel file into a pandas dataframe
    df = pd.read_excel('dummy_data/bids.xlsx', sheet_name='bids')

    # Iterate through the dataframe rows and insert each row into the database
    for index, row in df.iterrows():
        cur = conn.cursor()
        cur.execute("INSERT INTO bids (     id,                 product_id,        user_id,          bid_price,          bid_status,          created_at) VALUES (%s, %s, %s, %s, %s,%s)", 
                                            (   row['bid_id'],  row['product_id'], row['user_id'],   row['bid_price'],   row['bid_status'],   row['created_at']))
        conn.commit()
        cur.close()

    # Close the connection
    conn.close()

insert_location()    
insert_users()
insert_products()
insert_bids()