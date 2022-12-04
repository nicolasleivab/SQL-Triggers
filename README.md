# SQL-Triggers

Practical application of MySQL triggers for different real case scenarios.

1. University database constraints:
* Nobody can be a professor and a student at the same time, in any given course.
* Courses in the CS department can't be worth more than 10 credits.
* There should be at least one CS course with at least 5 students.
* Out of scope: removing a person from persons table can possibily set any CS course to less than 5 students by cascade deletion.


---

#### How to run this code

1. Open your MySQL workbench or instance in the terminal
2. For each scenario, create a database `CREATE DATABASE scenario_db;` and select it `USE scenario_db;`
3. Open/run the corresponding schema file to create the tables, then open the triggers file to create the corresponding triggers for each given constraint
4. Start adding data to check the triggers raising exceptions, you can also use the scripts in the data folder to add initial values to work with.

