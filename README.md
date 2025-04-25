# About Project

This project demonstrates the use of DBT and Airflow tools with Docker. Two DBT models were created based on the data in two CSV files—one on a monthly basis and the other categorized. Then, Airflow was configured to run them daily, and finally, the entire project was containerized using Docker.

# How To Run

To run the project, navigate to the dbt-airflow directory. Then, bring up the project using docker compose up.

```
docker compose up -d
```

Airflow is configured to run every day at 10:00 AM. You can find the airflow-webserver container via Docker Desktop and click the airflow-webserver link, or access it directly at:
http://localhost:8080/login/

Since the systems are being initialized at startup, the site may not load immediately, so it is recommended to wait 10 seconds. You can manually trigger from the DAGs page.

To see the results of the model, connect to the database by running the following command from the same directory:

```
docker exec -it $(docker ps --filter "name=postgres" --format '{{.Names}}') psql -U username -d postgresdb
```

Then, to view the tables:

```
\d # to view tables
SELECT * FROM <table_name>;
\q # to exit the database
```

The names of the two model tables are:

- monthly_sales_by_product: This model shows how much each product is sold monthly. Orders for each month were analyzed, and the total number of orders and total sales amount were calculated for each product.

- monthly_performance: This model, on the other hand, is a model that shows the monthly performance of each product category. The total number of orders and total sales amount were calculated for each category.

To stop the container:

```
docker compose down -v
```
