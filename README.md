# -Optimizing-Healthcare-Claims-Processing-and-Financial-Performance-

Healthcare claims are a critical component of the financial and operational ecosystem in healthcare systems. Every claim submitted represents a service provided, and the accuracy, efficiency, and timeliness of claims processing can significantly impact cash flow, provider satisfaction, and patient experience. However, inefficiencies such as claim denials, underpayments, and delays in Accounts Receivable (AR) can strain healthcare organizations.

With the increasing volume of claims and complexity of insurance processes, a thorough analysis can be leveraged to gain insights into claims performance, identify revenue leakage, and uncover patterns behind denials and payment delays.

The Chief Medical Officer at ValleyCare Health System is concerned about how administrative inefficiencies in their claims process are affecting clinical care delivery. High rates of claim denials and delays are not just financial issues often signal documentation gaps, coding inaccuracies, or misalignment between clinical practices and payer requirements. These issues create additional burdens on their clinicians, delay patient treatments, and in some cases, lead to reduced access to follow-up care due to coverage uncertainties.


<br>
<br>
<br>
<br>

---

## **Project Objectives**

The objective of this project is to analyze healthcare claims data to:

1. **Identify patterns in claim denials and underpayments**
2. **Predict claim outcomes and delays**
3. Provide actionable insights for stakeholders to reduce processing time, minimize denials, and enhance revenue cycle performance.

<br>
<br>
<br>
<br>

---

## **About the Dataset**

- The dataset structure and dictionary can be found [here](https://github.com/jowo21/-Improving-Healthcare-Claims-Processing-and-Financial-Performance/blob/main/about_dataset.md)
- The SQL code generated to perform exploratory data analysis can be found [here](https://github.com/jowo21/-Optimizing-Healthcare-Claims-Processing-and-Financial-Performance-through-Data-Analysis/blob/main/claims%20data%20EDA.sql)

<br>
<br>
<br>
<br>

---

## **Executive Summary**

The findings indicate that **administrative inefficiencies in claims processing are affecting both financial performance and clinical operations**, reinforcing the concerns that revenue cycle issues are extending beyond finance into care delivery.

- Claims outcomes are nearly evenly split: **36% paid, 31% partially paid, and 33% denied**, resulting in **$65,720 in revenue not reimbursed**. Additionally, over **half of all claims (52%) experienced delays**, requiring follow-up and rework, yet only **18% of delayed claims ultimately resulted in full payment**. This highlights a claims workflow that is both resource-intensive and inefficient.

- Denials and delays are not driven by payer mix or clinical complexity, as denial and delay rates remain consistent across insurance types, diagnosis codes, and procedure codes. Instead, the data points to **systemic front-end and documentation issues** as the dominant drivers. **Incorrect billing information (15.7% of all denials) and patient eligibility issues (13.6% of all denials)** together account for the largest share of denials and delays, representing preventable breakdowns in registration, coding, and claim preparation.

- **More than half of all claims (52%) required at least one follow‑up and were classified as delayed, and only 18% of these delayed claims resulted in a paid outcome.** Once a claim encounters friction, it is much less likely to be successfully reimbursed, which can discourage provision of certain services, delay scheduling of follow‑up visits, and increase workload for both clinical and administrative teams.

- Overall, the analysis shows that **claims performance challenges at ValleyCare are largely operational rather than clinical**, and that targeted improvements in front-end data quality, eligibility verification, and standardized documentation could substantially reduce denials, accelerate cash flow, and relieve clinicians of avoidable administrative burden.

<br>
<br>
<br>
<br>

## **Insights**

### Denial Analysis


 - Across its three main statuses of paid, denied, and partially paid, there exists an almost even split percentage across them with the denial rate being 33%, paid claims at 36%, and partially paid claims at 31%.

<img width="393" height="393" alt="image" src="https://github.com/user-attachments/assets/87554f3c-36b6-45d8-9447-0fcf36253baa" />

<br>
<br>

 - The Denial rate of 33% lead to $65,720 of revenue not paid.

 - Incorrect billing information contributed to the highest percentage of denials (15.7%) which amounted to a revenue loss of $11,607 followed by Patient eligibility issues (13.6%) and $7964 revenue loss.
<img width="862" height="387" alt="image" src="https://github.com/user-attachments/assets/bf3c27fa-19ba-466a-9dc3-aa34e99fc826" />

<br>
<br>

- Denied claims did slightly decrease over time, but since the data was only collected between May and September, it does not show a strong indication of contributing factors of improvements.
<img width="913" height="298" alt="image" src="https://github.com/user-attachments/assets/75084b24-4093-41fb-9799-1083995e2062" />

<br>
<br>

- The Denials by Procedure Codes did not reflect much difference among the various codes. Procedure Code 99221 had the highest denial counts at 49 which twice the denial count of the lowest denial procedure 99222 at 24 which may require code 99221 to be a target for improvement.
<img width="900" height="361" alt="image" src="https://github.com/user-attachments/assets/823b1157-4554-4481-aea7-fc446e16dadc" />


<br>
<br>

### Claim Delay Analysis

- Delayed claims are defined as claims that required a follow up which amounted to 52% of all claims.
- Only 35% of the claims that were delayed received a paid outcome.

- Similar to the Denial Rate, Patient Eligibility issues and Incorrect billing information were the largest contributing factors to delays.
<img width="851" height="338" alt="image" src="https://github.com/user-attachments/assets/5adfb088-8db7-4780-ae6e-8af7a83ce78e" />

- There was not much difference between delays by procedure code. The top 3 procedure codes that led to the most delays were 99231 , 99221, and 99215
<img width="832" height="530" alt="image" src="https://github.com/user-attachments/assets/9050008e-f9fc-46bf-9558-86853e697d4d" />


 - Although there was not much variance between the Insurance types and their delay amounts, Medicaid had the highest number of delays at 142
<img width="762" height="323" alt="image" src="https://github.com/user-attachments/assets/1df095fe-84f4-4f10-ad1e-a72abc8a5806" />

 - There also was not much difference between the Top 5 Diagnosis codes and the amount of delays, however with A05.4 having the highest amount, it may need to be monitored for improvements:
<img width="783" height="397" alt="image" src="https://github.com/user-attachments/assets/17861f3b-066e-4054-8097-572064dbe0b8" />

<br>
<br>


## **Other Insights based on Key Performance Indicators**

- The Payment Ratio (ratio of total billed amounts to total paid amounts) is 1.48 which reflects that there was no evidence in overpayments made.

- The average adjustment percentage is 25%. 49.6% of the claims were above average which can be a sign of high billing inefficiency.

- Over time, the average adjustment percentage slightly decreased:
<img width="785" height="465" alt="image" src="https://github.com/user-attachments/assets/774e7390-6dbc-417e-8992-f9c1b960e2a3" />

- The collection rate (paid amounts/billing amounts) slightly increased over time
<img width="811" height="450" alt="image" src="https://github.com/user-attachments/assets/28916c00-7a75-4ea6-a39b-aaacea7839b5" />

<br>
<br>
<br>
<br>

## **Recommendations**

### **1. Reduce Claim Denials and Delays by Correcting Billing and Eligibility Errors at the Front End**

**Actions:**

- Implement or reinforce real-time eligibility verification at registration, with special emphasis on new patients and high-complexity visits
- Standardize the collection and validation of critical billing fields (coverage type, member ID, demographics) prior to claim submission
- Provide targeted training and quick-reference tools for registration and billing staff focused on the most error-prone fields
- Track and report denial and delay rates **specifically attributable to billing and eligibility issues** to guide coaching and process improvement
- Introduce short eligibility and billing checklists or scripts to be used before claim initiation

**Expected Impacts:**

- Up to **7% reduction in overall claim delays**
- Approximately **5% reduction in denial rates**
- Faster claim resolution and reduced rework for staff
- Improve patient experience through fewer billing disruptions

---

### **2. Standardize Documentation for High-Risk Procedure Codes to Minimize Denials**

**Actions:**

- Target procedure codes with the highest denial and delay rates
- Develop structured documentation templates or smart phrases to ensure consistent capture of medical necessity and required clinical details
- Monitor a small, recurring sample of encounters for these procedures to validate documentation quality and compliance
- Share feedback with clinicians and coders to reinforce best practices

**Expected Impacts:**

- Reduce variability in documentation quality
- Lower denial rates for high-risk procedures
- Improve coding accuracy and reimbursement consistency
- Less administrative burden on clinicians from rework and clarifications

---

### **3. Use Underpayment and Adjustment Patterns as Early Indicators of Revenue Cycle Inefficiency**

**Actions:**

- Monitor claims with paid amounts ≤65% of billed charges and those with above-average adjustment rates
- Flag these claims for targeted review of documentation, coding, and charge capture processes
- Identify recurring root causes and clarify documentation requirements needed from clinicians
- Align coding and clinical teams on expectations to reduce low-value back-and-forth

**Expected Impacts:**

- Reduce underpayments and unnecessary adjustments
- Improve alignment between clinical documentation and coding requirements
- Increase net revenue capture
- Decrease clinician frustration related to repeated documentation requests

---

### 

---

### **4. Validate Findings and Track Improvement Through Extended Data Collection**

**Actions:**

- Extend the analysis timeframe to cover an additional **6–12 months** of data
- Re-establish baseline metrics for denial rates, delays, and underpayment patterns
- Use the expanded dataset to confirm trend stability and seasonal effects
- Measure the impact of implemented changes on financial performance and operational efficiency

**Expected Impact:**

- Obtain more reliable insights
- Increase confidence in prioritization decisions
- Create a more valid sustainable framework for ongoing performance monitoring
















