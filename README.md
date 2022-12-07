# SQL-Triggers

Practical application of MySQL triggers for different real case scenarios.

1. University database constraints:
* Nobody can be a professor and a student at the same time, in any given course
* Courses in the CS department can't be worth more than 10 credits.
* There should be at least one CS course with at least 5 students.
* Out of scope: removing a person from persons table can possibily set any CS course to less than 5 students by cascade deletion.

2. Parcel delivery constraints:
* A locker has N cells. Parcels can be 'small' or 'large' (total_small and total_large default to 0).
* Locker cells can either hold one 'large' parcel or up to 4 'small' parcels. After getting at least one 'small' parcel, the insertion of a 'large' one is not possible.
* Parcels are created with cell_id set to NULL, this changes once they are inserted into one of the cells.
* A parcel can be relocated to another cell, changing cell_id value of the parcel from old.cell_id to new.cell_id (not NULL).
* When a parcel is picked up for good, it gets deleted.
* Insertion, relocation and pick up of the parcel must update the cells capacity accordingly.

---

#### How to run this code

1. Open your MySQL workbench or instance in the terminal.
2. For each scenario, create a database `CREATE DATABASE scenario_db;` and select it `USE scenario_db;`.
3. Open/run the corresponding schema file to create the tables, then open the triggers file to create the corresponding triggers for each given constraint.
4. Start adding data to check the triggers raising exceptions, you can also use the scripts in the data folder to add initial values to work with.

