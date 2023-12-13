
# Documentation on the setup and use of the open access knowledge sharing platform

This document contains detailed information about the components of the open access knowledge sharing platform and how to set them up, where not otherwise specified in their own documentation.
Necessary configuration files, database tables and examples are included in the repository and linked here.

## Necessary components and their basic configuration

### Liferay portal instance

The site has been tested (and is currently running) on Liferay 6.2 bundled with Tomcat.

### openBIS data management system to store and manage metadata.

The knowledge sharing platform is currently using openBIS version 18.06.2 to store omics data and metadata.

The platform uses a number of specific *controlled vocabularies* (e.g., different species, tissues and cells) as well as its own data model (all stored in openBIS). OpenBIS provides functionality to transfer the openBIS data model to any other openBIS instance. This import is done using the master data script described [here](https://unlimited.ethz.ch/display/openBISDoc1906/Jython+Master+Data+Scripts#JythonMasterDataScripts-Executingmasterdatascripts)
The necessary master data for the knowledge-sharing platform can be found [here](openBIS_masterdata).

Additionally, we are using several **core plugins** in openBIS, that allow the registration of omics data and the query of meta information to display on the platform. The complete version can be found in the following repositories:
[Jython scripts](https://github.com/qbicsoftware/etl-scripts)

[Java ETL scripts](https://github.com/qbicsoftware/java-openbis-dropboxes)

A smaller subset including pre-packaged libraries can be found on [this repository](basic_openbis_etl_scripts).

For new use cases and dataset types, it may be advantageous to adapt ETL scripts to the needs of the specific project. A documentation can be found [here](https://openbis.readthedocs.io/en/latest/software-developer-documentation/server-side-extensions/dss-dropboxes.html).

### MySQL database

We are using a MySQL database to store some additional administrative metadata like longer project and experiment descriptions not supported natively by openBIS, as well as experimental design information. The database schema is available [here](sql_tables) and can be imported into any other MySQL database.

### Portlets

As described below, both the Project Browser portlet and the portlet to create experiments and add measurements are included in the Liferay Site package. The latest versions and their source code can be found in their own repositories:

https://github.com/qbicsoftware/ipspine-input-portlet

https://github.com/qbicsoftware/projectbrowser-portlet

## Detailed configuration options for components

### Connecting (to) components

A config file for the Liferay instance is needed in order to store settings like connection info to the different parts of the platform (e.g., openBIS and mySQL). This is done in the [qbic-ext.properties file](portlet_config), which needs to be placed in the liferay installation directory.

### Liferay Site

A site needs to be created on the Liferay platform to display the different pages and components. This information is available in a [.lar file](liferay_site). Liferay allows for import of this web content via the Admin Panel. The portlet applications are included in this package, but updates of the Project Browser portlet can be downloaded from our GitHub repository.

### User management

Our software connects to openBIS using the admin account. For user management to work, the users logging into Liferay need to have their own openBIS account with the same screen name. The admin account then fetches the workspaces with projects they are allowed to see (see openBIS documentation). In the case of the prototype platform, both are connected to an LDAP system, so the accounts are the same by default.

 More detailed information on how to use the provided components can be found in the corresponding repositories.