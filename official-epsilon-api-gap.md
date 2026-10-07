# Official Epsilon API gap report

> Snapshot: `epsilon-openapi.json`, official Swagger `2.0.1.0`, checked 2026-10-07.
>
> This report lists official path entries that were not present as exact paths in the CRS inventory and were not already referenced by an `x-official-epsilon-path` mapping. The complete official request, response and schema definitions are in [`epsilon-openapi.json`](epsilon-openapi.json).

- Official catalog: 274 paths / 275 operations.
- Previous CRS inventory: 40 paths / 41 operations.
- Official paths already represented directly or through a mapping: 36.
- Newly imported official path entries: 238.

## Missing official path entries

| Area | Method | Official path | Summary |
|---|---:|---|---|
| Accounts | `PUT` | `/api/Accounts/ActivateAccount` | Activate a candidate account |
| Accounts | `POST` | `/api/Accounts/CandidateAccountRemovalRequest` | Submit a candidate GDPR removal request |
| Accounts | `GET` | `/api/Accounts/CandidateDuplicateCheck` | Check for potential duplicate candidates |
| Accounts | `GET` | `/api/Accounts/CandidateEmailIsAvailable` | Checks whether email address is available |
| Accounts | `GET` | `/api/Accounts/CandidatePasswordResetRequest` | Generate a password reset request |
| Accounts | `GET` | `/api/Accounts/CandidatePasswordResetRequestIsValid` | Validate a candidate password reset request |
| Accounts | `POST` | `/api/Accounts/CandidateResetPassword` | Reset a candidate's password |
| Accounts | `POST` | `/api/Accounts/CreateCandidateLogin` | CreateCandidateLogin |
| Accounts | `GET` | `/api/Accounts/GetBearerToken` |  |
| Accounts | `DELETE` | `/api/Accounts/InvalidateAccessToken` | Invalidates the existing master token making it unusable |
| Accounts | `GET` | `/api/Accounts/SendActivationEmail` | SendActivationEmail |
| Candidates | `POST` | `/api/Candidates/AddAttachment/{id}` | Upload a candidate attachment and alert the consultant via email |
| Candidates | `POST` | `/api/Candidates/AddExpense` | Adds an expense object |
| Candidates | `POST` | `/api/Candidates/AddMobileDevice` | Add a candidate's mobile device to the database |
| Candidates | `POST` | `/api/Candidates/AddMobileMessage` | Adds a message from a candidate's app to the database |
| Candidates | `POST` | `/api/Candidates/AddPeopleQuestion` | Add a questionnaire response object |
| Candidates | `POST` | `/api/Candidates/AddPeopleQuestionAnswer` | Add a response to a single question (referencing the questionnaire response object) |
| Candidates | `POST` | `/api/Candidates/AddPreReg` | Add a pre-registered candidate to the database |
| Candidates | `POST` | `/api/Candidates/AdhocEmail` | Send an ad hoc email |
| Candidates | `POST` | `/api/Candidates/AlertConsultantToDuplicateCandidate` | Sends an alert to the consultant if a potential duplicate has been found for one of their candidates |
| Candidates | `POST` | `/api/Candidates/ApplyForJob` | Apply a candidate to a job |
| Candidates | `POST` | `/api/Candidates/ApplyForShifts` | v2.0.0.3 Apply a candidate to a series of shifts within jobs NOTE: Only allows a single shift! |
| Candidates | `PUT` | `/api/Candidates/BlockMobileDevice` | Blocks a specific mobile device identified by a combination of candidate ID and the device's UUID |
| Candidates | `POST` | `/api/Candidates/CandidateTokenLogin` | Method can only be reached if the accessing agent has a valid ID and token |
| Candidates | `POST` | `/api/Candidates/ChangeCandidatePassword` | Change candidate password |
| Candidates | `PUT` | `/api/Candidates/CheckIn` | Method to allow a candidate to check in to a job shift |
| Candidates | `PUT` | `/api/Candidates/CheckOut` | Method to allow a candidate to check out of a job shift |
| Candidates | `GET` | `/api/Candidates/CheckQRCode` |  |
| Candidates | `PUT` | `/api/Candidates/ClearAvailability` | Update candidate availability |
| Candidates | `PUT` | `/api/Candidates/ConfirmShift` | Updates a shift to be confirmed |
| Candidates | `POST` | `/api/Candidates/CreateWIP` | Create a WIP action |
| Candidates | `DELETE` | `/api/Candidates/DeleteCandidateCodes` | Remove a number of keywords from a candidate |
| Candidates | `DELETE` | `/api/Candidates/DeleteExpense` | Delete an expense by its ID number |
| Candidates | `DELETE` | `/api/Candidates/DeleteExpensesByDay` | Delete all expenses submitted against a specific day |
| Candidates | `DELETE` | `/api/Candidates/DeleteMobileDevice` | Deletes a specific mobile device identified by a combination of candidate ID and the device's UUID |
| Candidates | `DELETE` | `/api/Candidates/DeletePicture` | Delete candidate's picture |
| Candidates | `GET` | `/api/Candidates/GetAgreedToWebTOB` | Get whether a candidate has agreed to the web terms of business |
| Candidates | `GET` | `/api/Candidates/GetAppDashboard` | Returns a dashboard summary for the candidate |
| Candidates | `GET` | `/api/Candidates/GetAvailability` | Get a candidate's availability |
| Candidates | `GET` | `/api/Candidates/GetCV` | Get the candidate's CV |
| Candidates | `GET` | `/api/Candidates/GetCandidateEmailsByStatusDate` | Gets a list of updated candidates and their email addresses |
| Candidates | `GET` | `/api/Candidates/GetCandidateQualLevel` | Get a candidate's qualification level |
| Candidates | `GET` | `/api/Candidates/GetCandidatesWithoutPayrollNo` | Returns an array of ID numbers for candidates without a payroll number based on a list of candidate ID numbers provided |
| Candidates | `GET` | `/api/Candidates/GetClassNameAndVersion` | Get the validated list of keywords for candidates |
| Candidates | `GET` | `/api/Candidates/GetCodes` | Get a list of keywords assigned to a candidate |
| Candidates | `GET` | `/api/Candidates/GetConsultant` | Get the candidate's consultant details |
| Candidates | `GET` | `/api/Candidates/GetContactLogAttachmentData` | Gets a list of contact log attachments filtered by logNo |
| Candidates | `GET` | `/api/Candidates/GetContactLogEntries` | Gets a list of contact log entries filtered by actions defined in the gen user config (EPSILONAPI &gt; ContactLogActions) |
| Candidates | `GET` | `/api/Candidates/GetDashboardJobs` | Get a list of candidate jobs |
| Candidates | `GET` | `/api/Candidates/GetDaysUntilAvailEntry` | Gets the number of days until the candidate's next availability entry |
| Candidates | `GET` | `/api/Candidates/GetDeviceList` | Get a list of candidate devices |
| Candidates | `GET` | `/api/Candidates/GetExpense` | Gets a specific expense by ID number |
| Candidates | `GET` | `/api/Candidates/GetExpenseTypes` | Get a list of expense types/categories |
| Candidates | `GET` | `/api/Candidates/GetExpensesForDay` | Get a list of expenses submitted for a particular day |
| Candidates | `GET` | `/api/Candidates/GetExtendedCandidateProfile` | Get the candidate details with additional fields |
| Candidates | `GET` | `/api/Candidates/GetGdprStatus` |  |
| Candidates | `GET` | `/api/Candidates/GetHasCV` | Check if a candidate has a CV |
| Candidates | `GET` | `/api/Candidates/GetJobDetails` | Get job details |
| Candidates | `GET` | `/api/Candidates/GetJobInterview` | Get any candidate-job interview details |
| Candidates | `GET` | `/api/Candidates/GetJobNotifications` | Get a list of candidate job alerts |
| Candidates | `GET` | `/api/Candidates/GetJobs` | Get a refined list of candidate jobs |
| Candidates | `GET` | `/api/Candidates/GetMobileMessages` | Get mobile messages starting from a specified message |
| Candidates | `GET` | `/api/Candidates/GetMobileMessagesPage` | Get mobile messages for a conversation with a consultant |
| Candidates | `GET` | `/api/Candidates/GetMobileMessagesSummary` | 26/10/20 DC - Added helper method to get just a message summary Get a summary of the candidate's message conversations with consultants |
| Candidates | `GET` | `/api/Candidates/GetNationality` | Added 18/09/2019 by DJC Gets the candidate's nationality |
| Candidates | `GET` | `/api/Candidates/GetNotes` | Get candidate notes |
| Candidates | `GET` | `/api/Candidates/GetPictureAlt` | Get candidate's picture |
| Candidates | `GET` | `/api/Candidates/GetProgress` | Get candidate progress status (% based on profile completion) |
| Candidates | `GET` | `/api/Candidates/GetProvisionalShifts` |  |
| Candidates | `GET` | `/api/Candidates/GetReceiveEmailAlertsStatus` | Get whether candidate is signed up to receive email alerts |
| Candidates | `GET` | `/api/Candidates/GetRecommendedJobs` | Get a list of recommended jobs for a candidate |
| Candidates | `GET` | `/api/Candidates/GetSalarySought` | Get salary sought by a candidate |
| Candidates | `POST` | `/api/Candidates/GetShifts` | Returns a list of shifts for the candidate based on set criteria |
| Candidates | `GET` | `/api/Candidates/GetShortlistedJobs` | Get a list of candidate's shortlisted jobs |
| Candidates | `GET` | `/api/Candidates/GetShortlistedShift` |  |
| Candidates | `GET` | `/api/Candidates/GetShortlistedShifts` | Get shortlisted shifts |
| Candidates | `GET` | `/api/Candidates/GetStatusInJob` | Get the candidate's current status in a job |
| Candidates | `GET` | `/api/Candidates/GetTalentBankJobs` | Get list of jobs that a candidate has been proposed to via the talent bank |
| Candidates | `GET` | `/api/Candidates/GetTimesheet` | Gets a single candidate timesheet based on search criteria |
| Candidates | `GET` | `/api/Candidates/GetTimesheetDayEstimate` | Returns the estimated earnings for a timesheet day 14/10/2020 DC - Config option added to block the return of TS estimates (says 0) |
| Candidates | `GET` | `/api/Candidates/GetTimesheets` | Gets a list of candidate's timesheets based on search criteria |
| Candidates | `GET` | `/api/Candidates/GetTimesheetsByDate` | Gets a list of candidate's timesheets based on search criteria |
| Candidates | `GET` | `/api/Candidates/GetTimesheetsByStatus` | Gets a list of candidate's timesheets based on search criteria |
| Candidates | `GET` | `/api/Candidates/GetUnreadMessagesCount` | Gets the number of unread messages sent to a candidate |
| Candidates | `GET` | `/api/Candidates/GetUpcomingWorkDays` | Returns a list of upcoming work days for a candidate |
| Candidates | `GET` | `/api/Candidates/GetUpcomingWorkDaysV2` | Returns a list of upcoming work days for a candidate |
| Candidates | `GET` | `/api/Candidates/GetUrl` | Gets a candidate's URL |
| Candidates | `GET` | `/api/Candidates/GetValidationTable` | Gets a list of validated table values |
| Candidates | `GET` | `/api/Candidates/GetValidationTableVersion` | Get updated date of validated field |
| Candidates | `GET` | `/api/Candidates/GetWIPStatus` | Get the candidate's WIP status in a job |
| Candidates | `GET` | `/api/Candidates/GetWorkingDay` | Gets an upcoming candidate shift |
| Candidates | `PUT` | `/api/Candidates/RejectShift` | Reject a shift |
| Candidates | `PUT` | `/api/Candidates/ResetTimesheetForDay` | Resets a timesheet day to its original status |
| Candidates | `POST` | `/api/Candidates/SaveCandidateCV` | Saves a CV against a candidate |
| Candidates | `PUT` | `/api/Candidates/SaveCandidateNotes` | Save candidate notes |
| Candidates | `POST` | `/api/Candidates/SaveExternalLogin` | Store a LinkedIn profile url |
| Candidates | `POST` | `/api/Candidates/SavePicture` | Save candidate's picture |
| Candidates | `PUT` | `/api/Candidates/SaveUrl` | Saves the candidate's URL |
| Candidates | `POST` | `/api/Candidates/SendEmailToConsultant` | Send an email to the candidate's consultant |
| Candidates | `POST` | `/api/Candidates/SendJobToAFriend` | Send an email containing job details to a third party |
| Candidates | `POST` | `/api/Candidates/SetCandidateStatus` | Sets the candidate updated date |
| Candidates | `POST` | `/api/Candidates/SetCandidateUpdatedDate` | Set the candidate updated date |
| Candidates | `PUT` | `/api/Candidates/UpdateAgreeWebTOB` | Set whether a candidate has agreed to the web terms of business |
| Candidates | `PUT` | `/api/Candidates/UpdateAvailability` | Update a candidate's availability |
| Candidates | `PUT` | `/api/Candidates/UpdateAvailabilityByChar` | Update candidate availability directly with an availability code character |
| Candidates | `PUT` | `/api/Candidates/UpdateAvailabilityRange` | Update candidate availability across a range |
| Candidates | `PUT` | `/api/Candidates/UpdateCandidateCareer` | Update a candidate's career history entry |
| Candidates | `PUT` | `/api/Candidates/UpdateCandidateEducation` | Update a candidate's education history entry |
| Candidates | `PUT` | `/api/Candidates/UpdateCandidateGender` | Update candidate gender |
| Candidates | `PUT` | `/api/Candidates/UpdateCandidateQualLevel` | Update a candidate's qualification level |
| Candidates | `PUT` | `/api/Candidates/UpdateCandidateTPB` | Updated the candidates Temp/Perm/Both statud |
| Candidates | `PUT` | `/api/Candidates/UpdateConversationMessagesAsRead` | 04/02/2021 - Marks all the messages within a conversation as read |
| Candidates | `PUT` | `/api/Candidates/UpdateExpense` | Update an expense by its ID number |
| Candidates | `POST` | `/api/Candidates/UpdateJobWip` | Update a candidate's WIP status within a job |
| Candidates | `PUT` | `/api/Candidates/UpdateLimitedCompanyDetails` | Added 18/09/2019 by DJC Updates a candidate's limited company details |
| Candidates | `PUT` | `/api/Candidates/UpdateMobileMessagesAsRead` | Marks all the messages matching the list of log ID numbers as completed |
| Candidates | `PUT` | `/api/Candidates/UpdateNationality` | Added 18/09/2019 by DJC Updates a candidate's nationality |
| Candidates | `PUT` | `/api/Candidates/UpdatePeopleQuestion` | Update a single question response |
| Candidates | `PUT` | `/api/Candidates/UpdateReceiveAlertsStatus` | Updates whether the candidate receive alert messages |
| Candidates | `PUT` | `/api/Candidates/UpdateSalarySought` | Set salary sought by a candidate |
| Candidates | `PUT` | `/api/Candidates/UpdateTimesheetArray` | Updates an array of timesheet days |
| Candidates | `PUT` | `/api/Candidates/UpdateTimesheetDay` | Updates a timesheet day |
| Candidates | `POST` | `/api/Candidates/UploadProfilePicture` | Uploads a profile picture for the active user Only accepts JPG and JPEG |
| Candidates | `POST` | `/api/Candidates/WithdrawFromJob` | Withdraw a candidate from a job |
| Clients | `POST` | `/api/Clients/AddAgencyToJob` | Add an agency to a job |
| Clients | `POST` | `/api/Clients/AddCandidateToTalentBank` | Add a candidate to the talent bank |
| Clients | `POST` | `/api/Clients/AddContactLog` | Add a candidate contact log action |
| Clients | `POST` | `/api/Clients/AddExpense` | Adds an expense object |
| Clients | `POST` | `/api/Clients/AddJobKeywords` | Add codes to a job |
| Clients | `POST` | `/api/Clients/AdhocEmail` | Send an ad hoc email |
| Clients | `PUT` | `/api/Clients/AuthoriseTimesheet` | Client authorises candidate timesheet days |
| Clients | `POST` | `/api/Clients/CreateBasicCandidate` | Creates a basic candidate |
| Clients | `POST` | `/api/Clients/CreateNewJob` | Create a new job |
| Clients | `POST` | `/api/Clients/CreateWIP` | Creates a Work in Progress (WIP) action |
| Clients | `DELETE` | `/api/Clients/DeleteAgencyFromJob` | Remove and agency from a job |
| Clients | `DELETE` | `/api/Clients/DeleteExpense` | Delete an expense by its ID number |
| Clients | `DELETE` | `/api/Clients/DeleteExpensesByDay` | Delete all expenses submitted against a specific day |
| Clients | `DELETE` | `/api/Clients/DeleteFromTalentBank` | Deletes a candidate from a client talent bank |
| Clients | `DELETE` | `/api/Clients/DeleteJobKeywords` | Delete keywords from a job |
| Clients | `GET` | `/api/Clients/GenerateTSNumber` | Generate the next sequential Timesheet nubmer |
| Clients | `GET` | `/api/Clients/GetAgencyListForJob` | Gets a list of agencies added to a job |
| Clients | `GET` | `/api/Clients/GetBasicClientInfo` | Returns basic client information based on a provided ID number |
| Clients | `GET` | `/api/Clients/GetCanUserViewCandidate` | Checks if client has permission to view the candidate |
| Clients | `GET` | `/api/Clients/GetCandidateAvailability` | Get candidate availability |
| Clients | `GET` | `/api/Clients/GetCandidateCareer` | Gets a candidate's career history |
| Clients | `GET` | `/api/Clients/GetCandidateCodes` | Get a list of keywords assigned to a candidate |
| Clients | `GET` | `/api/Clients/GetCandidateConsultant` | Get the candidate's consultant details |
| Clients | `GET` | `/api/Clients/GetCandidateDetails` | Gets the main candidate details |
| Clients | `GET` | `/api/Clients/GetCandidateEducation` | Gets a candidate's education history |
| Clients | `GET` | `/api/Clients/GetCandidatePenPicture` | Get the candidate's pen picture |
| Clients | `GET` | `/api/Clients/GetCandidatePicture` | Get candidate's picture |
| Clients | `GET` | `/api/Clients/GetCandidateProposedInterview` | Gets any job interview instances proposed by the candidate |
| Clients | `GET` | `/api/Clients/GetCandidateWIPStatus` | Get the candidate's jobs |
| Clients | `GET` | `/api/Clients/GetCandidatesActionedToJob` | Get candidates actioned to a job |
| Clients | `GET` | `/api/Clients/GetClientsByStatusDate` | Gets a list of updated clients and their statuses |
| Clients | `GET` | `/api/Clients/GetConsultant` | Get the client's consultant details |
| Clients | `GET` | `/api/Clients/GetCurrentBonusfigure` | Get pay rate by band description for a specific day |
| Clients | `GET` | `/api/Clients/GetCurrentShiftQuantity` | Get pay rate by band description for a specific day |
| Clients | `GET` | `/api/Clients/GetDayPayRateBands` | Returns a list of the pay rate bands against a specific day |
| Clients | `GET` | `/api/Clients/GetDayPayRateByBand` | Get pay rate by band description for a specific day |
| Clients | `GET` | `/api/Clients/GetExpense` | Gets a specific expense by ID number |
| Clients | `GET` | `/api/Clients/GetExpenseTypes` | Get a list of expense types/categories |
| Clients | `GET` | `/api/Clients/GetExpensesForDay` | Get a list of expenses submitted for a particular day |
| Clients | `GET` | `/api/Clients/GetInvoiceDetails` | Get an invoice details |
| Clients | `GET` | `/api/Clients/GetInvoiceList` | Get a list of invoices |
| Clients | `GET` | `/api/Clients/GetInvoiceSummary` | Get an invoice summary |
| Clients | `GET` | `/api/Clients/GetIsCandiateInJob` | Checks if a candidate is already in a job |
| Clients | `GET` | `/api/Clients/GetJobAlerts` | Get client job alerts |
| Clients | `GET` | `/api/Clients/GetJobs` | Gets client jobs |
| Clients | `GET` | `/api/Clients/GetQuestionAnswers` | Get candidate's answer to job questions |
| Clients | `GET` | `/api/Clients/GetReportDetail` | Get report details |
| Clients | `GET` | `/api/Clients/GetReportFillRates` | Gets a report of fill rates across a period |
| Clients | `GET` | `/api/Clients/GetReportList` | Gets a list of reports available to client user |
| Clients | `GET` | `/api/Clients/GetReportShiftAnalysis` | Gets a shift analysis report across a period |
| Clients | `GET` | `/api/Clients/GetReportTempFulfilment` | Gets a temp fulfilment report |
| Clients | `GET` | `/api/Clients/GetReportTempMI` | Gets a Temp Management Information report |
| Clients | `GET` | `/api/Clients/GetReportTempRota` | Gets a temp rota report |
| Clients | `GET` | `/api/Clients/GetReportTimesheetChargeSummary` | Gets a report summarising timesheet charges across a period |
| Clients | `GET` | `/api/Clients/GetReportWeeklyCandidateStatus` | Gets a weekly candidate status report |
| Clients | `GET` | `/api/Clients/GetTalentBankCandidates` | Get Talent bank candidates |
| Clients | `GET` | `/api/Clients/GetTimesheets` | Gets a list of client user's timesheets based on search criteria |
| Clients | `GET` | `/api/Clients/GetUserCanEditJob` | Confirms whether the user is entitled to edit a job |
| Clients | `GET` | `/api/Clients/GetUserIsAdmin` | Get whether the user is an admin for their client |
| Clients | `GET` | `/api/Clients/GetUserIsGroupAdmin` | Get whether the user is an admin for their client's group |
| Clients | `PUT` | `/api/Clients/ResetTimesheetForDay` | Resets a timesheet day to its original status |
| Clients | `GET` | `/api/Clients/SearchCandidates` | Searches candidates using keywords and returns the top 50 ordered by percentage match |
| Clients | `PUT` | `/api/Clients/SendTimesheetNotificationToConsultant` | Send a notification to the consultant that owns a timesheet |
| Clients | `PUT` | `/api/Clients/SendTimesheetQueryToConsultant` | Send a query to the consultant that owns a timesheet |
| Clients | `PUT` | `/api/Clients/UpdateBonusFigure` | Updates a day's bonus figure |
| Clients | `PUT` | `/api/Clients/UpdateJobDescription` | Updates a job description |
| Clients | `PUT` | `/api/Clients/UpdateJobDetails` | Update a jobs details |
| Clients | `PUT` | `/api/Clients/UpdateJobOrderNo` | Update the job's order number |
| Clients | `PUT` | `/api/Clients/UpdateJobSpec` | Update the spec for a job, notifying the job's consultant if need be |
| Clients | `PUT` | `/api/Clients/UpdateJobTitle` | Update job title |
| Clients | `PUT` | `/api/Clients/UpdateShiftAllowance` | Update day's shift quantity |
| Clients | `PUT` | `/api/Clients/UpdateTimesheetArray` | Updates an array of timesheet days |
| Clients | `PUT` | `/api/Clients/UpdateTimesheetDay` | Updates a timesheet day |
| General | `GET` | `/api/General/GetAllClassesAndCodes` | Get all classes and codes |
| General | `GET` | `/api/General/GetAppConfig` | Gets the app configuration using the default Auriga name |
| General | `GET` | `/api/General/GetAppConfigByName` | Gets the app configuration with a specific App Name |
| General | `GET` | `/api/General/GetAvailabilityCodes` | Get list of availability codes |
| General | `GET` | `/api/General/GetConfig` | Get list of config settings |
| General | `GET` | `/api/General/GetMandFields` | Get mandatory fields based on table name |
| General | `GET` | `/api/General/GetStartingDay` | Get the starting day for MatchMaker weeks |
| General | `GET` | `/api/General/GetValidationTable` | Gets a list of validated table values |
| General | `GET` | `/api/General/GetValidationTableVersion` | Get updated date of validated field |
| General | `GET` | `/api/General/GetVersion` |  |
| General | `GET` | `/api/General/GetWipStatusList` | Get available work-in-progress (WIP) actions |
| General | `GET` | `/api/General/GetWorkAvailCodes` | Get list of work/availability codes |
| Jobs | `GET` | `/api/Jobs/GetAllClassesAndCodes` | Get all classes and codes |
| Jobs | `GET` | `/api/Jobs/GetAvailableActions/{id}` | Get list of available actions for a job |
| Jobs | `GET` | `/api/Jobs/GetClassAndCodes/{id}` | Get all codes for a class |
| Jobs | `GET` | `/api/Jobs/GetClassAndCodesRaw/{id}` | Get class and codes (raw formatting) |
| Jobs | `GET` | `/api/Jobs/GetClassNameAndVersion/{id}` | Get class name and version |
| Jobs | `GET` | `/api/Jobs/GetClientPicture/{id}` | Get client picture |
| Jobs | `GET` | `/api/Jobs/GetDefaultJobService/{id}` | Get default job service |
| Jobs | `GET` | `/api/Jobs/GetJobActionsSummary/{id}` | Get job actions summary |
| Jobs | `GET` | `/api/Jobs/GetJobCodes/{id}` | Get codes that are assigned to a job |
| Jobs | `GET` | `/api/Jobs/GetJobConsultant/{id}` | Get consultant assigned to a job |
| Jobs | `GET` | `/api/Jobs/GetJobDescription/{id}` | Gets the job description if uploaded |
| Jobs | `GET` | `/api/Jobs/GetJobDetails/{id}` | Get job details based on job ID being provided |
| Jobs | `GET` | `/api/Jobs/GetJobHasQuestionnaire/{id}` | Check if job has a questionnaire |
| Jobs | `GET` | `/api/Jobs/GetJobHasSpec/{id}` | Check if a job has a spec uploaded |
| Jobs | `GET` | `/api/Jobs/GetJobIsPublishedOnWeb/{id}` | Check if job is publish on Epsilon |
| Jobs | `GET` | `/api/Jobs/GetJobQuestion/{id}` | Get a specific job question |
| Jobs | `GET` | `/api/Jobs/GetJobQuestions/{id}` | Get list of questions assigned to a job |
| Jobs | `GET` | `/api/Jobs/GetJobQuestionsCount/{id}` | Get number of questions assigned to a job |
| Jobs | `GET` | `/api/Jobs/GetJobSpec/{id}` | Get a job's spec if uploaded |
| Jobs | `GET` | `/api/Jobs/GetJobSpecHTML/{id}` | Get a job's spec if uploaded, in HTML format |
| Jobs | `GET` | `/api/Jobs/GetServiceList` | Get full list of possible services |
| Jobs | `GET` | `/api/Jobs/GetShifts/{id}` | Returns a list of upcoming shifts for a job 04/11/2020 DC - Updated to allow paging |
| Jobs | `GET` | `/api/Jobs/GetStatusList` | Get full list of possible statuses |
| Jobs | `GET` | `/api/Jobs/GetValidationsForQuestion/{id}` | Get list of valid options for a question |
| Jobs | `PUT` | `/api/Jobs/ProcessJobAlerts` | Get a list of new job alerts and sending corresponding emails if desired |
| Jobs | `PUT` | `/api/Jobs/SaveJobLocation` |  |
| Jobs | `GET` | `/api/Jobs/Search` | Search jobs for a list of results based on provided search criteria |
| Jobs | `GET` | `/api/Jobs/SearchClassCodes/{id}` | Search class codes using |
| Jobs | `GET` | `/api/Jobs/SearchNew` | Search jobs for a list of results based on provided search criteria |
