SELECT districts.name, per_pupil_expenditure, exemplary FROM districts
JOIN expenditures ON districts.id = expenditures.district_id
JOIN staff_evaluations ON districts.id = staff_evaluations.district_id
WHERE type LIKE 'Public School%'
    AND per_pupil_expenditure > (
        SELECT AVG(per_pupil_expenditure)
        FROM expenditures
    )
    AND exemplary > (
        SELECT AVG(exemplary)
        FROM staff_evaluations
    )
ORDER BY exemplary DESC, per_pupil_expenditure DESC;
