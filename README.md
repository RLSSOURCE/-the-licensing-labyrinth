🏛️ The Licensing Labyrinth
A Data-Driven Case Study on Microsoft Licensing Complexity
> *"Where Data Meets Bureaucracy — And Only One Survives."*
By Ruben Santana — Data Analyst | Professional Licensing Survivor
---
📌 The Story
I tried to buy Power BI Premium Per User. I had Business Standard, Business Basic, admin rights, a U.S. tenant, and self-service enabled.
Microsoft said: "You are not eligible to buy this product."
So I did what any reasonable data analyst would do — I tracked every failed attempt, scored my own frustration levels, and turned the whole nightmare into an analytics project.
24 licensing attempts. 20 failures. 393 minutes lost. 1 dashboard.
---
📊 Dashboard
![The Licensing Labyrinth Dashboard](The_Licensing_Labyrinth_Dashboard.png)
🔗 View Live Interactive Dashboard on Power BI Service
---
🔍 Key Findings
Metric	Value
Total Licensing Attempts	24
Failed Attempts	20 (83%)
Total Time Lost	393 minutes (6.55 hours)
Support Escalations	7
MCA Billing Block Rate	83.33%
Average Frustration Score	6.83 / 10
Peak Frustration	10 / 10
---
🛠️ Tools & Technologies
Tool	Purpose
Microsoft Excel	Data collection, formula-driven analysis, dashboard prototype
SQL	Schema design, data inserts, 9 analytics queries including window functions
Power BI Desktop	Interactive dashboard with DAX measures, slicers, cross-filtering
DAX	Custom KPI measures (% MCA Blocked)
Python	Data analysis scripts (Pandas, Matplotlib)
---
📁 Project Structure
```
the_licensing_labyrinth/
├── the_licensing_labyrinth.xlsx          # Source data (6 tabs: Cover, Data, Analysis, Dashboard, SQL, BI Guide)
├── LicensingLabyrinth_Analytics.sql      # Full SQL analytics suite (schema + queries)
├── The_Licensing_Labyrinth_Dashboard.pbix # Power BI report file
├── The_Licensing_Labyrinth_Portfolio.pdf  # Polished portfolio case study (11 pages)
├── The_Licensing_Labyrinth_Dashboard.png  # Dashboard screenshot
├── licensing_labyrinth_journey_flowchart.png  # User journey flowchart
├── frustration_score_emotional_journey.png    # Frustration score visualization
└── README.md
```
---
🗄️ Data Model
Two structured datasets capture the licensing journey:
licensing_attempts (24 rows)
Tracks every product the user attempted to purchase, the outcome, the error message, the billing account type, time lost, and whether support was contacted.
frustration_scores (12 rows)
A self-reported frustration journal across 4 phases: Discovery → Troubleshooting → Escalation → Resolution.
---
📈 SQL Highlights
Total time lost on failed attempts:
```sql
SELECT SUM(time_lost_min) AS total_minutes_lost,
       ROUND(SUM(time_lost_min)/60.0, 1) AS total_hours_lost
FROM licensing_attempts
WHERE result = 'Failed';
-- Result: 331 minutes (5.5 hours) on failures alone
```
Running frustration with window functions:
```sql
SELECT step_order, step, phase, frustration_score,
       SUM(frustration_score) OVER (ORDER BY step_order) AS cumulative,
       frustration_score - LAG(frustration_score) OVER (ORDER BY step_order) AS delta_vs_prev
FROM frustration_scores
ORDER BY step_order;
```
DAX Measure — % MCA Blocked:
```dax
Pct MCA = DIVIDE(
    CALCULATE(COUNTROWS(licensing_attempts),
        licensing_attempts[billing_account]="MCA"),
    COUNTROWS(licensing_attempts)
)
-- Result: 83.33%
```
---
💡 Root Cause
The entire problem was caused by a billing system mismatch: MCA (Microsoft Customer Agreement) vs. Microsoft 365 Commerce. Products like Power BI PPU, Copilot, Teams Premium, and Microsoft Fabric cannot be purchased from an MCA billing account — but the admin center never tells you this. The "Purchase services" page is simply missing.
The only resolution: contact Microsoft support and request a manual billing account conversion.
---
📋 Recommendations
For Microsoft
Unify MCA and M365 Commerce billing systems
Improve error messaging with actionable guidance
Add a self-service "Convert billing account" button
Surface billing account type in the admin center UI
For Users & IT Admins
Verify billing account type before purchasing add-ons
Document licensing attempts for support escalation
Contact support early — don't troubleshoot in circles
---
🎭 The Emotional Journey
The frustration score tracked across 12 steps tells the real story:
```
Step 1:  Initial PPU attempt ........... 😐 3/10
Step 3:  Missing Purchase Services ..... 😤 6/10
Step 7:  Discovered MCA billing ........ 😡 8/10
Step 11: Decision to contact support ... 🤯 10/10
Step 12: Awaiting billing conversion ... 😮‍💨 7/10
```
---
📄 Portfolio Document
The full 11-page portfolio PDF includes:
Executive summary with key metrics
Problem statement and data model documentation
SQL analysis with query results
Power BI and Excel dashboard screenshots
Insights, findings, and recommendations
Tools and technologies used
📥 Download the Portfolio PDF
---
🤝 About This Project
This is an independent portfolio project created for educational and demonstrative purposes. All data is simulated/fictional based on a real personal experience and does not represent actual Microsoft figures, systems, or internal information.
Microsoft, Power BI, Copilot, and related names are trademarks of Microsoft Corporation. This project is not affiliated with, sponsored, or endorsed by Microsoft.
---
📬 Connect
Ruben Santana
🔗 LinkedIn
📊 Power BI Dashboard
---
RLS//DATA — "Because someone has to make sense of this."
