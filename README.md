# ILBSL Leadership Meeting Portal

Full-featured single-page portal for the ILBSL Leadership, Strategy & Review Meeting (July 31 - August 1, 2026). Includes 4 tabs: **Attendance**, **Schedule**, **Feedback**, and **Report**.

## Features

- **Attendance** - Day/session picker, participant details, canvas signature pad
- **Schedule** - Full 2-day agenda with times and facilitators
- **Feedback** - Full survey form with star ratings, multiple choice, and open comments
- **Report** - Public attendance report with signatures, filters, stats, and print support

## Architecture

```
QR code -> GitHub Pages (index.html) -> fetch(POST/GET) -> Google Apps Script Web App -> Google Sheets
```

## Setup

### 1. Google Sheet + Apps Script

1. Create a new Google Sheet named "ILBSL Leadership Meeting Portal"
2. Go to Extensions -> Apps Script
3. Delete default code, paste the contents of `Code.gs`
4. Deploy -> New deployment -> Web app
   - Execute as: Me
   - Who has access: Anyone
5. Copy the Web App URL (ends in `/exec`)

### 2. Connect Frontend

1. Open `index.html`
2. Find `const SCRIPT_URL = "PASTE_YOUR_GOOGLE_APPS_SCRIPT_WEB_APP_URL_HERE";`
3. Replace with your Web App URL

### 3. Deploy to GitHub

1. Push this folder to a GitHub repo
2. Go to Settings -> Pages -> Source: deploy from branch -> main
3. Your portal will be live at `https://<username>.github.io/<repo>/`

### 4. Generate QR Code

```
https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=https://<username>.github.io/<repo>/
```

## Google Sheets Structure

The backend creates two sheets automatically:

**Attendance sheet:**
| Timestamp | Day | Session | Full Name | Branch/Department | Designation | Employee ID | Mobile | Signature |

**Feedback sheet:**
| Timestamp | Day | Session | Name | Branch/Department | Overall Rating | Content Quality | Speaker Effectiveness | Relevant to Role | Would Recommend | Comments | Improvements | Suggestions |

## API Endpoints

- `POST` - Submit attendance or feedback (determined by `type` field)
- `GET ?action=report` - Fetch all attendance records as JSON
- `GET ?action=feedback-report` - Fetch all feedback records as JSON
