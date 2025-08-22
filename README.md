# Bike-Share Case Study 🚲

This project is part of the **Google Data Analytics Capstone**.  
The analysis focuses on a U.S.-based bike-share company that aims to convert casual riders into annual members.  

Using **SQL** for data cleaning and processing, and **Tableau** for visualization, this project explores how annual members and casual riders use bikes differently and provides data-driven insights that can help shape marketing and business strategies.

📄 A detailed step-by-step documentation of the full analysis process (from **Ask** to **Visualize**) can be found here:  
[Full Case Study Documentation](https://www.remnote.com/a/68654840d57460018a1f14f0)

---

## Project Overview & Business Task

The purpose of this case study is to analyze one year of historical bike-share data (2024) to understand usage patterns between **casual riders** and **annual members**.  
The ultimate business goal is to provide insights that will help the company **encourage casual riders to convert into annual members**.  

### Business Task
- Identify differences in usage between annual members and casual riders.  
- Understand what factors might motivate casual riders to become members.  
- Detect seasonal or weekly patterns in casual riders' behavior.  
- Explore average ride duration for casual users compared to members.  

---

## Tools & Technologies

- **SQL (Microsoft SQL Server):** Used for data cleaning, transformation, and feature engineering (e.g., ride length, day of week).  
- **Tableau:** Used for data visualization and dashboard creation to identify trends and communicate insights.  
- **PowerPoint:** Used for presenting the final findings to stakeholders.  

---

## Data Cleaning & Processing

Data preparation was performed in **SQL Server** to ensure the dataset was ready for analysis.  
Key steps included:

- **Handling missing values:**  
  - About 20% of start and end station fields were missing.  
  - Replaced `NULL` values with `"Dockless_Start"` and `"Dockless_End"` to preserve records instead of dropping them.  
  - Found that ~35% of electric bike trips were missing station data, which may indicate a system recording issue.  

- **Detecting and removing invalid records:**  
  - Identified a small number of trips where the end time was earlier than the start time (0.0017%).  
  - These rows were removed as they represented invalid records.  

- **Creating new features:**  
  - `ride_length`: Duration of each trip in seconds (later converted to minutes in Tableau).  
  - `day_of_week`: Extracted weekday from trip start time to analyze weekly patterns.  

- **Validating categorical values:**  
  - Checked for typos and inconsistent entries using `DISTINCT` on key columns (e.g., `rideable_type`, `member_casual`).  
  - Confirmed all values were valid and consistent.  

---

بالتأكيد، سأقوم بإكمال ملف `README.md` بنفس الأسلوب الاحترافي الذي بدأت به، مع التركيز على مرحلتي التحليل (Analysis) والتصور (Visualizations) التي ذكرتها.

سأضيف قسمين جديدين يوضحان النتائج الرئيسية التي توصلت إليها من تحليل البيانات، بالإضافة إلى قسم يعرض التصورات البيانية التي قمت بإنشائها.

-----

Here is the continuation of your `README.md` file:


---

## Analysis & Key Findings

The analysis focused on answering the business questions by exploring key usage metrics for casual riders. The findings provide a clear roadmap for the marketing and business teams.

### Key Insights

- **User Segments:** Casual riders make up a significant portion of the user base (36.7%) and have an average ride duration that is more than double that of annual members (25.15 minutes vs. 12.77 minutes). This suggests that casual users are often on recreational trips and represent a prime target for conversion.

- **Temporal Patterns:**
    - **Weekly Peaks:** Both ride duration and ride count for casual riders peak on weekends (Friday, Saturday, and Sunday). This is the ideal time to launch targeted marketing campaigns.
    - **Seasonal Trends:** The highest average ride duration for casual riders occurs during the warmer months, from April to August. This highlights the importance of seasonal marketing efforts and potentially offering a seasonal membership option.

- **Geographical Hotspots:** The most frequently used routes by casual riders are concentrated around popular recreational areas in Chicago, such as Streeter Dr, DuSable Lake Shore Dr, and Millennium Park. Targeting these specific station locations with promotional materials would be highly effective.

---

## Visualizations

The insights gained from the SQL analysis were brought to life using Tableau, a powerful data visualization tool. A complete dashboard was created to present the findings in an accessible and impactful way.

- **User Segmentation Chart:** A pie chart showing the proportion of annual members vs. casual riders, visually confirming the size of the target audience.

- **Ride Duration Comparison:** A combo chart (bar and line) illustrating the relationship between average ride duration and ride count for casual riders over the days of the week, clearly showing the weekend peak.

- **Monthly Trend Analysis:** A line chart depicting the average ride duration for casual riders over the course of the year, highlighting the summer spike and providing a basis for seasonal promotions.

- **Top Routes & Stations:** A horizontal bar chart identifying the top 10 most used routes by casual riders, which helps pinpoint key locations for on-the-ground marketing initiatives.

---

## Conclusion & Recommendations

The analysis successfully identified key usage patterns among casual riders. Based on these findings, we recommend:

1.  **Targeted Marketing Campaigns:** Launch promotional campaigns during peak times (weekends) and peak seasons (April-August).
2.  **Flexible Membership Options:** Introduce short-term or seasonal memberships to cater to recreational riders who are not interested in a full annual commitment.
3.  **Loyalty Rewards Program:** Implement a Loyalty Rewards Program, To earn points that give a discount on the annual subscription
.

This project demonstrates how data-driven insights can directly inform and optimize business strategies to achieve specific goals.
