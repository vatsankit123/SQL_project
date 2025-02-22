-- SQL Project - Data Cleaning








SELECT * 
FROM layoffs;



-- now when we are data cleaning we usually follow a few steps
-- 1. check for duplicates and remove any
-- 2. standardize data and fix errors
-- 3. Look at null values and see what 
-- 4. remove any columns and rows that are not necessary - few ways



-- 1. Remove Duplicates

# First let's check for duplicates



CREATE TABLE layoffs_staging        -- we have created an another table naming layoffs_satging and insert layoffs table data to it so that any changes
LIKE layoffs;                       -- wont effect the original data 

SELECT*
FROM layoffs_staging;           

INSERT layoffs_staging
SELECT*
FROM layoffs;



SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off , `date`) AS row_num
FROM layoffs_staging;


WITH duplicates_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off , `date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicates_cte
WHERE row_num >1;

SELECT DISTINCT*
FROM layoffs_staging
WHERE company = 'casper'
;



