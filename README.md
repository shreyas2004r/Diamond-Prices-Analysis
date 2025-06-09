# Diamond-Prices-Analysis

Amongst the multitude of options that proliferates the luxury industry, the reliability and allure
of Diamonds withstands the test of time. Seen as the epitome of luxurial status in a USD56.5
billion industry, diamonds remain highly sought after especially by jewelry and luxury watch
brands. Diamonds also see use within the construction industry, where diamonds of different
calibers and grades are leveraged for mining. As such, knowing the worth of diamonds and what
variables affect its price plays an instrumental role for those involved with it’s usage
In this project, a dataset containing details of 54,000 diamonds is used. Variables/Characteristics
of the diamonds include its Price, Carat, Cut, Color, Clarity…

Data Description 
1. price: price in US dollars (\$326--\$18,823)
2. carat: weight of the diamond (0.2--5.01)
3. cut: quality of the cut (Fair, Good, Very Good, Premium, Ideal)
4. color: diamond colour, from J (worst) to D (best)
5. clarity: a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1,
VVS2, VVS1, IF (best))
6. x: length in mm (0--10.74)
7. y: width in mm (0--58.9)
8. z: depth in mm (0--31.8)
9. depth: total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43--79)
10. table: width of top of diamond relative to widest point (64--95)

Diamonds are a luxury jewelry that people often look to when purchasing for special occasions
such as weddings and engagement rings, and purchasing them can often consist of a significant
portion of an individual's savings and income. Therefore having the information of what factors
into the prices of diamonds can help an individual form a more informed decision for their
purchases. We attempt to answer some of these questions with our analysis done in this report.
From our results, we can conclude the following:
● Carat of the diamond, which also includes length, width and height within it, will
increase price significantly with a corresponding increase.
● Depth of the diamond does not affect its price.
● The categorical variables are not independent of each other.
● Clarity affects price, with SI2 generally corresponding to a higher priced diamond and IF
to a lower priced one
● Cut affects the price, with Fair cuts corresponding to higher priced diamonds and
decreases with each cut level with Ideal being the least
● Colour affects price, with better colors being higher priced
We are also able to model the price via a linear model with the factors of carat, depth and table,
although the depth and table does not affect the price significantly as carat does. The two factors
also decreases price with an increase in their values, while the opposite is true for the carat which
is also shown in the linear model equation.
These conclusions are however only made with the one dataset that we have used for the report,
therefore a full analysis of the whole market may change the values and significance of the
factors. Another thing to take note is that the value of diamonds are tied to both its supply and
also its perception as a jewelry. Decreases in the world's supply of diamond will eventually also
affect prices in the long run. Furthermore the beauty of diamonds is subjective and it can be
possible for the demand to shift preferences to other factors for example the table of the diamond
instead of carat following fashion trends, hence these results that we obtain now may nor always
hold true.
