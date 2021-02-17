# Frappe-IMS
Inventory Management System designed using Flask, MySQL, HTML5, CSS3 and Bootstrap

## Pre-requisites

1. Flask

If you don't have it yet, you can install it by using this command
`pip install flask`

2. MySQL

To install MySQL, you can go to this [link](https://cdn.mysql.com//Downloads/MySQLInstaller/mysql-installer-community-8.0.23.0.msi) or follow this [tutorial](https://phoenixnap.com/kb/install-mysql-on-windows)
    
3. pymysql
You can install it using `pip install pymysql`

## Steps

* Set up your directories, with a templates folder that holds the HTML files
1. MySQL

* Create a database in MySQL `CREATE DATABASE IMS`
* Create tables as specified
* Insert test values
* Create stored procedures for directly executing queries

2. Python
* Create a database connection with `pymysql.connect()`
* Create a cursor for the connection with `pymysql.connect().cursor()`
* Execute queries on the connected databased using `pymysql.connect().cursor().execute(<your query here>)`

3. HTML
* Design Basic layout of all webpages, namely Home, Products, Locations, Product Movements & Report
* Fetch details from respective tables and display on the corresponding page
* Create a form that takes in the primary key in each case to allow addition and deletion of data



