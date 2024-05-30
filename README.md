

<p align="center">
  <img src="https://raw.githubusercontent.com/Arp-G/csv2sql/master/.github/images/csv2sql.png" alt="Csv2Sql image"/>
</p>
<h3 align="center"> <i>CSV2SQL - Blazing fast csv to database loader! </i> </h3>

## Table of Contents
1. [What is Csv2sql ?](#what)
2. [Why Csv2sql ?](#why)
3. [Using the browser based interface](#dashboard)

<a name="what"></a>
## What is Csv2sql?

Csv2Sql is a blazing fast fully automated tool to load huge [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) files into a [RDBMS](https://en.wikipedia.org/wiki/Relational_database).

Csv2Sql can automatically...

* Read csv files and infer the database table structure
* Create the required tables in the database
* Insert all the csvs into the database
* Do a simple validation check to ensures that all the data as been imported correctly.

<a name="why"></a>
## Why Csv2sql ?

* Utilizing the power of modern multi core processors, csv2sql does most of its tasks in **parallel**, this makes it super fast and more efficient than other tools.

* It is **completely automatic**, provide a path with hundreds of csvs having size in gigabytes and start the application, it will handle the rest!

* It comes as **[browser user interface](#dashboard)** and is super easy to configure and use.

* While you can have maximum utilization of your cpu to get excellent performance, csv2sql is fully **customizable**, also comes with [lots of options](#cmdargs) which can be changed to fine tune the application based on requirement and to lower down resource usage and database load.

* Csv2Sql supports **partial operations**, so if you want to only create the tables or insert data from the csvs into already created tables without creating the tables again or create both the tables and also insert the data from csvs, Csv2Sql has got you covered !

<a name="dashboard"></a>
## Use csv2sql from your browser

[Please refer to csv2sql-dashboard](https://github.com/kreeti/csv2sql-ui)

For ease of use csv2sql has browser interface which can be used to easily configure the tool and also provides an interface that shows what is the progress of the various running tasks, which files are currently being processed, the current cpu and memory usage, etc.

<p align="center">
  <img src="https://github.com/kreeti/csv2sql/assets/69915843/a657f0ba-6364-4658-b572-147f9b1d3700" alt="browser interface demo"/>
</p>
