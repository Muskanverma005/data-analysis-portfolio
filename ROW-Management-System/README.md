# ROW Management System

> Enterprise-style Fibre Right-of-Way (ROW) Approval Management System for managing authorities, applications, users, approvals, permits, and operational reporting through a centralized web-based platform.

---

## 📌 Overview

The **ROW Management System** is a full-stack web application designed to digitize and centralize the management of **Right-of-Way (ROW) permissions and fibre network approval workflows**.

The system provides a centralized workspace where authorized users can manage ROW-related applications, authorities, users, approval information, and reports without relying on fragmented manual processes.

The application follows a modern **React + FastAPI + MySQL** architecture and provides separate frontend and backend layers for maintainability, scalability, and secure API-based communication.

---

## 🎯 Project Objectives

The primary objectives of the system are to:

* Centralize ROW application and approval information.
* Provide structured management of authorities and regulatory entities.
* Enable administrators to manage system users and access roles.
* Provide dashboard-level visibility into operational data.
* Simplify application tracking and monitoring.
* Provide reporting capabilities for management and operational teams.
* Reduce dependency on manual spreadsheets and fragmented records.
* Improve data consistency and accessibility.
* Provide a scalable foundation for future ROW workflow automation.

---

## ✨ Key Features

### 📊 Dashboard

The dashboard provides a centralized overview of ROW operations and key business information.

Key capabilities include:

* Summary KPIs
* Application statistics
* Operational overview
* Status-based information
* Visual data representation
* Management-oriented reporting view

---

### 🏛️ Authorities Management

The Authorities module provides centralized management of authorities involved in the ROW approval process.

Capabilities include:

* View authority records
* Add authorities
* Edit authority information
* Search and filter authority records
* Track authority-related information
* Centralized authority directory

---

### 📄 Applications Management

The Applications module is designed to manage ROW-related applications throughout the approval process.

Capabilities include:

* Application listing
* Application information management
* Application status tracking
* Search and filtering
* Application-level operational visibility
* Structured application records

---

### 👥 Users Management

The Users module provides administrative control over system users.

Capabilities include:

* View registered users
* Create new users
* Edit existing users
* Search users
* Filter users by role
* Filter users by account status
* Role-based user information
* Active/inactive user monitoring
* Pagination for user records

Supported roles include:

* Administrator
* Project Manager
* RoW Coordinator
* Approver
* Management

> User deletion/deactivation is intentionally not exposed through the current frontend because the current backend does not provide a DELETE user endpoint.

---

### 📑 Reports

The Reports module provides centralized visibility into system and operational information for reporting and management purposes.

It is intended to support:

* Operational monitoring
* Data analysis
* Management reporting
* Application-related insights
* Structured business information

---

## 🏗️ System Architecture

The application follows a **three-layer architecture**:

```text
┌─────────────────────────────────────────────┐
│                  Frontend                   │
│                                             │
│          React 18 + Vite                    │
│          React Router                       │
│          Axios / API Client                 │
│          React Icons                        │
└──────────────────────┬──────────────────────┘
                       │
                       │ REST API / HTTP
                       ▼
┌─────────────────────────────────────────────┐
│                  Backend                    │
│                                             │
│               FastAPI                      │
│          Python 3.11+                      │
│          RESTful API Layer                 │
│          Authentication & Business Logic   │
└──────────────────────┬──────────────────────┘
                       │
                       │ Database Connection
                       ▼
┌─────────────────────────────────────────────┐
│                  Database                   │
│                                             │
│                 MySQL 8                    │
│          Persistent Application Data       │
└─────────────────────────────────────────────┘
```

### Architecture Flow

```text
User
  │
  ▼
React Frontend
  │
  │ HTTP / REST API
  ▼
FastAPI Backend
  │
  ├── Authentication
  ├── Validation
  ├── Business Logic
  └── API Processing
  │
  ▼
MySQL Database
```

---

## 🛠️ Technology Stack

### Frontend

| Technology   | Purpose                       |
| ------------ | ----------------------------- |
| React 18     | Frontend application          |
| Vite         | Development and build tooling |
| React Router | Client-side routing           |
| Axios        | API communication             |
| React Icons  | UI icons                      |
| CSS3         | Application styling           |

### Backend

| Technology   | Purpose                      |
| ------------ | ---------------------------- |
| Python 3.11+ | Backend programming language |
| FastAPI      | REST API framework           |
| Uvicorn      | ASGI server                  |
| SQLAlchemy   | Database ORM                 |
| Alembic      | Database migrations          |
| Pydantic     | Data validation              |
| JWT          | Authentication mechanism     |

### Database

| Technology | Purpose             |
| ---------- | ------------------- |
| MySQL 8    | Relational database |

---

## 📂 Project Structure

The project is organized into separate frontend and backend applications.

```text
ROW-Management-System/
│
├── backend/
│   ├── app/
│   │   ├── ...
│   │   └── main.py
│   │
│   ├── alembic/
│   ├── requirements.txt
│   └── ...
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── styles/
│   │   ├── api/
│   │   └── ...
│   │
│   ├── package.json
│   └── vite.config.js
│
├── .env.example
├── README.md
└── ...
```

> The exact internal folder structure may vary depending on the final repository organization.

---

# 🔐 Authentication & Authorization

The system includes authenticated access for protected application functionality.

The authentication layer is responsible for:

* User login
* Credential validation
* Token-based authentication
* Authenticated API communication
* User identity management
* Role information

Protected resources should only be accessed by authorized users.

### Security Recommendations

For production deployment:

* Never commit `.env` files.
* Never commit real database credentials.
* Change default/seed credentials immediately.
* Use strong passwords.
* Store secrets using environment variables or a secrets manager.
* Use HTTPS in production.
* Configure appropriate CORS origins.
* Rotate authentication secrets periodically.

---

# 🗄️ Database

The application uses **MySQL 8** as its relational database.

The database stores structured information required by the ROW management workflow, including application, authority, user, and related operational records.

Database schema changes are managed using **Alembic migrations**.

### Migration Workflow

```bash
alembic upgrade head
```

This applies the latest database migrations.

---

# ⚙️ Local Development Setup

## Prerequisites

Make sure the following are installed:

* Python 3.11+
* Node.js 20+
* npm
* MySQL 8
* Git

---

## 1. Clone the Repository

```bash
git clone <repository-url>
cd ROW-Management-System
```

---

## 2. Configure MySQL

Create the application database:

```sql
CREATE DATABASE rowdb;
```

Configure the database connection through the backend environment configuration.

Example:

```env
DATABASE_URL=mysql+pymysql://<username>:<password>@localhost:3306/rowdb
```

Do not commit your actual credentials to GitHub.

---

# 🚀 Backend Setup

Navigate to the backend directory:

```bash
cd backend
```

### Create Virtual Environment

Windows:

```bash
python -m venv venv
venv\Scripts\activate
```

Linux/macOS:

```bash
python3 -m venv venv
source venv/bin/activate
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Run Database Migrations

```bash
alembic upgrade head
```

### Seed Initial Data

If the seed module is included in your current backend:

```bash
python -m app.seed
```

### Start FastAPI Server

```bash
uvicorn app.main:app --reload
```

Backend will normally be available at:

```text
http://localhost:8000
```

---

# 💻 Frontend Setup

Open a new terminal and navigate to the frontend:

```bash
cd frontend
```

Install dependencies:

```bash
npm install
```

Start the development server:

```bash
npm run dev
```

Frontend will normally be available at:

```text
http://localhost:5173
```

---

# 📚 API Documentation

FastAPI automatically provides interactive API documentation.

### Swagger UI

```text
http://localhost:8000/docs
```

### ReDoc

```text
http://localhost:8000/redoc
```

Swagger can be used during development to:

* Explore available APIs
* Test API requests
* Inspect request parameters
* Inspect response structures
* Validate backend functionality

---

# 🔌 API Overview

The backend exposes REST APIs consumed by the React frontend.

Typical resource groups include:

| Module         | Method       | Purpose                        |
| -------------- | ------------ | ------------------------------ |
| Authentication | POST         | User login                     |
| Users          | GET          | Retrieve users                 |
| Users          | POST         | Create user                    |
| Users          | PUT          | Update user                    |
| Authorities    | GET/POST/PUT | Manage authorities             |
| Applications   | GET/POST/PUT | Manage applications            |
| Dashboard      | GET          | Retrieve dashboard information |
| Reports        | GET          | Retrieve reporting information |

> Refer to the Swagger documentation at `/docs` for the exact endpoints, request schemas, parameters, and response models implemented in the current backend.

---

# 🔄 Application Workflow

The high-level operational flow is:

```text
User Login
    │
    ▼
Dashboard
    │
    ├── Authorities
    │
    ├── Applications
    │
    ├── Users
    │
    └── Reports
```

Users interact with the React interface, which communicates with the FastAPI backend through REST APIs.

The backend validates requests, processes business logic, and communicates with the MySQL database.

---

# 🧪 Testing & Validation

Before deployment, the application should be validated across the following areas:

### Frontend

* Login flow
* Navigation
* Dashboard rendering
* CRUD operations supported by the backend
* Search and filters
* Pagination
* Form validation
* Error states
* Responsive layouts

### Backend

* Authentication
* API validation
* Database connectivity
* CRUD operations
* Error handling
* Migration consistency
* API response validation

### Integration

* Frontend ↔ Backend API communication
* Authentication token handling
* Database persistence
* Form submission
* API error handling

---

# 📊 Production Considerations

For production deployment, consider:

* Production-grade MySQL configuration
* HTTPS
* Secure secret management
* Environment-specific configuration
* CORS restrictions
* Database backup strategy
* Logging and monitoring
* API rate limiting where appropriate
* Centralized error monitoring
* Automated CI/CD pipeline
* Reverse proxy such as Nginx
* Containerization using Docker if required

---

# 💾 Database Backup

A MySQL database backup can be created using:

```bash
mysqldump -u <username> -p rowdb > row-backup.sql
```

Restore using:

```bash
mysql -u <username> -p rowdb < row-backup.sql
```

Always verify backup and restore procedures before using them in a production environment.

---

# 🔮 Future Enhancements

Potential future improvements include:

* Advanced role-based access control
* Granular permissions
* Application approval workflow automation
* Email and notification integration
* Document management
* Automated expiry alerts
* Advanced analytics
* Exportable reports
* Audit trail and activity monitoring
* Advanced search
* Production deployment automation
* Docker-based deployment
* CI/CD integration

---

# 📌 Project Status

**Status: Completed — Frontend & Backend**

The current version includes the core web application, backend APIs, database integration, authentication, user management, authority management, application management, dashboard, and reporting functionality.

Further enhancements can be added based on evolving business and operational requirements.

---

# 👨‍💻 Development

This project was developed as a full-stack enterprise application for managing fibre Right-of-Way approval operations.

The implementation focuses on:

* Modular architecture
* REST API communication
* Relational database design
* Authentication
* Structured user management
* Business-oriented dashboards
* Maintainable frontend components
* Scalable backend architecture

---

# 📄 License

This project is intended for authorized organizational and educational use.

Add the organization's approved license or usage terms here before public distribution.

---

## ⭐ Summary

The **ROW Management System** provides a centralized digital platform for managing fibre Right-of-Way operations, combining:

**React Frontend + FastAPI Backend + MySQL Database**

into a structured enterprise-style application for operational management, approval tracking, user administration, and reporting.
