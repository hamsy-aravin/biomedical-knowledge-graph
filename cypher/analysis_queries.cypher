// Biomedical Knowledge Graph Analysis Queries
// Project: Neo4j Gene Expression and Disease Relationship Graph


// 1. View full graph sample
MATCH (p:Patient)-[r]->(n)
RETURN p, r, n
LIMIT 100;


// 2. Count nodes by label
MATCH (n)
RETURN labels(n) AS NodeLabel, count(n) AS Count
ORDER BY Count DESC;


// 3. Count relationship types
MATCH ()-[r]->()
RETURN type(r) AS RelationshipType, count(r) AS Count
ORDER BY Count DESC;


// 4. Average gene expression by smoking status
MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene),
      (p)-[:HAS_SMOKING_STATUS]->(s:SmokingStatus)
RETURN g.name AS Gene,
       s.SmokingStatus AS SmokingStatus,
       avg(r.level) AS AverageExpression
ORDER BY Gene, SmokingStatus;


// 5. Average gene expression by disease status
MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene),
      (p)-[:HAS_DISEASE_STATUS]->(d:DiseaseStatus)
RETURN g.name AS Gene,
       d.DiseaseStatus AS DiseaseStatus,
       avg(r.level) AS AverageExpression
ORDER BY Gene, DiseaseStatus;


// 6. Average gene expression by treatment response
MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene),
      (p)-[:HAS_TREATMENT_RESPONSE]->(t:TreatmentResponse)
RETURN g.name AS Gene,
       t.TreatmentResponse AS TreatmentResponse,
       avg(r.level) AS AverageExpression
ORDER BY Gene, TreatmentResponse;


// 7. Patient count by disease status
MATCH (p:Patient)-[:HAS_DISEASE_STATUS]->(d:DiseaseStatus)
RETURN d.DiseaseStatus AS DiseaseStatus,
       count(p) AS PatientCount
ORDER BY DiseaseStatus;


// 8. Patient count by smoking status
MATCH (p:Patient)-[:HAS_SMOKING_STATUS]->(s:SmokingStatus)
RETURN s.SmokingStatus AS SmokingStatus,
       count(p) AS PatientCount
ORDER BY SmokingStatus;


// 9. Patient count by treatment response
MATCH (p:Patient)-[:HAS_TREATMENT_RESPONSE]->(t:TreatmentResponse)
RETURN t.TreatmentResponse AS TreatmentResponse,
       count(p) AS PatientCount
ORDER BY TreatmentResponse;


// 10. Patients with highest Gene X expression
MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene)
WHERE g.name = 'Gene X'
RETURN p.PatientID AS PatientID,
       p.Age AS Age,
       p.Gender AS Gender,
       r.level AS GeneXExpression
ORDER BY GeneXExpression DESC
LIMIT 10;


// 11. Patients with highest Gene Y expression
MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene)
WHERE g.name = 'Gene Y'
RETURN p.PatientID AS PatientID,
       p.Age AS Age,
       p.Gender AS Gender,
       r.level AS GeneYExpression
ORDER BY GeneYExpression DESC
LIMIT 10;
