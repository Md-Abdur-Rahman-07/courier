# Courier Management System

**A PHP and MySQL-based web application for managing courier operations, parcel deliveries, branch records, and shipment tracking.**

> **Academic project:** Developed for a Software Engineering Lab course to demonstrate a database-driven web application using PHP, MySQL, and web technologies.

## Overview

The **Courier Management System** brings common courier-service operations into one web interface. Authorized users can manage parcels, branch information, staff and users, monitor parcel delivery statuses, and generate reports. Parcels are assigned reference numbers that can be used to retrieve their tracking history.

This repository is an **educational/lab project**, not a production-ready courier service.

## Features

- **Dashboard:** View the application's main management interface.
- **Parcel management:** Create, view, edit, and delete parcel records, including sender/recipient details, dimensions, weight, and price.
- **Parcel reference numbers:** Generate unique reference numbers for parcel records.
- **Shipment tracking:** Look up a parcel by its reference number and view its status history.
- **Delivery status updates:** Update a parcel's current status and record status changes in the tracking history.
- **Branch management:** Create, edit, list, and delete courier branch records.
- **Staff and user management:** Manage employee and user information through the administration interface.
- **Reports:** Filter parcel records by date range and delivery status.
- **Printable details:** Access parcel detail and report-related views suitable for printing.
- **System settings:** Configure application-level information through the management interface.

### Parcel status workflow

The application includes the following shipment status labels:

`Item Accepted by Courier` → `Collected` → `Shipped` → `In-Transit` → `Arrived At Destination` → `Out for Delivery` → `Delivered`

It also includes `Ready to Pickup`, `Picked-up`, and `Unsuccessfull Delivery Attempt` status values. These represent available status options, not a strictly enforced sequence.

## Tech Stack

| Layer | Technologies |
| --- | --- |
| Backend | PHP |
| Database | MySQL |
| Database access | MySQLi |
| Frontend | HTML, CSS, JavaScript |
| Local development | Apache and MySQL, e.g. through XAMPP |

## Getting Started

### Prerequisites

- A local PHP-capable web server, such as **XAMPP** (Apache + PHP + MySQL/MariaDB)
- A MySQL-compatible database server
- A browser
- Git (optional)

### 1. Download the repository

Clone the project:

```bash
git clone https://github.com/Md-Abdur-Rahman-07/courier.git
```

Or download the repository as a ZIP file and extract it.

### 2. Place the project in your web server directory

For a default Windows XAMPP installation, place the `courier` folder inside:

```text
C:\xampp\htdocs\courier
```

### 3. Start Apache and MySQL

Open the **XAMPP Control Panel** and start **Apache** and **MySQL**.

### 4. Create and import the database

1. Open `http://localhost/phpmyadmin/`.
2. Create a database named **`courier_m`**.
3. Check the repository's [`database/`](database/) directory for the provided SQL export.
4. If a SQL export is present, select `courier_m`, choose **Import**, select the SQL file, and import it.
5. Confirm that the required tables have been created.

> **Note:** The exact SQL export filename and a working set of seed credentials were not verified during this documentation review. Do not assume the application will run without importing the appropriate schema and data.

### 5. Configure the database connection

Open [`db_connect.php`](db_connect.php). Replace its existing connection statements with **one** MySQLi connection using credentials for your local environment:

```php
<?php
$host = 'localhost';
$username = 'root';
$password = ''; // Set to your local MySQL password if applicable
$database = 'courier_m';

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die('Database connection failed. Check your local configuration.');
}
```

The empty password above is only an example for a local XAMPP setup; do not use it as a production configuration. Do not commit real database credentials to a public repository.

### 6. Open the application

Visit:

```text
http://localhost/courier/
```

For the authentication screen, you can also open:

```text
http://localhost/courier/login.php
```

Use an account that exists in your imported database. If none exists, create an appropriate test account using a safe local development process. **No default username or password is documented here because the repository's working login credentials were not confirmed.**

## How It Works

1. An authorized user signs into the application.
2. Branch and staff records can be managed through the administrative pages.
3. New parcel records are saved in the database with generated reference numbers.
4. A parcel's delivery status can be updated as it moves through the courier process.
5. Each status update is also written to the parcel tracking history.
6. A reference number can be used to retrieve a parcel's tracking history.
7. Reports can be generated by date range and delivery status.

## Database Design

The PHP source code references the following MySQL tables:

| Table | Purpose |
| --- | --- |
| `users` | Account and user information |
| `branches` | Courier branch information |
| `parcels` | Parcel information, reference numbers, prices, and current status |
| `parcel_tracks` | History of parcel status changes |
| `system_settings` | Application settings |

The design separates **current parcel information** (`parcels`) from **status history** (`parcel_tracks`), allowing the tracking page to display delivery progress over time. Refer to the SQL export for authoritative column definitions, keys, and constraints.

## Project Structure

```text
courier/
├── assets/                  # Frontend assets and related resources
├── database/                # Database-related files
├── admin_class.php          # Server-side actions and database operations
├── ajax.php                 # AJAX request handler
├── db_connect.php           # Database connection configuration
├── index.php                # Main application entry point
├── login.php                # Login interface
├── home.php                 # Dashboard/home content
├── track.php                # Parcel tracking interface
├── new_parcel.php           # Create parcel records
├── edit_parcel.php          # Edit parcel records
├── parcel_list.php          # List parcel records
├── view_parcel.php          # Parcel detail view
├── manage_parcel_status.php # Update parcel delivery status
├── branch_list.php          # Branch listings
├── new_branch.php           # Create branches
├── edit_branch.php          # Edit branches
├── staff_list.php           # Staff listings
├── new_staff.php            # Create staff records
├── reports.php              # Reporting interface
├── print_pdets.php          # Printable parcel details
├── system_settings.php      # Application settings
├── header.php               # Shared page header
├── footer.php               # Shared page footer
├── sidebar.php              # Sidebar navigation
└── README.md                # Project documentation
```

Additional PHP files support user management and other application views.

## Security and Limitations

This codebase was developed for coursework and **should be reviewed and hardened before internet-facing deployment**.

In particular, the current source contains patterns that require attention:

- **Hardcoded database credentials:** Remove passwords from tracked source files, rotate any previously exposed credentials, and use protected configuration or environment variables.
- **SQL injection risk:** Some database statements interpolate user-controlled values directly into SQL; migrate to parameterized prepared statements.
- **Password handling:** Replace legacy/unencrypted password comparisons and MD5 hashing with PHP's `password_hash()` and `password_verify()`.
- **Authentication and authorization:** Review login logic, sessions, and access controls for all administrative endpoints.
- **Input and file upload validation:** Validate server-side inputs and securely restrict uploaded file types and destinations.
- **Error reporting:** Disable display of detailed PHP errors in deployed environments.

Features and compatibility are described from the source files; this documentation does not claim a completed end-to-end test or production readiness.

## Academic Context

**Project:** Courier Management System  
**Course:** Software Engineering Lab  
**Project type:** Database-driven web application  
**Primary technologies:** PHP and MySQL  
**Repository:** [Md-Abdur-Rahman-07/courier](https://github.com/Md-Abdur-Rahman-07/courier)

The project demonstrates web-based CRUD operations, relational data storage, server-side processing, session-based user interaction, and shipment status tracking.

## Author

**Abdur Rahman Eshan**  
GitHub: [@Md-Abdur-Rahman-07](https://github.com/Md-Abdur-Rahman-07)

---

*Created as a Software Engineering Lab academic project.*
