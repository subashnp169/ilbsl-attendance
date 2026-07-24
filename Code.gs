/**
 * ILBSL Leadership Meeting — Attendance Backend
 * Deploy as: Extensions > Apps Script (inside a Google Sheet) > Deploy > Web App
 *   - Execute as: Me
 *   - Who has access: Anyone (or "Anyone with Google account" if you want to restrict)
 * Copy the Web App URL into SCRIPT_URL in index.html
 */

const SHEET_NAME = "Attendance";
// Optional: set a Drive folder ID to store signature images as PNG files.
// Leave blank ("") to store signatures only as base64 in the sheet.
const SIGNATURE_FOLDER_ID = "";

function doPost(e) {
  try {
    const data = JSON.parse(e.postData.contents);
    const sheet = getSheet_();

    let sigLink = "";
    if (SIGNATURE_FOLDER_ID && data.signature) {
      sigLink = saveSignature_(data.signature, data.fullName, data.timestamp);
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
      sigLink || (data.signature ? "embedded" : ""),
      SIGNATURE_FOLDER_ID ? "" : (data.signature || "")
    ]);

    return ContentService
      .createTextOutput(JSON.stringify({ status: "ok" }))
      .setMimeType(ContentService.MimeType.JSON);

  } catch (err) {
    return ContentService
      .createTextOutput(JSON.stringify({ status: "error", message: err.message }))
      .setMimeType(ContentService.MimeType.JSON);
  }
}

function doGet(e) {
  return ContentService.createTextOutput("ILBSL Attendance API is live.");
}

function getSheet_() {
  const ss = SpreadsheetApp.getActiveSpreadsheet();
  let sheet = ss.getSheetByName(SHEET_NAME);
  if (!sheet) {
    sheet = ss.insertSheet(SHEET_NAME);
    sheet.appendRow([
      "Timestamp", "Day", "Session", "Full Name", "Branch/Department",
      "Designation", "Employee ID", "Mobile", "Signature File/Type", "Signature (base64, if not using Drive)"
    ]);
    sheet.setFrozenRows(1);
  }
  return sheet;
}

function saveSignature_(base64Png, fullName, timestamp) {
  const folder = DriveApp.getFolderById(SIGNATURE_FOLDER_ID);
  const raw = base64Png.split(",")[1] || base64Png;
  const bytes = Utilities.base64Decode(raw);
  const safeName = (fullName || "unknown").replace(/[^a-zA-Z0-9]/g, "_");
  const fileName = `sig_${safeName}_${timestamp || Date.now()}.png`;
  const blob = Utilities.newBlob(bytes, "image/png", fileName);
  const file = folder.createFile(blob);
  file.setSharing(DriveApp.Access.ANYONE_WITH_LINK, DriveApp.Permission.VIEW);
  return file.getUrl();
}
