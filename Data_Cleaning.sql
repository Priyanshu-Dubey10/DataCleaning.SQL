use Data_cleaning;

Create table layoffs_stage(select * from layoffs); -- creating Duplicates of source data
select * from layoffs_stage;

-- 1. Remove Duplicates
-- 2.Standardize the Data
-- 3. Null Values and Blank Values
-- 4. Handle date formate issues
-- 5. Change data type and Removes Column and Rename Table and column type and name

-- 4 Handling date formate issues
alter table layoffs add column new_date date; -- create a new date column
update layoffs set new_date = str_to_date(date ,"%m/%d/%Y"); -- update the new date column using str_to_date function
alter table layoffs drop column date; -- drop the existing date column 
alter table layoffs change column new_date date date; -- chnage the column name from new_date to date

-- 1. Remove Duplicates

with cte as (
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,stage ,country,date) as Row_num from layoffs_stage)
select * from cte where row_num >1; -- To Identified Duplicates values
;

create table layoffs_stage2 (
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,stage ,country,date) as Row_num from layoffs_stage); -- create another table
select *  from layoffs_stage2 where Row_num>1 ;
delete from layoffs_stage2 where Row_num>1;
alter table layoffs_stage2 drop column Row_num ; -- to drop column that doestn't need further  
-- rename table layoffs_stage2 to layoffs_stage

-- 3.Standardized text
select company,trim(company) from layoffs_stage2;
update layoffs_stage2 set company = trim(company) ;

select distinct industry from layoffs_stage2 order by 1;
select * from layoffs_stage2 where industry like 'crypto%';
update layoffs_stage2 set industry = 'Crypto' where industry like 'crypto%';

select distinct country from layoffs_stage2 order by 1;
select * from layoffs_stage2 where country like 'United States%'  ;
update layoffs_stage2 set Country = 'United States' where Country like 'United States%';

-- 3. Null Values and Blank Values
-- For String Values
select distinct industry from layoffs_stage2 order by 1;
select * from layoffs_stage2 where industry is null;
update layoffs_stage2 set industry = 'Entertainment' where industry is null; -- i found industry type through company name using google
select * from layoffs_stage2 where company = 'Bally''s Interactive';

select * from layoffs_stage2 where industry = ''  or industry is null;

select * from layoffs_stage2 where company = 'Airbnb';
update layoffs_stage2 set industry = 'Travel' where company ='Airbnb';

select * from layoffs_stage2 where company = 'carvana';
update layoffs_stage2 set industry = 'Transportation ' where company ='carvana' and industry = '';

select * from layoffs_stage2 where company = 'Juul';
update layoffs_stage2 set industry = 'Consumer' where company ='Juul' and industry = '';

select * from layoffs_stage2 where total_laid_off is null and percentage_laid_off is null; -- Deleted unnecesary data from the table 
delete from layoffs_stage2 where total_laid_off is null and percentage_laid_off is null;

describe layoffs_stage2;
alter table layoffs_stage2 modify column percentage_laid_off int; -- changing column type 


















