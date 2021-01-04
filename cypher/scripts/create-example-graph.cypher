CREATE
  // Persons
  (pA:Person {id: 1, firstName: 'Amelie',   lastName: '', creationDate: datetime('2010-06-10T11:05:56.000+00:00')}),
  (pB:Person {id: 2, firstName: 'Bernardo', lastName: '', creationDate: datetime('2010-06-10T11:05:56.000+00:00')}),
  (pC:Person {id: 3, firstName: 'Cedric',   lastName: '', creationDate: datetime('2010-06-10T11:05:56.000+00:00')}),
  (pD:Person {id: 4, firstName: 'Diane',    lastName: '', creationDate: datetime('2010-06-10T11:05:56.000+00:00')}),
  (pE:Person {id: 5, firstName: 'Eve',      lastName: '', creationDate: datetime('2010-06-10T11:05:56.000+00:00')}),
  (pA)-[:KNOWS {creationDate: datetime('2010-06-10T11:05:56.000+00:00')}]->(pB),
  (pA)-[:KNOWS {creationDate: datetime('2010-06-10T11:05:56.000+00:00')}]->(pC),
  (pA)-[:KNOWS {creationDate: datetime('2010-06-10T11:05:56.000+00:00')}]->(pD),
  (pB)-[:KNOWS {creationDate: datetime('2010-06-10T11:05:56.000+00:00')}]->(pC),
  (pC)-[:KNOWS {creationDate: datetime('2010-06-10T11:05:56.000+00:00')}]->(pD),
  (pD)-[:KNOWS {creationDate: datetime('2010-06-10T11:05:56.000+00:00')}]->(pE),
  // Organisations
  (cambridge:Organisation:University {id: 1, name: 'Cambridge'}),
  (softengco:Organisation:Company {id: 2, name: 'SoftEngCo'}),
  (pA)-[:STUDY_AT {classYear: 2008}]->(cambridge),
  (pD)-[:STUDY_AT {classYear: 2006}]->(cambridge),
  (pE)-[:STUDY_AT {classYear: 2008}]->(cambridge),
  (pA)-[:WORK_AT]->(softengco),
  // Places
  (spain:Place:Country {id: 1, name: 'Spain'}),
  (madrid:Place:City {id: 2, name: 'Madrid'}),
  (france:Place:Country {id: 3, name: 'France'}),
  (paris:Place:City {id: 4, name: 'Paris'}),
  (lyon:Place:City {id: 5, name: 'Lyon'}),
  (madrid)-[:IS_PART_OF]->(spain),
  (paris)-[:IS_PART_OF]->(france),
  (lyon)-[:IS_PART_OF]->(france),
  (pA)-[:IS_LOCATED_IN]->(paris),
  (pB)-[:IS_LOCATED_IN]->(madrid),
  (pC)-[:IS_LOCATED_IN]->(lyon),
  (pD)-[:IS_LOCATED_IN]->(paris),
  // TagClasses
  (tc1:TagClass {id: 1, name: 'Holiday resorts'}),
  (tc2:TagClass {id: 2, name: 'Ski resorts'}),
  (tc3:TagClass {id: 3, name: 'Sports'}),
  (tc2)-[:IS_SUBCLASS_OF]->(tc1),
  // Tags
  (t1:Tag {id: 1, name: 'Pyrenees'}),
  (t2:Tag {id: 2, name: 'Snowboard'}),
  (pB)-[:HAS_INTEREST]->(t1),
  (pD)-[:HAS_INTEREST]->(t2),
  (t1)-[:HAS_TYPE]->(tc2),
  (t2)-[:HAS_TYPE]->(tc3),
  // Forums
  (forum1:Forum {id: 1, creationDate: datetime('2011-10-10T11:01:47.000+00:00'), title: 'Skiing trips'}),
  (forum2:Forum {id: 2, creationDate: datetime('2012-02-01T13:07:26.000+00:00'), title: 'Cinéma'}),
  (forum1)-[:HAS_TAG]->(t1),
  (forum1)-[:HAS_MEMBER]->(pA),
  (forum1)-[:HAS_MEMBER]->(pB),
  (forum1)-[:HAS_MODERATOR]->(pB),
  (forum1)-[:HAS_MEMBER]->(pC),
  (forum2)-[:HAS_MEMBER]->(pC),
  (forum2)-[:HAS_MODERATOR]->(pC),
  (forum2)-[:HAS_MEMBER]->(pA),
  // Messages,
  (p1:Message:Post    {id: 10, creationDate: datetime('2011-10-10T11:05:56.000+00:00'), length: 24, content: 'We should go to Hautacam', language: 'en'}),
  (c1:Message:Comment {id:  1, creationDate: datetime('2011-10-10T11:08:01.000+00:00'), length: 24, content: 'Yes, I like the Pyrenees'}),
  (c2:Message:Comment {id:  2, creationDate: datetime('2011-10-10T11:07:42.000+00:00'), length: 57, content: 'We should go to a place with better options for snowboard'}),
  (c3:Message:Comment {id:  3, creationDate: datetime('2011-10-10T11:20:37.000+00:00'), length: 34, content: 'Hautacam is great for snowboarding'}),
  (c4:Message:Comment {id:  4, creationDate: datetime('2012-02-15T09:47:23.000+00:00'), length: 58, content: 'It was a great place for snowboarding. Glad we went there!'}),
  (c5:Message:Comment {id:  5, creationDate: datetime('2012-02-15T10:24:26.000+00:00'), length: 13, content: 'It was great!'}),
  (p2:Message:Post    {id: 20, creationDate: datetime('2012-03-04T11:05:56.000+00:00'), length: 38, content: 'Voici un film de snowboard intéressant', language: 'fr'}),
  (c6:Message:Comment {id:  6, creationDate: datetime('2012-03-04T10:24:26.000+00:00'), length: 37, content: "Merci, j'adore les films de snowboard"}),
  (forum1)-[:CONTAINER_OF]->(p1),
  (forum2)-[:CONTAINER_OF]->(p2),
  (c1)-[:REPLY_OF]->(p1),
  (c2)-[:REPLY_OF]->(p1),
  (c3)-[:REPLY_OF]->(c2),
  (c4)-[:REPLY_OF]->(c3),
  (c5)-[:REPLY_OF]->(c4),
  (c6)-[:REPLY_OF]->(p2),
  (pA)-[:LIKES]->(p1),
  (pB)-[:LIKES]->(c2),
  (pB)-[:LIKES]->(c3),
  (pC)-[:LIKES]->(p1),
  (pC)-[:LIKES]->(c4),
  (p1)-[:HAS_CREATOR]->(pB),
  (c1)-[:HAS_CREATOR]->(pC),
  (c2)-[:HAS_CREATOR]->(pA),
  (c3)-[:HAS_CREATOR]->(pC),
  (c4)-[:HAS_CREATOR]->(pA),
  (c5)-[:HAS_CREATOR]->(pD),
  (p2)-[:HAS_CREATOR]->(pC),
  (c6)-[:HAS_CREATOR]->(pA),
  (p1)-[:HAS_TAG]->(t1),
  (c1)-[:HAS_TAG]->(t1),
  (c3)-[:HAS_TAG]->(t1),
  (c2)-[:HAS_TAG]->(t2),
  (c3)-[:HAS_TAG]->(t2),
  (c4)-[:HAS_TAG]->(t2),
  (p2)-[:HAS_TAG]->(t2),
  (c6)-[:HAS_TAG]->(t2)
