SELECT
    st.student_id,
    st.student_name,
    su.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM Students AS st
CROSS JOIN Subjects AS su
LEFT JOIN Examinations AS e
ON e.student_id = st.student_id
AND su.subject_name = e.subject_name
GROUP BY st.student_id, st.student_name, su.subject_name
ORDER BY st.student_id;