# ILBSL Leadership Meeting — Digital Attendance Form

Single-page attendance form with day/session picker, participant details, and on-screen signature capture. Frontend is a static HTML file (host on GitHub Pages); backend is Google Apps Script (writes to a Google Sheet).

## How it fits together

```
QR code → GitHub Pages (index.html) → fetch(POST) → Google Apps Script Web App → Google Sheet (+ optional Drive folder for signature PNGs)
```

## 1. Set up the Google Sheet + Apps Script backend

1. Create a new Google Sheet (e.g. "ILBSL Leadership Meeting — Attendance").
2. Extensions → Apps Script.
3. Delete the default code, paste in `Code.gs`.
4. (Optional) If you want signatures saved as separate PNG files instead of base64 text in the sheet:
   - Create a Drive folder, e.g. "Attendance Signatures".
   - Copy its folder ID from the URL and paste into `SIGNATURE_FOLDER_ID` in Code.gs.
5. Deploy → New deployment → type: Web app.
   - Execute as: Me
   - Who has access: Anyone
6. Click Deploy, authorize the script, and copy the Web app URL (ends in `/exec`).

## 2. Wire the frontend to the backend

1. Open `index.html`.
2. Find this line near the bottom `<script>`:
   ```js
   const SCRIPT_URL = "PASTE_YOUR_GOOGLE_APPS_SCRIPT_WEB_APP_URL_HERE";
   ```
3. Replace with the Web app URL from step 1.6.

## 3. Deploy the form on GitHub Pages

1. Create a repo, e.g. `ilbsl-leadership-meeting-attendance`.
2. Push `index.html` to it (root, or a `/docs` folder).
3. Repo → Settings → Pages → Source: deploy from branch → main (root or /docs).
4. GitHub gives you a URL like: `https://<your-username>.github.io/ilbsl-leadership-meeting-attendance/`

## 4. Generate the QR code

Once you have the live GitHub Pages URL, generate a QR code pointing to it. Easiest no-signup option — paste this URL in a browser (replace the `data=` value with your actual link):

```
https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=https://your-username.github.io/ilbsl-leadership-meeting-attendance/
```

Download the resulting PNG and put it on a printed sign or the projector screen at the venue entrance / each session's check-in point.

## 5. On the day

- Print the QR code at A4/A3 size, place at breakfast/entrance and at the Day 2 branch-review room.
- Participants scan → select Day → select the specific session/check-in point → fill details → sign → submit.
- Since NPL review sessions on Day 2 are branch-specific, you can either:
  - have participants pick their own session from the list, or
  - print a separate QR per session if you want to lock attendance to a specific time block (just append `?session=NPL Review: Branches 20.01%25 and above` style params later if you want auto-select — not wired in v1, keep it manual for now, simpler and safer).
- All entries land in the "Attendance" tab of the Google Sheet in real time, timestamped, with signature either embedded (base64) or linked (Drive file).

## Notes / things worth deciding before rollout

- **Access control:** "Anyone" access on the Web App means anyone with the link can submit. Fine for an internal, QR-gated form at a physical venue. If you want to restrict to ILBSL Google Workspace accounts, change "Who has access" to "Anyone within [your domain]" (requires Workspace).
- **Duplicate submissions:** not currently blocked. If needed, add a check in Code.gs matching mobile number + session before appending.
- **Offline/poor network at venue:** GitHub Pages + Apps Script both need internet. If venue wifi is unreliable, consider a fallback paper sheet for that session and back-fill later.
- **Export:** Sheet can be exported to Excel/PDF directly from Google Sheets for the meeting report/minutes.
