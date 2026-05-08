# biomedical-knowledge-graph
Biomedical knowledge graph built using Neo4j and Cypher for modelling patient, disease, smoking, treatment response, and gene-expression relationships.
# Biomedical Knowledge Graph using Neo4j

## Project Overview

This project explores the use of graph databases in biomedical data modelling using Neo4j and Cypher. A biomedical knowledge graph was developed from a gene expression and disease relationship dataset to model interactions between patients, disease status, smoking behaviour, treatment response, age groups, and gene-expression profiles.

The project demonstrates how graph databases can represent complex biomedical relationships more intuitively than traditional relational databases.

---

## Objectives

- Build a biomedical knowledge graph using Neo4j
- Model patient clinical and gene-expression relationships
- Explore graph traversal and querying using Cypher
- Analyse gene-expression patterns across clinical variables
- Demonstrate graph-based data modelling in a bioinformatics context

---

## Technologies Used

- Neo4j
- Cypher Query Language
- Neo4j Data Importer
- CSV Data Modelling
- Biomedical Data Analysis

---

## Dataset

Dataset used:

Gene Expression Analysis and Disease Relationship Dataset from Kaggle.

The dataset contains hypothetical patient information including:
- Patient ID
- Age
- Gender
- Smoking Status
- Disease Status
- Treatment Response
- Gene Expression Measurements

---

## Graph Data Model

The biomedical knowledge graph contains the following node labels:

- Patient
- Gene
- DiseaseStatus
- SmokingStatus
- TreatmentResponse
- AgeGroup

### Relationships

cypher (:Patient)-[:HAS_DISEASE_STATUS]->(:DiseaseStatus)  (:Patient)-[:HAS_SMOKING_STATUS]->(:SmokingStatus)  (:Patient)-[:HAS_TREATMENT_RESPONSE]->(:TreatmentResponse)  (:Patient)-[:HAS_AGE_GROUP]->(:AgeGroup)  (:Patient)-[:EXPRESSES]->(:Gene) 

Gene expression values are stored as relationship properties:

cypher r.level 

---

## Biomedical Knowledge Graph

Graph

---

## Example Cypher Queries

### Average gene expression by smoking status

cypher MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene),       (p)-[:HAS_SMOKING_STATUS]->(s:SmokingStatus) RETURN g.name AS Gene,        s.SmokingStatus AS SmokingStatus,        avg(r.level) AS AverageExpression ORDER BY Gene, SmokingStatus; 

### Average gene expression by disease status

cypher MATCH (p:Patient)-[r:EXPRESSES]->(g:Gene),       (p)-[:HAS_DISEASE_STATUS]->(d:DiseaseStatus) RETURN g.name AS Gene,        d.DiseaseStatus AS DiseaseStatus,        avg(r.level) AS AverageExpression ORDER BY Gene, DiseaseStatus; 

### Visualising the biomedical graph

cypher MATCH (p:Patient)-[r]->(n) RETURN p,r,n LIMIT 100; 

---

## Query Results

### Gene Expression by Smoking Status

Smoking Query

### Gene Expression by Disease Status

Disease Query

---

## Key Findings

- Gene expression patterns differed across smoking-status groups
- Disease-status categories showed variation in average gene-expression levels
- Graph modelling enabled intuitive traversal of connected biomedical relationships
- Neo4j provided a flexible framework for modelling patient-centric biological data

---

## Why Graph Databases for Biomedical Data?

Biomedical systems contain highly interconnected entities such as genes, diseases, treatments, and patient phenotypes. Traditional relational databases can struggle to efficiently represent these complex many-to-many relationships.

Graph databases such as Neo4j allow these relationships to be represented naturally using nodes and relationships, enabling efficient traversal, flexible modelling, and intuitive biological querying.

---

## Future Improvements

Potential future developments include:
- expanding to larger transcriptomics datasets
- integrating protein interaction networks
- implementing Neo4j Graph Data Science algorithms
- adding pathway enrichment analysis
- building interactive dashboards for graph exploration

---

## Repository Structure

text biomedical-knowledge-graph/ │ ├── data/ ├── cypher/ ├── screenshots/ ├── README.md └── neo4j_import_model.json 

---

## Author

Hamsathvani Aravinthan  
MSc Bioinformatics | Biomedical Data & Knowledge Graphs
