import 'dart:convert';
/// data : [{"leaveId":"969bd6fe-2ca9-4e6d-b59f-933d46b2accf","leaveName":"leave-name","description":"description","emergencyCall":"emergency-contact","isApproved":false,"leaveType":{"leaveTypeId":"eee16c5f-f765-4bb3-a5cb-e2a19d9de781","name":"Personal Leave","description":"","createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":null,"updatedBy":null,"updatedAtUtc":"0001-01-01T00:00:00"},"leaveTypeId":"eee16c5f-f765-4bb3-a5cb-e2a19d9de781","leavePriority":{"leavePriorityId":"059c1b9f-e602-49d1-ba30-abe342335659","name":"Normal","createdById":"163bb345-fe04-4828-a671-54e353167711","createdBy":null,"createdAtUtc":"2023-10-15T20:01:03.8924543","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:01:03.8924543"},"leavePriorityId":"059c1b9f-e602-49d1-ba30-abe342335659","fromDate":"2024-03-02T00:00:00","toDate":"2024-03-02T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":false,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2024-03-01T21:48:57.6120925","updatedById":"2b789954-354d-43c3-941b-f0b9c30ae41d","updatedBy":null,"updatedAtUtc":"2024-03-01T21:48:57.6120925"},{"leaveId":"3b4ddb02-03e8-4fa8-ad72-4dec5b7eb38c","leaveName":"leave-name","description":"description","emergencyCall":"emergency-contact","isApproved":false,"leaveType":{"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","name":"Urlaub","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:01:48.5868833"},"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","leavePriority":{"leavePriorityId":"2b7a1394-d312-4c14-855f-fce3a2d30c1e","name":"Sehr wichtig","createdById":"163bb345-fe04-4828-a671-54e353167711","createdBy":null,"createdAtUtc":"2023-10-15T20:00:51.7704229","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:00:51.7704229"},"leavePriorityId":"2b7a1394-d312-4c14-855f-fce3a2d30c1e","fromDate":"2023-12-27T00:00:00","toDate":"2024-01-12T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":false,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-11-21T13:43:02.9217039","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-12-06T15:21:28.9256482"},{"leaveId":"b76a8314-ece6-409e-8f75-4593c3699ebc","leaveName":"leave-name","description":"description","emergencyCall":"emergency-contact","isApproved":true,"leaveType":{"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","name":"Urlaub","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:01:48.5868833"},"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","leavePriority":{"leavePriorityId":"2b7a1394-d312-4c14-855f-fce3a2d30c1e","name":"Sehr wichtig","createdById":"163bb345-fe04-4828-a671-54e353167711","createdBy":null,"createdAtUtc":"2023-10-15T20:00:51.7704229","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:00:51.7704229"},"leavePriorityId":"2b7a1394-d312-4c14-855f-fce3a2d30c1e","fromDate":"2023-11-05T00:00:00","toDate":"2023-11-10T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":true,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-10-17T13:20:51.1768604","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-17T14:02:40.2544923"},{"leaveId":"569dd275-c1f3-4885-a8d3-234fade7556b","leaveName":"Urlaub","description":"wird dringend benötigt","emergencyCall":"0621-12345678","isApproved":true,"leaveType":{"leaveTypeId":"5736ba2d-2d48-4c3b-8323-c1664ba47be6","name":"Mutter- und Vaterschaftsurlaub","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:02:24.4282785"},"leaveTypeId":"5736ba2d-2d48-4c3b-8323-c1664ba47be6","leavePriority":null,"leavePriorityId":null,"fromDate":"2023-10-05T00:00:00","toDate":"2023-10-19T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":true,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-10-05T08:17:36.534421","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-05T09:28:23.4600764"},{"leaveId":"9963bc67-f644-4e7d-acf1-3879c7b177a6","leaveName":"gfh","description":"gh","emergencyCall":"ytyt","isApproved":true,"leaveType":{"leaveTypeId":"5736ba2d-2d48-4c3b-8323-c1664ba47be6","name":"Mutter- und Vaterschaftsurlaub","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:02:24.4282785"},"leaveTypeId":"5736ba2d-2d48-4c3b-8323-c1664ba47be6","leavePriority":null,"leavePriorityId":null,"fromDate":"2023-09-20T00:00:00","toDate":"2023-09-29T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":false,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-09-18T10:56:55.5365094","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-17T13:54:30.7518447"},{"leaveId":"559b22b5-d4b4-4688-8dbd-fe4a2c112892","leaveName":"abc","description":"abc","emergencyCall":"123","isApproved":true,"leaveType":{"leaveTypeId":"eee16c5f-f765-4bb3-a5cb-e2a19d9de781","name":"Personal Leave","description":"","createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":null,"updatedBy":null,"updatedAtUtc":"0001-01-01T00:00:00"},"leaveTypeId":"eee16c5f-f765-4bb3-a5cb-e2a19d9de781","leavePriority":null,"leavePriorityId":null,"fromDate":"2023-09-22T00:00:00","toDate":"2023-09-30T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":true,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-09-12T10:21:25.9916888","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-12T10:24:19.5268855"},{"leaveId":"6a34b355-4b5e-482e-b51d-a4a201299e68","leaveName":"Wedding Vacations","description":"My wedding is planned for the month of December 2023","emergencyCall":"03029773057","isApproved":true,"leaveType":{"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","name":"Urlaub","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:01:48.5868833"},"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","leavePriority":null,"leavePriorityId":null,"fromDate":"2023-12-17T00:00:00","toDate":"2023-12-31T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":true,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-09-10T22:32:46.6337964","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T22:39:15.4094078"},{"leaveId":"d7880d9d-c1f8-4430-b8af-cc225f0506e1","leaveName":"Wedding Vacations","description":"My wedding is planned for the month of December 2023","emergencyCall":"03029773057","isApproved":true,"leaveType":{"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","name":"Urlaub","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:01:48.5868833"},"leaveTypeId":"300893d7-409a-4a1a-8954-8cb94112f365","leavePriority":null,"leavePriorityId":null,"fromDate":"2023-12-17T00:00:00","toDate":"2023-09-30T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":true,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-09-10T22:24:47.4757129","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T22:41:43.9508467"},{"leaveId":"cdc1ad7a-7d59-4beb-96bc-8483df22e7eb","leaveName":"Sick Leave","description":"Sick","emergencyCall":"123","isApproved":true,"leaveType":{"leaveTypeId":"8abc73a7-e9e2-403d-bb15-2da7503a9211","name":"Krankmeldung","description":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:02:40.4093799"},"leaveTypeId":"8abc73a7-e9e2-403d-bb15-2da7503a9211","leavePriority":null,"leavePriorityId":null,"fromDate":"2023-09-10T00:00:00","toDate":"2023-09-10T00:00:00","onBehalf":{"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"},"onBehalfId":"19cc0518-b993-4f8f-901b-85c4068e7faa","isPaidLeave":false,"leavesRemaining":0,"allowedLeaves":0,"isNew":false,"createdById":"2b789954-354d-43c3-941b-f0b9c30ae41d","createdBy":null,"createdAtUtc":"2023-09-10T17:24:36.3712834","updatedById":"2b789954-354d-43c3-941b-f0b9c30ae41d","updatedBy":null,"updatedAtUtc":"2023-09-12T09:39:05.0219156"}]
/// isSuccess : true

LeavesModel leavesModelFromJson(String str) => LeavesModel.fromJson(json.decode(str));
String leavesModelToJson(LeavesModel data) => json.encode(data.toJson());
class LeavesModel {
  LeavesModel({
      List<Data>? data, 
      bool? isSuccess,}){
    _data = data;
    _isSuccess = isSuccess;
}

  LeavesModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _isSuccess = json['isSuccess'];
  }
  List<Data>? _data;
  bool? _isSuccess;
LeavesModel copyWith({  List<Data>? data,
  bool? isSuccess,
}) => LeavesModel(  data: data ?? _data,
  isSuccess: isSuccess ?? _isSuccess,
);
  List<Data>? get data => _data;
  bool? get isSuccess => _isSuccess;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['isSuccess'] = _isSuccess;
    return map;
  }

}

/// leaveId : "969bd6fe-2ca9-4e6d-b59f-933d46b2accf"
/// leaveName : "leave-name"
/// description : "description"
/// emergencyCall : "emergency-contact"
/// isApproved : false
/// leaveType : {"leaveTypeId":"eee16c5f-f765-4bb3-a5cb-e2a19d9de781","name":"Personal Leave","description":"","createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":null,"updatedBy":null,"updatedAtUtc":"0001-01-01T00:00:00"}
/// leaveTypeId : "eee16c5f-f765-4bb3-a5cb-e2a19d9de781"
/// leavePriority : {"leavePriorityId":"059c1b9f-e602-49d1-ba30-abe342335659","name":"Normal","createdById":"163bb345-fe04-4828-a671-54e353167711","createdBy":null,"createdAtUtc":"2023-10-15T20:01:03.8924543","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-10-15T20:01:03.8924543"}
/// leavePriorityId : "059c1b9f-e602-49d1-ba30-abe342335659"
/// fromDate : "2024-03-02T00:00:00"
/// toDate : "2024-03-02T00:00:00"
/// onBehalf : {"employeeId":"19cc0518-b993-4f8f-901b-85c4068e7faa","firstName":"Hilda","lastName":"Haynes","gender":"Female","dateOfBirth":"1992-04-04T00:00:00","placeOfBirth":"Weirton","maritalStatus":"Single","email":"Hilda.Haynes@leaves-hrm.com","phone":"(570) 873-7090","address1":"778-9383 Suspendisse Av.","address2":null,"city":"Weirton","stateProvince":"IN","zipCode":"93479","country":"USA","employeeIDNumber":"EMPSLS004","designationId":"fb9df214-d373-447b-bcb0-9501c3dbb564","designation":null,"departmentId":"fc00bef6-8e74-427f-9aab-a8381cfc6564","department":null,"joiningDate":"2017-04-04T00:00:00","leavingDate":null,"supervisorId":"c19600fe-7e69-4b04-9702-1af1465c462d","supervisor":null,"annualLeaves":20,"basicSalary":10000.00,"unpaidLeavePerDay":500.00,"benefitTemplateId":"c933c6bc-ccc7-4b99-b230-f07d04d3fcf7","benefitTemplate":null,"accountTitle":"Hilda Haynes Payroll","bankName":"Bank of New York Mellon","accountNumber":"4444-MELLON","swiftCode":null,"systemUserId":"2b789954-354d-43c3-941b-f0b9c30ae41d","systemUser":null,"createdById":null,"createdBy":null,"createdAtUtc":"0001-01-01T00:00:00","updatedById":"163bb345-fe04-4828-a671-54e353167711","updatedBy":null,"updatedAtUtc":"2023-09-10T17:38:52.6686644"}
/// onBehalfId : "19cc0518-b993-4f8f-901b-85c4068e7faa"
/// isPaidLeave : false
/// leavesRemaining : 0
/// allowedLeaves : 0
/// isNew : false
/// createdById : "2b789954-354d-43c3-941b-f0b9c30ae41d"
/// createdBy : null
/// createdAtUtc : "2024-03-01T21:48:57.6120925"
/// updatedById : "2b789954-354d-43c3-941b-f0b9c30ae41d"
/// updatedBy : null
/// updatedAtUtc : "2024-03-01T21:48:57.6120925"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? leaveId, 
      String? leaveName, 
      String? description, 
      String? emergencyCall, 
      bool? isApproved, 
      LeaveType? leaveType, 
      String? leaveTypeId, 
      LeavePriority? leavePriority, 
      String? leavePriorityId, 
      String? fromDate, 
      String? toDate, 
      OnBehalf? onBehalf, 
      String? onBehalfId, 
      bool? isPaidLeave, 
      int? leavesRemaining, 
      int? allowedLeaves, 
      bool? isNew, 
      String? createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      String? updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _leaveId = leaveId;
    _leaveName = leaveName;
    _description = description;
    _emergencyCall = emergencyCall;
    _isApproved = isApproved;
    _leaveType = leaveType;
    _leaveTypeId = leaveTypeId;
    _leavePriority = leavePriority;
    _leavePriorityId = leavePriorityId;
    _fromDate = fromDate;
    _toDate = toDate;
    _onBehalf = onBehalf;
    _onBehalfId = onBehalfId;
    _isPaidLeave = isPaidLeave;
    _leavesRemaining = leavesRemaining;
    _allowedLeaves = allowedLeaves;
    _isNew = isNew;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  Data.fromJson(dynamic json) {
    _leaveId = json['leaveId'];
    _leaveName = json['leaveName'];
    _description = json['description'];
    _emergencyCall = json['emergencyCall'];
    _isApproved = json['isApproved'];
    _leaveType = json['leaveType'] != null ? LeaveType.fromJson(json['leaveType']) : null;
    _leaveTypeId = json['leaveTypeId'];
    _leavePriority = json['leavePriority'] != null ? LeavePriority.fromJson(json['leavePriority']) : null;
    _leavePriorityId = json['leavePriorityId'];
    _fromDate = json['fromDate'];
    _toDate = json['toDate'];
    _onBehalf = json['onBehalf'] != null ? OnBehalf.fromJson(json['onBehalf']) : null;
    _onBehalfId = json['onBehalfId'];
    _isPaidLeave = json['isPaidLeave'];
    _leavesRemaining = json['leavesRemaining'];
    _allowedLeaves = json['allowedLeaves'];
    _isNew = json['isNew'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _leaveId;
  String? _leaveName;
  String? _description;
  String? _emergencyCall;
  bool? _isApproved;
  LeaveType? _leaveType;
  String? _leaveTypeId;
  LeavePriority? _leavePriority;
  String? _leavePriorityId;
  String? _fromDate;
  String? _toDate;
  OnBehalf? _onBehalf;
  String? _onBehalfId;
  bool? _isPaidLeave;
  int? _leavesRemaining;
  int? _allowedLeaves;
  bool? _isNew;
  String? _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  String? _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
Data copyWith({  String? leaveId,
  String? leaveName,
  String? description,
  String? emergencyCall,
  bool? isApproved,
  LeaveType? leaveType,
  String? leaveTypeId,
  LeavePriority? leavePriority,
  String? leavePriorityId,
  String? fromDate,
  String? toDate,
  OnBehalf? onBehalf,
  String? onBehalfId,
  bool? isPaidLeave,
  int? leavesRemaining,
  int? allowedLeaves,
  bool? isNew,
  String? createdById,
  dynamic createdBy,
  String? createdAtUtc,
  String? updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => Data(  leaveId: leaveId ?? _leaveId,
  leaveName: leaveName ?? _leaveName,
  description: description ?? _description,
  emergencyCall: emergencyCall ?? _emergencyCall,
  isApproved: isApproved ?? _isApproved,
  leaveType: leaveType ?? _leaveType,
  leaveTypeId: leaveTypeId ?? _leaveTypeId,
  leavePriority: leavePriority ?? _leavePriority,
  leavePriorityId: leavePriorityId ?? _leavePriorityId,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  onBehalf: onBehalf ?? _onBehalf,
  onBehalfId: onBehalfId ?? _onBehalfId,
  isPaidLeave: isPaidLeave ?? _isPaidLeave,
  leavesRemaining: leavesRemaining ?? _leavesRemaining,
  allowedLeaves: allowedLeaves ?? _allowedLeaves,
  isNew: isNew ?? _isNew,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get leaveId => _leaveId;
  String? get leaveName => _leaveName;
  String? get description => _description;
  String? get emergencyCall => _emergencyCall;
  bool? get isApproved => _isApproved;
  LeaveType? get leaveType => _leaveType;
  String? get leaveTypeId => _leaveTypeId;
  LeavePriority? get leavePriority => _leavePriority;
  String? get leavePriorityId => _leavePriorityId;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  OnBehalf? get onBehalf => _onBehalf;
  String? get onBehalfId => _onBehalfId;
  bool? get isPaidLeave => _isPaidLeave;
  int? get leavesRemaining => _leavesRemaining;
  int? get allowedLeaves => _allowedLeaves;
  bool? get isNew => _isNew;
  String? get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  String? get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leaveId'] = _leaveId;
    map['leaveName'] = _leaveName;
    map['description'] = _description;
    map['emergencyCall'] = _emergencyCall;
    map['isApproved'] = _isApproved;
    if (_leaveType != null) {
      map['leaveType'] = _leaveType?.toJson();
    }
    map['leaveTypeId'] = _leaveTypeId;
    if (_leavePriority != null) {
      map['leavePriority'] = _leavePriority?.toJson();
    }
    map['leavePriorityId'] = _leavePriorityId;
    map['fromDate'] = _fromDate;
    map['toDate'] = _toDate;
    if (_onBehalf != null) {
      map['onBehalf'] = _onBehalf?.toJson();
    }
    map['onBehalfId'] = _onBehalfId;
    map['isPaidLeave'] = _isPaidLeave;
    map['leavesRemaining'] = _leavesRemaining;
    map['allowedLeaves'] = _allowedLeaves;
    map['isNew'] = _isNew;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}

/// employeeId : "19cc0518-b993-4f8f-901b-85c4068e7faa"
/// firstName : "Hilda"
/// lastName : "Haynes"
/// gender : "Female"
/// dateOfBirth : "1992-04-04T00:00:00"
/// placeOfBirth : "Weirton"
/// maritalStatus : "Single"
/// email : "Hilda.Haynes@leaves-hrm.com"
/// phone : "(570) 873-7090"
/// address1 : "778-9383 Suspendisse Av."
/// address2 : null
/// city : "Weirton"
/// stateProvince : "IN"
/// zipCode : "93479"
/// country : "USA"
/// employeeIDNumber : "EMPSLS004"
/// designationId : "fb9df214-d373-447b-bcb0-9501c3dbb564"
/// designation : null
/// departmentId : "fc00bef6-8e74-427f-9aab-a8381cfc6564"
/// department : null
/// joiningDate : "2017-04-04T00:00:00"
/// leavingDate : null
/// supervisorId : "c19600fe-7e69-4b04-9702-1af1465c462d"
/// supervisor : null
/// annualLeaves : 20
/// basicSalary : 10000.00
/// unpaidLeavePerDay : 500.00
/// benefitTemplateId : "c933c6bc-ccc7-4b99-b230-f07d04d3fcf7"
/// benefitTemplate : null
/// accountTitle : "Hilda Haynes Payroll"
/// bankName : "Bank of New York Mellon"
/// accountNumber : "4444-MELLON"
/// swiftCode : null
/// systemUserId : "2b789954-354d-43c3-941b-f0b9c30ae41d"
/// systemUser : null
/// createdById : null
/// createdBy : null
/// createdAtUtc : "0001-01-01T00:00:00"
/// updatedById : "163bb345-fe04-4828-a671-54e353167711"
/// updatedBy : null
/// updatedAtUtc : "2023-09-10T17:38:52.6686644"

OnBehalf onBehalfFromJson(String str) => OnBehalf.fromJson(json.decode(str));
String onBehalfToJson(OnBehalf data) => json.encode(data.toJson());
class OnBehalf {
  OnBehalf({
      String? employeeId, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      String? dateOfBirth, 
      String? placeOfBirth, 
      String? maritalStatus, 
      String? email, 
      String? phone, 
      String? address1, 
      dynamic address2, 
      String? city, 
      String? stateProvince, 
      String? zipCode, 
      String? country, 
      String? employeeIDNumber, 
      String? designationId, 
      dynamic designation, 
      String? departmentId, 
      dynamic department, 
      String? joiningDate, 
      dynamic leavingDate, 
      String? supervisorId, 
      dynamic supervisor, 
      int? annualLeaves, 
      double? basicSalary, 
      double? unpaidLeavePerDay, 
      String? benefitTemplateId, 
      dynamic benefitTemplate, 
      String? accountTitle, 
      String? bankName, 
      String? accountNumber, 
      dynamic swiftCode, 
      String? systemUserId, 
      dynamic systemUser, 
      dynamic createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      String? updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _employeeId = employeeId;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dateOfBirth = dateOfBirth;
    _placeOfBirth = placeOfBirth;
    _maritalStatus = maritalStatus;
    _email = email;
    _phone = phone;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _stateProvince = stateProvince;
    _zipCode = zipCode;
    _country = country;
    _employeeIDNumber = employeeIDNumber;
    _designationId = designationId;
    _designation = designation;
    _departmentId = departmentId;
    _department = department;
    _joiningDate = joiningDate;
    _leavingDate = leavingDate;
    _supervisorId = supervisorId;
    _supervisor = supervisor;
    _annualLeaves = annualLeaves;
    _basicSalary = basicSalary;
    _unpaidLeavePerDay = unpaidLeavePerDay;
    _benefitTemplateId = benefitTemplateId;
    _benefitTemplate = benefitTemplate;
    _accountTitle = accountTitle;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _swiftCode = swiftCode;
    _systemUserId = systemUserId;
    _systemUser = systemUser;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  OnBehalf.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _gender = json['gender'];
    _dateOfBirth = json['dateOfBirth'];
    _placeOfBirth = json['placeOfBirth'];
    _maritalStatus = json['maritalStatus'];
    _email = json['email'];
    _phone = json['phone'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _city = json['city'];
    _stateProvince = json['stateProvince'];
    _zipCode = json['zipCode'];
    _country = json['country'];
    _employeeIDNumber = json['employeeIDNumber'];
    _designationId = json['designationId'];
    _designation = json['designation'];
    _departmentId = json['departmentId'];
    _department = json['department'];
    _joiningDate = json['joiningDate'];
    _leavingDate = json['leavingDate'];
    _supervisorId = json['supervisorId'];
    _supervisor = json['supervisor'];
    _annualLeaves = json['annualLeaves'];
    _basicSalary = json['basicSalary'];
    _unpaidLeavePerDay = json['unpaidLeavePerDay'];
    _benefitTemplateId = json['benefitTemplateId'];
    _benefitTemplate = json['benefitTemplate'];
    _accountTitle = json['accountTitle'];
    _bankName = json['bankName'];
    _accountNumber = json['accountNumber'];
    _swiftCode = json['swiftCode'];
    _systemUserId = json['systemUserId'];
    _systemUser = json['systemUser'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _employeeId;
  String? _firstName;
  String? _lastName;
  String? _gender;
  String? _dateOfBirth;
  String? _placeOfBirth;
  String? _maritalStatus;
  String? _email;
  String? _phone;
  String? _address1;
  dynamic _address2;
  String? _city;
  String? _stateProvince;
  String? _zipCode;
  String? _country;
  String? _employeeIDNumber;
  String? _designationId;
  dynamic _designation;
  String? _departmentId;
  dynamic _department;
  String? _joiningDate;
  dynamic _leavingDate;
  String? _supervisorId;
  dynamic _supervisor;
  int? _annualLeaves;
  double? _basicSalary;
  double? _unpaidLeavePerDay;
  String? _benefitTemplateId;
  dynamic _benefitTemplate;
  String? _accountTitle;
  String? _bankName;
  String? _accountNumber;
  dynamic _swiftCode;
  String? _systemUserId;
  dynamic _systemUser;
  dynamic _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  String? _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
OnBehalf copyWith({  String? employeeId,
  String? firstName,
  String? lastName,
  String? gender,
  String? dateOfBirth,
  String? placeOfBirth,
  String? maritalStatus,
  String? email,
  String? phone,
  String? address1,
  dynamic address2,
  String? city,
  String? stateProvince,
  String? zipCode,
  String? country,
  String? employeeIDNumber,
  String? designationId,
  dynamic designation,
  String? departmentId,
  dynamic department,
  String? joiningDate,
  dynamic leavingDate,
  String? supervisorId,
  dynamic supervisor,
  int? annualLeaves,
  double? basicSalary,
  double? unpaidLeavePerDay,
  String? benefitTemplateId,
  dynamic benefitTemplate,
  String? accountTitle,
  String? bankName,
  String? accountNumber,
  dynamic swiftCode,
  String? systemUserId,
  dynamic systemUser,
  dynamic createdById,
  dynamic createdBy,
  String? createdAtUtc,
  String? updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => OnBehalf(  employeeId: employeeId ?? _employeeId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  placeOfBirth: placeOfBirth ?? _placeOfBirth,
  maritalStatus: maritalStatus ?? _maritalStatus,
  email: email ?? _email,
  phone: phone ?? _phone,
  address1: address1 ?? _address1,
  address2: address2 ?? _address2,
  city: city ?? _city,
  stateProvince: stateProvince ?? _stateProvince,
  zipCode: zipCode ?? _zipCode,
  country: country ?? _country,
  employeeIDNumber: employeeIDNumber ?? _employeeIDNumber,
  designationId: designationId ?? _designationId,
  designation: designation ?? _designation,
  departmentId: departmentId ?? _departmentId,
  department: department ?? _department,
  joiningDate: joiningDate ?? _joiningDate,
  leavingDate: leavingDate ?? _leavingDate,
  supervisorId: supervisorId ?? _supervisorId,
  supervisor: supervisor ?? _supervisor,
  annualLeaves: annualLeaves ?? _annualLeaves,
  basicSalary: basicSalary ?? _basicSalary,
  unpaidLeavePerDay: unpaidLeavePerDay ?? _unpaidLeavePerDay,
  benefitTemplateId: benefitTemplateId ?? _benefitTemplateId,
  benefitTemplate: benefitTemplate ?? _benefitTemplate,
  accountTitle: accountTitle ?? _accountTitle,
  bankName: bankName ?? _bankName,
  accountNumber: accountNumber ?? _accountNumber,
  swiftCode: swiftCode ?? _swiftCode,
  systemUserId: systemUserId ?? _systemUserId,
  systemUser: systemUser ?? _systemUser,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get employeeId => _employeeId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  String? get dateOfBirth => _dateOfBirth;
  String? get placeOfBirth => _placeOfBirth;
  String? get maritalStatus => _maritalStatus;
  String? get email => _email;
  String? get phone => _phone;
  String? get address1 => _address1;
  dynamic get address2 => _address2;
  String? get city => _city;
  String? get stateProvince => _stateProvince;
  String? get zipCode => _zipCode;
  String? get country => _country;
  String? get employeeIDNumber => _employeeIDNumber;
  String? get designationId => _designationId;
  dynamic get designation => _designation;
  String? get departmentId => _departmentId;
  dynamic get department => _department;
  String? get joiningDate => _joiningDate;
  dynamic get leavingDate => _leavingDate;
  String? get supervisorId => _supervisorId;
  dynamic get supervisor => _supervisor;
  int? get annualLeaves => _annualLeaves;
  double? get basicSalary => _basicSalary;
  double? get unpaidLeavePerDay => _unpaidLeavePerDay;
  String? get benefitTemplateId => _benefitTemplateId;
  dynamic get benefitTemplate => _benefitTemplate;
  String? get accountTitle => _accountTitle;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  dynamic get swiftCode => _swiftCode;
  String? get systemUserId => _systemUserId;
  dynamic get systemUser => _systemUser;
  dynamic get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  String? get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['gender'] = _gender;
    map['dateOfBirth'] = _dateOfBirth;
    map['placeOfBirth'] = _placeOfBirth;
    map['maritalStatus'] = _maritalStatus;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['city'] = _city;
    map['stateProvince'] = _stateProvince;
    map['zipCode'] = _zipCode;
    map['country'] = _country;
    map['employeeIDNumber'] = _employeeIDNumber;
    map['designationId'] = _designationId;
    map['designation'] = _designation;
    map['departmentId'] = _departmentId;
    map['department'] = _department;
    map['joiningDate'] = _joiningDate;
    map['leavingDate'] = _leavingDate;
    map['supervisorId'] = _supervisorId;
    map['supervisor'] = _supervisor;
    map['annualLeaves'] = _annualLeaves;
    map['basicSalary'] = _basicSalary;
    map['unpaidLeavePerDay'] = _unpaidLeavePerDay;
    map['benefitTemplateId'] = _benefitTemplateId;
    map['benefitTemplate'] = _benefitTemplate;
    map['accountTitle'] = _accountTitle;
    map['bankName'] = _bankName;
    map['accountNumber'] = _accountNumber;
    map['swiftCode'] = _swiftCode;
    map['systemUserId'] = _systemUserId;
    map['systemUser'] = _systemUser;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}

/// leavePriorityId : "059c1b9f-e602-49d1-ba30-abe342335659"
/// name : "Normal"
/// createdById : "163bb345-fe04-4828-a671-54e353167711"
/// createdBy : null
/// createdAtUtc : "2023-10-15T20:01:03.8924543"
/// updatedById : "163bb345-fe04-4828-a671-54e353167711"
/// updatedBy : null
/// updatedAtUtc : "2023-10-15T20:01:03.8924543"

LeavePriority leavePriorityFromJson(String str) => LeavePriority.fromJson(json.decode(str));
String leavePriorityToJson(LeavePriority data) => json.encode(data.toJson());
class LeavePriority {
  LeavePriority({
      String? leavePriorityId, 
      String? name, 
      String? createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      String? updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _leavePriorityId = leavePriorityId;
    _name = name;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  LeavePriority.fromJson(dynamic json) {
    _leavePriorityId = json['leavePriorityId'];
    _name = json['name'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _leavePriorityId;
  String? _name;
  String? _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  String? _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
LeavePriority copyWith({  String? leavePriorityId,
  String? name,
  String? createdById,
  dynamic createdBy,
  String? createdAtUtc,
  String? updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => LeavePriority(  leavePriorityId: leavePriorityId ?? _leavePriorityId,
  name: name ?? _name,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get leavePriorityId => _leavePriorityId;
  String? get name => _name;
  String? get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  String? get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leavePriorityId'] = _leavePriorityId;
    map['name'] = _name;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}

/// leaveTypeId : "eee16c5f-f765-4bb3-a5cb-e2a19d9de781"
/// name : "Personal Leave"
/// description : ""
/// createdById : null
/// createdBy : null
/// createdAtUtc : "0001-01-01T00:00:00"
/// updatedById : null
/// updatedBy : null
/// updatedAtUtc : "0001-01-01T00:00:00"

LeaveType leaveTypeFromJson(String str) => LeaveType.fromJson(json.decode(str));
String leaveTypeToJson(LeaveType data) => json.encode(data.toJson());
class LeaveType {
  LeaveType({
      String? leaveTypeId, 
      String? name, 
      String? description, 
      dynamic createdById, 
      dynamic createdBy, 
      String? createdAtUtc, 
      dynamic updatedById, 
      dynamic updatedBy, 
      String? updatedAtUtc,}){
    _leaveTypeId = leaveTypeId;
    _name = name;
    _description = description;
    _createdById = createdById;
    _createdBy = createdBy;
    _createdAtUtc = createdAtUtc;
    _updatedById = updatedById;
    _updatedBy = updatedBy;
    _updatedAtUtc = updatedAtUtc;
}

  LeaveType.fromJson(dynamic json) {
    _leaveTypeId = json['leaveTypeId'];
    _name = json['name'];
    _description = json['description'];
    _createdById = json['createdById'];
    _createdBy = json['createdBy'];
    _createdAtUtc = json['createdAtUtc'];
    _updatedById = json['updatedById'];
    _updatedBy = json['updatedBy'];
    _updatedAtUtc = json['updatedAtUtc'];
  }
  String? _leaveTypeId;
  String? _name;
  String? _description;
  dynamic _createdById;
  dynamic _createdBy;
  String? _createdAtUtc;
  dynamic _updatedById;
  dynamic _updatedBy;
  String? _updatedAtUtc;
LeaveType copyWith({  String? leaveTypeId,
  String? name,
  String? description,
  dynamic createdById,
  dynamic createdBy,
  String? createdAtUtc,
  dynamic updatedById,
  dynamic updatedBy,
  String? updatedAtUtc,
}) => LeaveType(  leaveTypeId: leaveTypeId ?? _leaveTypeId,
  name: name ?? _name,
  description: description ?? _description,
  createdById: createdById ?? _createdById,
  createdBy: createdBy ?? _createdBy,
  createdAtUtc: createdAtUtc ?? _createdAtUtc,
  updatedById: updatedById ?? _updatedById,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAtUtc: updatedAtUtc ?? _updatedAtUtc,
);
  String? get leaveTypeId => _leaveTypeId;
  String? get name => _name;
  String? get description => _description;
  dynamic get createdById => _createdById;
  dynamic get createdBy => _createdBy;
  String? get createdAtUtc => _createdAtUtc;
  dynamic get updatedById => _updatedById;
  dynamic get updatedBy => _updatedBy;
  String? get updatedAtUtc => _updatedAtUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leaveTypeId'] = _leaveTypeId;
    map['name'] = _name;
    map['description'] = _description;
    map['createdById'] = _createdById;
    map['createdBy'] = _createdBy;
    map['createdAtUtc'] = _createdAtUtc;
    map['updatedById'] = _updatedById;
    map['updatedBy'] = _updatedBy;
    map['updatedAtUtc'] = _updatedAtUtc;
    return map;
  }

}