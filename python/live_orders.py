import mysql.connector
import random
import time
from datetime import datetime

connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root@123",
    database="ecommerce_project"
) 

cursor = connection.cursor()
while True:
    customer_id = random.randint(1, 20)
    product_id = random.randint(1, 5)
    quantity = random.randint(1, 3)
    order_time = datetime.now()

    sql = """
    INSERT INTO orders (customer_id, product_id, quantity, order_date)
    VALUES (%s, %s, %s, %s)
    """

    values = (customer_id, product_id, quantity, order_time)

    cursor.execute(sql, values)
    connection.commit()

    print("New order inserted!")

    time.sleep(1)