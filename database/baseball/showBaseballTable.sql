SELECT p.*
FROM PITCHERS p, (SELECT MAX(p2.salary) as ss
    FROM PITCHERS p2
    WHERE p2.pid NOT IN (
        SELECT p.pid
        FROM RECORDS r, PITCHERS p
        WHERE p.pid = r.starting_pitcher_home OR p.pid = r.starting_pitcher_away)),
        
        (SELECT p2.pid as pp
    FROM PITCHERS p2
    WHERE p2.pid NOT IN (
        SELECT p.pid
        FROM RECORDS r, PITCHERS p
        WHERE p.pid = r.starting_pitcher_home OR p.pid = r.starting_pitcher_away))
WHERE p.pid = pp AND p.salary = ss