# intERPrise
ILE Based Open Source CRM/ERP offering for the IBM i. 

## intERPrise Base ERP (Debtors, Creditors, Cashbook & GL)

A community driven **open source** initiative, to bring a **modern**, DB2 for i and ILE based, data-centric, multi-tier (MVC), NATIVE (to IBM i) base ERP application **free** to the entire IBM i installed base, subject to the terms of the Apache 2 licensing conditions.

It is especially important to note that this current release is an **alpha** 0.1 release that serves as a foundation to first solidify the architecture, integration points, education and skills requirements for participants and to iron out any issues in the GitHub processes. We strongly advise that you use the initial few distros, to familiarise yourself with the coding paradigm, the standards and the processes.

Also important to note that the committee are working with Axiom Systems, to delineate which database artefacts and functions fall within the ambit of the “Base ERP” (Debtors, Creditors, Cashbook & GL), and which fall outside. This is relevant due to potential referential (aka foreign key) constraints and the nature of their ERP, which is completely integrated.

The committee is also continuously busy to implement our recommended naming conventions on all the database artefacts that were harvested from the S2E models. Currently the complete application consist out of 898 tables.

Please review [our about page](http://www.i-nterprise.org/about.html) and [our standards](http://www.i-nterprise.org/standards---conventions.html) occasionally as this initiative evolves?

---

The following principles are **fundamental ** to this initiative:
 
* Absolute data-centricity (ALL data rules enforced by DB2 by way of triggers and constraints)
* ILE
* No DSPF’s (display files aka 5250)
* Absolute separation of concerns (MVC)
* Absolute leveraging of standard, unique IBM i capabilities (*MSGF, work management, *USRSPC, *USRIDX, journaling, commitment control, etc.)
* No “black-box” functionality
* No ISV product dependencies
* Open to ANY potential device and/or service (read front-end), interacting via JSON between the IBM I based solution and the “delivery channel” (read “client”).
* Absolutely no OPM (Original Program Model) code constructs will be acceptable.

**NOTE**: for all the 0.n **alpha** releases: please focus all your efforts on the `CRD000F`, `DEB000F` and `CSH000F` tables and all their associated components, in order to familiarise yourself with architecture and how all components interrelate. Should you have **any** suggestions on how the "Committee" (intERPrise Architectural and Standards Committee) can improve the architecture, to make it even more "open" and relevant, please forward your detailed suggestions to `management@i-nterprise.org`.

As soon as we announce the availability of the **alpha** 1.0 release, you can start sharing code contributions. Only code that implements and follow our published standards, will be considered for inclusion in future distros.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

The objective is to **only** use modern coding techniques. Our definition of when you are using ILE and RPG IV the way it should be, it will have most of the following attributes:
* `*SRVPGM` - Functions and Procedures bound into *SRVPGM and *PGM
* Activation Groups - **no** execution in the **default** (at least `QILE` named activation group) activation group (in general, bar exceptions)
* BIF’s
* Single Instance, reusable code components
* Separation of concerns (aka MVC, aka “multi-tier” architecture)
 
ILE C and ILE Cobol contributions are welcome, but MUST implement single Instance, reusable code components.

## Prerequisites

The following tools and technologies are used by our team:

1.	AO Foundation
2.	RDi
3.	ILE-RPG Education resources
4.	Standard IBM i development tooling (compilers, ADTS, etc.)
5.	MiWorkplace tooling
6.	iWebSrv for INITIAL “delivery channel”

It is especially important that you are familiar and adopt with the ILE development paradigm. The **free** education resource at [this link](http://www.ile-rpg.org/education.html) will provide you with most, if not all that you may require.

## Installing

Please Note this is the initial test, we will be providing CLP to carry out the build in the near future.

1.	Create Application Schemas
2.	`IRP_DB_P` (intERPrise Database Schema)
3.	Create Schema
4.	Create the schema using the IBM i command `CRTLIB`, not the `SQL CREATE SCHEMA` statement.
5.	Create a Journal Receiver. Recommended name is the standard for all schemas – `JRNRCV0001`.
6.	Create a Journal for the receiver. The standard name for all schemas is `JRN`.
7.	Start journaling for the schema using `STRJRNLIB`
8.	`IRP_P` (intERPrise Application Schema)
9.	Create Schema
10.	Create the schema using the IBM i command `CRTLIB`, not the `SQL CREATE SCHEMA` statement.
11.	This schema typically does not contain files and therefore journaling is not necessary. 
12.	Create the Binding Directory (`IRPSRV`)
13.	Create a single binding directory in the `IRP_P` schema calling it `IRPSRV`.
14.	Build the Error Handling Service Program (`ERRSRV@@`)
15.	Compile the 5 error handling `*MODULE`’s, `ERRSRV@01` through `05`.
16.	Then compile the service program builder `ERRSRV@@`. Once this has compiled successfully then call it from a command line to create the service program `ERRSRV@@`. 
17.	Register the `ERRSRV@@` service program in the `IRPSRV` binding directory. 
18.	Creating the Table Files
19.	To generate the table files, run the "Run SQL Statements (RUNSQLSTM)" command.
20.	Ensure the following parameters are properly set. `MARGINS(100)` and `DFTRDBCOL(IRP_DB_P)` 
21.	Repeat the above for each of the file source members.
22.	Creating the File I/O Server Modules/Procedures
23.	Compile the I/O Server modules for each file.
24.	Create the I/O Service Programs
25.	Compile the I/O Service program builder (`*@@.CLLE`) for each I/O Service Program.
26.	Change the `*CURLIB` to `IRP_DB_P` to build the `*SRVPGM`’s in the `IRP_DB_P` schema.
27.	Run each of these Service Program builders to create the I/O Service Programs for each of the datasets.
28.	Register each of the `*SRVPGM`’s created in the `IRPSRV` binding directory.
29.	Create the Error Message File
30.	Create an error message file (`ERRMSGF`) in the `IRP_P` schema
31.	Create the Validation Rules Modules/Procedures
32.	Compile the `IRPVRXXX@0` module. This module contains all the validation procedures for each individual field in the file needing to be validated.
33.	Create the Validation Rules Service Programs
34.	Compile the `IRPVRXXX@@` service program builder
35.	Change the `*CURLIB` to `IRP_DB_P` to build the `*SRVPGM` in the `IRP_DB_P` schema.
36.	Run the `IRPVRXXX@@` to create the service program.
37.	Register `IRPVRXXX@@` `*SRVPGM` created in the `IRPSRV` binding directory.
38.	Create Trigger Programs for Files
39.	Compile the trigger programs for each of the files provided.
40.	Attach each trigger program to the `*BEFORE`/`*INSERT` and `*BEFORE`/`*UPDATE` events of it’s related file using the `ADDPFTRG` command. 

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

## Initial Contributors

We thank the following companies who selflessly and kindly made their staff available to participate and donated base intellectual property to get this initiative launched:

* [Tembo](http://www.adsero-optima.com)
* [Axiom](http://www.axiom.co.za)
* [e-PFR technologies](http://www.iwebsrv.com)
* [Shield Advanced Solutions](https://shieldadvanced.com)

We also wish to recognise the individual contributions of the following people, who contributed their experience, knowledge, code bases, coding techniques, intellectual capital and guidance to deliver this project:

* [Tommy Atkins](https://www.linkedin.com/in/tommyatkins)
* [Gavin Beangstrom](https://www.linkedin.com/in/gavin-beangstrom-4344a74)
* [Matt Henderson](https://www.linkedin.com/in/matthewphenderson)
* [Chris Hird](https://www.linkedin.com/in/chrishird)
* [Les Holcroft](https://www.linkedin.com/in/lesholcroft)
* [Ted Holt](https://www.linkedin.com/in/ted-holt-14a483)
* [Dmitriy Kuznetsov](https://www.linkedin.com/in/dkuznetsov)
* [Mark Rowles](https://www.linkedin.com/in/mark-rowles-66489916)
* [Marinus Van Sandwyk](https://www.linkedin.com/in/mbogo)

See also the list of contributors who participated in this project.

## License

This project is licensed under the Apache 2.0 license – see the LICENSE.md file for details

## Acknowledgments

A special word of thanks goes to Chris Hird, who was the instigator behind this entire initiative.

We also wish to formally thank [Mihael Schmidt](https://www.linkedin.com/in/mihael-schmidt-09aa73106/) for his kind donation of his MiWorkplace IDE to participants who do not have access to RDi.
