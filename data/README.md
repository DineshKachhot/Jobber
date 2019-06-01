https://www.npmjs.com/package/node-firestore-import-export


Export All
--
firestore-export --accountCredentials jobber-c8767-firebase-adminsdk-uqswa-03ce9e36f0.json --backupFile backup_20190601_1433.json --prettyPrint


Export from a specific path (and all its children/collections)
--
firestore-export --accountCredentials jobber-c8767-firebase-adminsdk-uqswa-03ce9e36f0.json --backupFile skills.json --nodePath skills



Import to a specific path
--
firestore-import --accountCredentials jobber-c8767-firebase-adminsdk-uqswa-03ce9e36f0.json --backupFile jobs.json --nodePath jobs

firestore-import --accountCredentials jobber-c8767-firebase-adminsdk-uqswa-03ce9e36f0.json --backupFile skills.json --nodePath skills
