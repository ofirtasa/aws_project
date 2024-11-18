from flask import Flask
import mysql.connector
import boto3
import random

app = Flask(__name__)

# Function to get the RDS endpoint dynamically using boto3
def get_rds_endpoint(db_instance_identifier):
    rds_client = boto3.client('rds')  # Make sure to set up AWS credentials (IAM role or AWS CLI)
    response = rds_client.describe_db_instances(DBInstanceIdentifier=db_instance_identifier)
    db_instance = response['DBInstances'][0]
    return db_instance['Endpoint']['Address']

# Specify your RDS instance identifier 
db_instance_identifier = 'my-db-instance'  

# Get the RDS endpoint dynamically
rds_endpoint = get_rds_endpoint(db_instance_identifier)

# Database connection configuration
db_config = {
    'user': 'admin',
    'password': 'password123',
    'host': rds_endpoint,  # Use the dynamically fetched endpoint
    'database': 'mydatabase' 
}

@app.route('/')
def home():
    # Connect to the MySQL database
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    
    # Fetch a random quote from the 'quotes' table
    cursor.execute("SELECT quote FROM quotes ORDER BY RAND() LIMIT 1;")
    quote = cursor.fetchone()
    
    # Close the connection
    cursor.close()
    conn.close()
    
    # Return the quote as an HTML response
    return f"<h1>{quote[0]}</h1>"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)  # Default Flask port is 5000
