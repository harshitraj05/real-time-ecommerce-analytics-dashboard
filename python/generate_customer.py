from faker import Faker
import mysql.connector

fake = Faker()

# Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root@123",
    database="ecommerce_project"
)

cursor = connection.cursor()

# Insert fake customers
for i in range(20):
    name = fake.name()
    city = fake.city()
    signup_date = fake.date_this_year()

    sql = """
    INSERT INTO customers (customer_name, city, signup_date)
    VALUES (%s, %s, %s)
    """

    values = (name, city, signup_date)
    cursor.execute(sql, values)

connection.commit()

print("20 customers inserted successfully!")

cursor.close()
connection.close()