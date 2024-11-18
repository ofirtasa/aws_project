from flask import Flask, jsonify
import mysql.connector
import random

app = Flask(__name__)

def get_db_connection():
    connection = mysql.connector.connect(
        host='database-1-commit.cp0q0y8ewss5.us-east-1.rds.amazonaws.com',
        user='admin',
        password='ofekofir12345678',
        database='mydb'
    )
    return connection

@app.route('/hello', methods=['GET'])
def say_hello():
    return jsonify({"data":"Hello"})

@app.route('/data', methods=['GET'])
def get_data():
    connection = get_db_connection()
    cursor = connection.cursor()

    # Query to fetch a random row from the table
    cursor.execute('SELECT * FROM users ORDER BY RAND() LIMIT 1')
    
    # Fetch the random row
    row = cursor.fetchone()
    cursor.close()
    connection.close()

    # Check if row is None (if there is no data in the table)
    if row:
        # Return the random row as JSON
        return jsonify(row)
    else:
        return jsonify({"error": "No data found"}), 404
    

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
