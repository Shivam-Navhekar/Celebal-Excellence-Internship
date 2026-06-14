# Celebal Excellence Internship - Data Engineering

Author: Shivam Navhekar

---

## Week 1 - Shopping Dataset Analysis

### Objective
Performed basic data exploration, data cleaning, feature engineering 
and visualization on a shopping dataset using Python and Pandas 
as part of the Data Engineering internship program

### Dataset
- File: combined_dataset.csv
- 1000 product records
- 24 columns including price, rating, discount and category details

### Steps Performed
1. Loaded the dataset and explored its structure
2. Checked data types, shape and basic statistics
3. Found and handled missing values
4. Checked and removed duplicate records
5. Cleaned the final_price column by removing currency symbols
6. Created new columns - price_difference and popularity
7. Performed basic data analysis on ratings and discounts
8. Created visualizations - histogram, bar chart, scatter plot, boxplot
9. Saved the cleaned dataset as a new CSV file

### Key Findings
- Most products have a rating above 4.0
- Most products are priced in the low to medium range (under ₹2500)
- SASSAFRAS and Athena are the most popular products
- Some products offer discounts as high as 88%
- A few high-priced products appear as outliers in the data

### Tools Used
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook

### Folder Structure
```
Week-1-Shopping-Analysis/
│── data/
│   └── combined_dataset.csv
│── notebook/
│   └── Shopping-Analysis.ipynb
│── output/
│   └── cleaned_dataset.csv
│── README.md
```

## How to Run
1. Clone this repository
2. Install required libraries:
   pip install pandas numpy matplotlib seaborn
3. Open the notebook:
   jupyter notebook notebook/Shopping-Analysis.ipynb
4. Run all cells in order
