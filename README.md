# Student Attendance Management System

A full-stack, role-based application for tracking student attendance.

## Tech Stack
- **Backend**: Spring Boot 3.x, Spring Data JPA, Spring Security, JWT Auth, MySQL
- **Frontend**: Vanilla HTML/JS, Tailwind CSS, Axios, jsPDF (No Node.js/build step required)

## Roles
- **Admin**: Has access to User, Class, and Subject management.
- **Faculty**: Can view assigned classes and submit attendance.
- **Student**: Can view attendance summary, download PDF reports, and view warnings for low attendance.

## Setup Instructions

### 1. Database Setup
Ensure you have MySQL running locally.
Run the two SQL scripts located in the root of the workspace:
1. `schema.sql`: Creates the `attendance_db` and all tables.
2. `data.sql`: Seeds the database with default users, faculty, students, subjects, classes, and timetables.

### 2. Backend Setup
The backend is a standard Maven project.
1. Open a terminal in `attendance-backend`.
2. Run `mvnw spring-boot:run` (or use your IDE to run `AttendanceBackendApplication.java`).
3. The server will start on `http://localhost:8080`.

### 3. Frontend Setup
Because this frontend uses a zero-build architecture, you don't need Node.js or `npm`.
1. Open the `attendance-frontend` folder.
2. Simply double-click `index.html` to open it in your browser. Or, for a better experience, serve it using any simple local server (e.g. `python -m http.server 3000` or the VS Code Live Server extension).

## Default Accounts
| Role | Email | Password |
|---|---|---|
| Admin | admin@example.com | password |
| Faculty | smith@faculty.example.com | password |
| Student | alice@student.example.com | password |
