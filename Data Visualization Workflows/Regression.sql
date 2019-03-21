-- I incorporated this SQL code into an FME workflow that 
-- 1) calculated the scaling exponent β, 2) Calcualted the difference between the anticipated value and actual value of an urban indicator

--For use in FME Workflow
SELECT 
		  @Value(indicator) AS indicator
		, regr_intercept(@Value(indicator),population15) AS intercept
        , regr_slope(@Value(indicator),population15) AS beta
        , regr_r2(@Value(indicator),population15) AS rsq
        , regr_count(@Value(indicator),population15) AS obs

FROM final.indicateurs_ln


--Debugging
SELECT 
		  'employment15' AS indicator
		, regr_intercept(employment15,population15) AS intercept
        , regr_slope(employment15,population15) AS beta
        , regr_r2(employment15,population15) AS rsq
        , regr_count(employment15,population15) AS obs

FROM final.indicateurs_ln


-- Gets the name of each column in row form
SELECT column_name as indicator, ROW_NUMBER() OVER() as index
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'indicateurs_ln'