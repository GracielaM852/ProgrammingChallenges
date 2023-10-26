#I used data.world to write the queries by uploading the files/csv hence the table names are different from the ones created in the DB. 

#Question1, Write a query to get the sum of impressions by day.

SELECT date as Day, SUM(impressions) as Total_Impressions
FROM marketing_performance
Group by date
Order by date

#Question2, Write a query to get the top three revenue-generating states in order of best to worst.
# How much revenue did the third best state generate?

Select state, SUM(revenue) as Total_Revenue
From website_revenue
Group by state
Order by SUM(revenue) DESC
#The third best state, Ohio, generated 37577

#Question3, Write a query that shows total cost, impressions, clicks, and revenue of each campaign. 
#Make sure to include the campaign name in the output.
Select name as Campaign_name, SUM(cost) as Total_Cost, Sum(impressions) as Total_Impressions, SUM(clicks) as Total_Clicks, Sum(revenue) as Total_Revenue
From campaign_info, marketing_performance, website_revenue
Where campaign_info.id = marketing_performance.campaign_id
And marketing_performance.campaign_id = website_revenue.campaign_id
Group by name
Order by name


#Question4, Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?

Select name, geo, sum(conversions) as conversions_total
FROM campaign_info, marketing_performance
WHERE campaign_info.id= marketing_performance.campaign_id
AND name = 'Campaign5'
Group by name, geo
Order by name, geo
Georgia generated the most conversions for Campaign5.


#Question5, In my opinion, one of the best ways to evaluate efficiency is by looking at ROI (return on investment).
#Efficiency is all about how well resources are allocated. Thus, by evaluating the profitability of the campaigns 
#relative to its cost, campaign4 was the most efficient because it had the greatest ROI.  

#SQL script below helped me answer this question.

Select name as Campaign_name, SUM(cost) as Total_Cost, Sum(impressions) as Total_Impressions, SUM(clicks) as Total_Clicks, Sum(revenue) as Total_Revenue, (Sum(revenue)-Sum(cost)) as Profit, ((Sum(revenue)-Sum(cost))/(Sum(cost))*100) as ROI
From campaign_info, marketing_performance, website_revenue
Where campaign_info.id = marketing_performance.campaign_id
And marketing_performance.campaign_id = website_revenue.campaign_id
Group by name
Order by name

#Bonus Question6, Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads#

SELECT DAYNAME(date) AS Day_OF_THE_WEEK, AVG(impressions) AS avg_impressions, AVG(clicks) AS avg_clicks, AVG(conversions) AS avg_conversions
FROM marketing_performance
GROUP BY DAYNAME(date)
ORDER BY DAYNAME(date)

