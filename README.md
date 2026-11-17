
# Healthcare Insurance Cost & Customer Analysis

### An End-to-End Data Analytics Project Using Python, PostgreSQL and Power BI

## 1. Project Overview

This project analyses a sample of US health insurance customer records to understand how customer characteristics are associated with recorded medical insurance charges.

The project follows an end-to-end data analytics workflow, including data inspection, cleaning, exploratory data analysis, SQL-based business analysis and interactive dashboard development.

**Business Question:**

What customer characteristics are associated with higher medical insurance charges, and how can an insurance company use these insights to better understand its cost distribution?

### Project Objectives

- Understand the structure and quality of the insurance dataset.
- Clean and prepare the data for analysis.
- Explore customer characteristics and insurance charge distributions.
- Compare charges across smoking status, age groups, BMI, gender and regions.
- Answer business questions using PostgreSQL.
- Build interactive Power BI dashboards to present key findings.

---

## 2. Dataset Description

The project uses the **US Health Insurance Dataset**, published on Kaggle by **Anirban Datta**.

**Dataset Source:** [US Health Insurance Dataset – Kaggle](https://www.kaggle.com/datasets/teertha/ushealthinsurancedataset)

### Dataset Information

| Details | Information |
|---|---|
| Original Records | 1,338 |
| Records After Cleaning | 1,337 |
| Columns | 7 original columns |
| Duplicate Records Removed | 1 |
| Missing Values | 0 |

### Dataset Columns

| Column | Description |
|---|---|
| age | Customer age |
| sex | Recorded sex category |
| bmi | Body Mass Index |
| children | Number of children/dependants |
| smoker | Smoking status |
| region | US region |
| charges | Recorded individual insurance charges |

A derived `age_group` column was also created to support customer segmentation.

---

## 3. Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, inspection and exploratory data analysis |
| Pandas & NumPy | Data manipulation and numerical analysis |
| Matplotlib & Seaborn | Data visualisation |
| PostgreSQL | SQL queries and business analysis |
| pgAdmin 4 | Database management |
| Power BI | Interactive dashboards and reporting |
| DAX | Measures and KPI calculations |
| GitHub | Project documentation and version control |

---

## 4. Project Workflow

The project was completed in the following stages:

1. **Data Inspection:** Examined dataset structure, dimensions, data types and summary statistics.
2. **Data Cleaning:** Checked missing values, duplicate records, invalid values and potential outliers.
3. **Exploratory Data Analysis:** Analysed customer distributions, insurance charges, outliers and correlations using Python.
4. **SQL Analysis:** Used PostgreSQL to perform filtering, aggregation, customer segmentation, conditional analysis, subqueries, CTEs and window functions.
5. **Data Visualisation:** Developed three interactive Power BI dashboard pages.
6. **Reporting:** Documented findings, business recommendations, limitations and future improvements.

---

## 5. Key Findings

The analysis identified several important patterns in the dataset.

| Analysis | Key Finding |
|---|---|
| Average Charges – Smokers | $32,050.23 |
| Average Charges – Non-Smokers | $8,440.66 |
| Highest Average Charges by Age Group | Older Adults – $18,084.99 |
| Lowest Average Charges by Age Group | Young Adults – $9,111.43 |
| Highest Regional Average Charges | Southeast – $14,735.41 |
| Lowest Regional Average Charges | Southwest – $12,346.94 |
| Customers with Charges Above $30,000 | 162 (12.12%) |

### Additional Insights

- Smokers had higher average recorded charges than non-smokers across every defined age group.
- Age showed a weak positive correlation with charges (0.298).
- BMI showed a weak positive correlation with charges (0.198).
- Older Adults accounted for approximately 36.26% of total recorded charges.
- The Southeast had the highest average recorded charges among the four regions.

**Note:** These findings represent descriptive comparisons and associations. They do not establish cause-and-effect relationships. The $30,000 high-charge threshold is an analyst-selected cutoff, not an official industry standard.

---


## 6. Power BI Dashboards

The Power BI report contains three interactive dashboard pages.

### Dashboard 1: Insurance Cost Overview

Provides a high-level overview of the customer base and recorded insurance charges.

**Key Components:**
- Total Customers
- Total Insurance Charges
- Average Insurance Charges
- Smoker Percentage
- Average Charges by Region
- Average Charges by Age Group
- Customer Distribution by Region

![Insurance Cost Overview](./Power_BI/Insurance%20Cost%20Overview.png)

### Dashboard 2: Health & Lifestyle Analysis

Explores how smoking status, BMI and age are associated with recorded insurance charges.

**Key Components:**
- Average Charges – Smokers
- Average Charges – Non-Smokers
- Average Charges by Smoking Status
- BMI vs Insurance Charges
- Age vs Insurance Charges
- Interactive slicers


![Health & Lifestyle Analysis](./Power_BI/Health%20%26%20Lifestyle%20Analysis.png)

### Dashboard 3: Customer Segmentation & Cost Drivers

Compares customer groups and examines how recorded charges vary across different customer characteristics.

**Key Components:**
- High-Charge Customers
- High-Charge Customer Percentage
- Average Insurance Charges
- Total Charges by Age Group and Smoking Status
- Average Charges by Number of Children
- Average Charges by Gender and Smoking Status
- Interactive slicers

![Customer Segmentation & Cost Drivers](./Power_BI/Customer%20Segmentation%20%26%20Cost%20Drivers.png)


## 7. Business Recommendations

1. **Review Smoking-Related Cost Patterns:** Investigate the difference in average charges between smokers and non-smokers while considering other available factors.
2. **Monitor Age-Related Costs:** Compare average and total charges across different age groups.
3. **Investigate Regional Differences:** Collect additional information to understand why charges vary across regions.
4. **Monitor Customer Segments:** Use interactive dashboards to track changes across age groups, regions, smoking status and gender.
5. **Review High-Charge Records:** Examine records above $30,000 for further analysis rather than automatically classifying customers as high-risk.

These recommendations require further investigation and should not be treated as automatic insurance pricing rules.

---

## 8. Project Limitations

- The dataset does not contain customer histories over time.
- It does not include diagnoses, treatment details, claims-level records, policy coverage, premiums or provider costs.
- The analysis identifies associations but does not establish causation.
- Age groups and the high-charge threshold are analyst-defined categories.
- Smaller customer groups should be interpreted cautiously.
- USD formatting is based on the US dataset context; the source does not contain a separate currency field.

---

## 9. Future Improvements

- Include recent and longitudinal records to check whether the observed patterns persist.
- Incorporate policy, claims, coverage and provider information if available.
- Use suitable statistical models with appropriate controls for adjusted association analysis or prediction.
- Validate business definitions and totals whenever the dataset is refreshed.

---

## 10. Repository Structure

```text
Healthcare-Insurance-Cost-Analysis/
│
├── Dataset/
│   ├── insurance.csv
│   ├── healthcare_insurance_cleaned.csv
│   └── README.md
│
├── Python_Analysis/
│   ├── Healthcare_Insurance_Cost_Analysis.ipynb
│   └── README.md
│
├── SQL_Analysis/
│   ├── Healthcare_Insurance_Analysis.sql
│   └── README.md
│
├── Power_BI/
│   ├── Dashboard.pbix
│   ├── Insurance Cost Overview.png
│   ├── Health & Lifestyle Analysis.png
│   ├── Customer Segmentation & Cost Drivers.png
│   └── README.md
│
├── Report/
│   ├── Healthcare_Insurance_Cost_Analysis_Project_Report.pdf
│   ├── Healthcare_Insurance_Cost_Analysis_Project_Report.docx
│   └── README.md
│
└── README.md
```

---

## 11. Project Deliverables

- Original and cleaned datasets.
- Python Jupyter Notebook.
- PostgreSQL SQL analysis file.
- Interactive Power BI report (`.pbix`).
- Three Power BI dashboard screenshots.
- Detailed project report in PDF and Word formats.

---

## 12. Conclusion

This project demonstrates an end-to-end data analytics workflow using Python, PostgreSQL and Power BI.

Through data cleaning, exploratory analysis, SQL queries and interactive dashboards, the project identifies patterns in recorded insurance charges across different customer groups.

The findings provide a descriptive understanding of the dataset and highlight areas that could be investigated further using richer and more detailed data.

---

**Dataset Credit:** Anirban Datta – [US Health Insurance Dataset on Kaggle](https://www.kaggle.com/datasets/teertha/ushealthinsurancedataset).

