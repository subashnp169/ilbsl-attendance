/**
 * ILBSL Leadership Meeting — Portal Backend
 * Deploy as: Extensions > Apps Script (inside a Google Sheet) > Deploy > Web App
 *   - Execute as: Me
 *   - Who has access: Anyone
 * Copy the Web App URL into SCRIPT_URL in index.html
 */

const ATTENDANCE_SHEET = "Attendance";
const FEEDBACK_SHEET = "Feedback";
const SIGNATURE_FOLDER_ID = "";

function doPost(e) {
  try {
    const data = JSON.parse(e.postData.contents);
    const type = data.type || "attendance";

    if (type === "feedback") {
      return handleFeedback_(data);
    }
    return handleAttendance_(data);

  } catch (err) {
    return ContentService
      .createTextOutput(JSON.stringify({ status: "error", message: err.message }))
      .setMimeType(ContentService.MimeType.JSON);
  }
}

function doGet(e) {
  const action = e.parameter.action;

  if (action === "report") {
    return jsonResponse_(getSheetData_(ATTENDANCE_SHEET));
  }
  if (action === "feedback-report") {
    return jsonResponse_(getSheetData_(FEEDBACK_SHEET));
  }

  return ContentService.createTextOutput("ILBSL Portal API is live.");
}

function handleAttendance_(data) {
  const sheet = getOrCreateSheet_(ATTENDANCE_SHEET, [
    "Timestamp", "Day", "Session", "Full Name", "Branch/Department",
    "Designation", "Employee ID", "Mobile", "Signature"
  ]);

  let sigValue = "";
  if (SIGNATURE_FOLDER_ID && data.signature) {
    sigValue = saveSignature_(data.signature, data.fullName, data.timestamp);
  } else if (data.signature) {
    sigValue = data.signature;
  }

  sheet.appendRow([
    new Date(data.timestamp || new Date()),
    data.day || "",
    data.session || "",
    data.fullName || "",
    data.branch || "",
    data.designation || "",
    data.empId || "",
    data.mobile || "",
    sigValue
  ]);

  return ContentService
    .createTextOutput(JSON.stringify({ status: "ok", type: "attendance" }))
    .setMimeType(ContentService.MimeType.JSON);
}

function handleFeedback_(data) {
  const sheet = getOrCreateSheet_(FEEDBACK_SHEET, [
    "Timestamp", "Day", "Session", "Name", "Branch/Department",
    "Overall Rating", "Content Quality", "Speaker Effectiveness",
    "Relevant to Role", "Would Recommend", "Comments",
    "Improvements", "Suggestions"
  ]);

  sheet.appendRow([
    new Date(data.timestamp || new Date()),
    data.day || "",
    data.session || "",
    data.name || "",
    data.branch || "",
    data.rating || "",
    data.contentQuality || "",
    data.speakerEffectiveness || "",
    data.relevantToRole || "",
    data.wouldRecommend || "",
    data.comments || "",
    data.improvements || "",
    data.suggestions || ""
  ]);

  return ContentService
    .createTextOutput(JSON.stringify({ status: "ok", type: "feedback" }))
    .setMimeType(ContentService.MimeType.JSON);
}

function getOrCreateSheet_(name, headers) {
  const ss = SpreadsheetApp.getActiveSpreadsheet();
  let sheet = ss.getSheetByName(name);
  if (!sheet) {
    sheet = ss.insertSheet(name);
    sheet.appendRow(headers);
    sheet.setFrozenRows(1);
  }
  return sheet;
}

function getSheetData_(name) {
  const ss = SpreadsheetApp.getActiveSpreadsheet();
  const sheet = ss.getSheetByName(name);
  if (!sheet) return [];

  const data = sheet.getDataRange().getValues();
  if (data.length <= 1) return [];

  const headers = data[0];
  const rows = [];
  for (let i = 1; i < data.length; i++) {
    const row = {};
    headers.forEach((h, j) => { row[h] = data[i][j]; });
    rows.push(row);
  }
  return rows;
}

function jsonResponse_(data) {
  return ContentService
    .createTextOutput(JSON.stringify(data))
    .setMimeType(ContentService.MimeType.JSON);
}

function saveSignature_(base64Png, fullName, timestamp) {
  const folder = DriveApp.getFolderById(SIGNATURE_FOLDER_ID);
  const raw = base64Png.split(",")[1] || base64Png;
  const bytes = Utilities.base64Decode(raw);
  const safeName = (fullName || "unknown").replace(/[^a-zA-Z0-9]/g, "_");
  const fileName = "sig_" + safeName + "_" + (timestamp || Date.now()) + ".png";
  const blob = Utilities.newBlob(bytes, "image/png", fileName);
  const file = folder.createFile(blob);
  file.setSharing(DriveApp.Access.ANYONE_WITH_LINK, DriveApp.Permission.VIEW);
  return file.getUrl();
}
