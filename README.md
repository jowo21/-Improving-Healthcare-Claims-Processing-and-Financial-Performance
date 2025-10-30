# -Optimizing-Healthcare-Claims-Processing-and-Financial-Performance-


Healthcare claims are a critical component of the financial and operational ecosystem in healthcare systems. Every claim submitted represents a service provided, and the accuracy, efficiency, and timeliness of claims processing can significantly impact cash flow, provider satisfaction, and patient experience. However, inefficiencies such as claim denials, underpayments, and delays in Accounts Receivable (AR) can strain healthcare organizations.

With the increasing volume of claims and complexity of insurance processes, a thorough analysis can be leveraged to gain insights into claims performance, identify revenue leakage, and uncover patterns behind denials and payment delays.

<br>
<br>

---

### **Project Objectives**

The objective of this project is to analyze healthcare claims data to:

1. **Identify patterns in claim denials and underpayments**
2. **Predict claim outcomes and delays**
3. Provide actionable insights for stakeholders to reduce processing time, minimize denials, and enhance revenue cycle performance.

<br>
<br>

---

### About the Dataset

- The dataset structure and dictionary can be found [here]()
- The SQL code generated to perform exploratory data analysis can be found [here](https://github.com/jowo21/-Optimizing-Healthcare-Claims-Processing-and-Financial-Performance-through-Data-Analysis/blob/main/claims%20data%20EDA.sql)

<br>
<br>

---

### Executive Summary

One of the most important metrics uncovered from this dataset is the Denial Rate.  Across its three main statuses of paid, denied, and partially paid, there exists an almost even split percentage across them with the denial rate being 33.1%, paid claims at 35.7%, and partially paid claims at 31.2%.

<img width="528" height="565" alt="image" src="https://github.com/user-attachments/assets/14a9f004-8d48-4c48-bd7c-03c56a5a4405" />

<br>
<br>


The most impactful metric on denials is having incorrect billing information.  

| Reason Code | Number Denied | Percent denied |
| --- | --- | --- |
| Service not covered | 43 | 39% |
| Incorrect billing information | 52 | 37% |
| Duplicate claim | 41 | 36% |
| Patient eligibility issues | 45 | 36% |
| Lack of medical necessity | 38 | 36% |
| Pre-existing condition | 42 | 35% |
| Missing documentation | 37 | 29% |
| Authorization not obtained | 33 | 21% |

Although Services not covered had the highest denial rate, it is assumed that this is a metric that cannot be easily controlled.  However if billing information can be corrected it will have the highest impact on reducing the number of denials.

Since this dataset did not include an outcome date column, we will define claims that required a follow up as Claim Delays.  

The overall Claim Delay percentage is 52.2% with only 18.4% of those delays reaching a Paid outcome.

The metrics that had the most impact on claim delays are reason codes with Incorrect Billing Information and Patient Eligibility Issues

| Reason Code | Number of Delays | Delay Percentage |
| --- | --- | --- |
| Incorrect billing information | 74 | 52.11 |
| Patient eligibility issues | 74 | 58.73 |
| Authorization not obtained | 72 | 46.75 |
| Pre-existing condition | 64 | 52.89 |
| Missing documentation | 63 | 50.00 |
| Duplicate claim | 61 | 53.98 |
| Lack of medical necessity | 59 | 55.14 |
| Service not covered | 55 | 49.55 |

<br>
<br>

---

### Other Insights based on Key Performance Indicators

- Assessing underpayments (currently defined as having a paid claim amount less than half of the billing amount for a line item) only accounted for 0.6% of the claims in this dataset.  The following claims met that criteria:

| **Claim ID** | **Date of Service** | **Insurance Type** | **Billed Amount** | **Paid Amount** |
| --- | --- | --- | --- | --- |
| D1XQ90B7DT | 2024-08-10 | Self-Pay | 147 | 73 |
| 6O9HDAP1PX | 2024-06-26 | Medicaid | 459 | 222 |
| S1SUBLMW4D | 2024-09-16 | Medicaid | 151 | 75 |
| 7RDGLF6OU7 | 2024-08-05 | Commercial | 493 | 242 |
| YCS97XY0NS | 2024-05-21 | Commercial | 475 | 237 |
| XIP1J1DOJA | 2024-05-11 | Commercial | 470 | 231 |

<br>

- The Payment Ratio (ratio of total billed amounts to total paid amounts) is 1.48 which reflects that there was no evidence in overpayments made.

<br>

- The Denial Rate by Procedure Codes and the percentages of denials did not reflect much variance among them, therefore not being much of a determining factor in identifying denial trends:

| Procedure Code | Number Denied | Denial Rate |
| --- | --- | --- |
| 99221 | 49 | 43% |
| 99232 | 34 | 41% |
| 99233 | 37 | 37% |
| 99223 | 34 | 36% |
| 99214 | 33 | 32% |
| 99215 | 34 | 31% |
| 99238 | 28 | 29% |
| 99231 | 31 | 27% |
| 99213 | 27 | 27% |
| 99222 | 24 | 27% |

<br>

- There was not much variance between the reason codes and their respective denial rates except for Authorizations Not Obtained category having a significantly lower rate than the others:

| Reason code | Number Denied | Denial rate |
| --- | --- | --- |
| Service not covered | 19 | 46% |
| Lack of medical necessity | 17 | 46% |
| Pre-existing condition | 16 | 42% |
| Duplicate claim | 15 | 39% |
| Patient eligibility issues | 16 | 37% |
| Missing documentation | 15 | 33% |
| Incorrect billing information | 12 | 31% |
| Authorization not obtained | 10 | 17% |

<br>

- The type of insurance did not have a major factor on denial rates because each type reflected roughly the same rate:

| Insurance Type | number paid | number partially paid | number denied | percent denied |
| --- | --- | --- | --- | --- |
| Self-Pay | 161 | 87 | 88 | 35% |
| Medicare | 156 | 70 | 77 | 33% |
| Commercial | 171 | 76 | 88 | 34% |
| Medicaid | 181 | 79 | 78 | 30% |

<br>

Increasing compliance of the self-pay patients to obtain insurance coverage may help to decrease and eventually eliminate that demographic’s denial rate 

- There was not much variance for claim delays either by insurance type, procedure codes, or top 10 diagnosis codes:

| Insurance Type | Claim Delays | Delay Percent |
| --- | --- | --- |
| Self-Pay | 126 | 50.6% |
| Medicare | 114 | 48.9% |
| Commercial | 140 | 54.0% |
| Medicaid | 142 | 54.8% |

| Procedure Code | Claim Delays | Delay Percent |
| --- | --- | --- |
| 99214 | 62 | 60.78% |
| 99213 | 58 | 57.43% |
| 99215 | 60 | 55.05% |
| 99221 | 61 | 53.98% |
| 99222 | 48 | 53.93% |
| 99238 | 50 | 52.63% |
| 99232 | 43 | 51.81% |
| 99223 | 46 | 48.94% |
| 99233 | 44 | 44.00% |
| 99231 | 50 | 43.86% |

| Diagnosis Code | Claim Delays | Delay Percent |
| --- | --- | --- |
| A01.1 | 8 | 88.89% |
| A07.0 | 5 | 83.33% |
| A08.4 | 4 | 80.00% |
| A04.4 | 4 | 80.00% |
| A16.4 | 9 | 75.00% |
| A08.3 | 6 | 75.00% |
| A06.5 | 6 | 75.00% |
| A03.0 | 6 | 75.00% |
| A16.3 | 8 | 72.73% |
| A18.8 | 8 | 72.73% |

<br>
<br> 

---

### Recommendations

Based on the analysis correcting incorrect billing information will have the largest impact on both claim delays (7% reduction) and denial rates (5% reduction).
