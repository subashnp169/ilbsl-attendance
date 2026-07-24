$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ILBSL Leadership Meeting Portal</title>
<style>
:root{--navy:#0b2545;--navy-2:#123a6b;--gold:#c8952b;--paper:#f7f5f0;--ink:#1c2530;--line:#d7d2c4;--ok:#1e7a3d;--err:#b3261e}
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;background:var(--paper);color:var(--ink);scroll-behavior:smooth}
.topbar{background:linear-gradient(135deg,var(--navy),var(--navy-2));color:#fff;padding:18px 20px 22px;text-align:center}
.topbar .eyebrow{letter-spacing:.14em;text-transform:uppercase;font-size:10px;color:var(--gold);font-weight:600}
.topbar h1{margin:4px 0 2px;font-size:17px;font-weight:700}
.topbar p{margin:0;font-size:12px;opacity:.8}
.nav{position:sticky;top:0;z-index:100;background:var(--navy);display:flex;overflow-x:auto;box-shadow:0 2px 8px rgba(0,0,0,.2)}
.nav a{flex:1;min-width:0;padding:11px 8px;color:rgba(255,255,255,.55);text-decoration:none;font-size:12px;font-weight:600;text-align:center;white-space:nowrap;border-bottom:3px solid transparent;transition:.2s}
.nav a:hover,.nav a.active{color:#fff;border-bottom-color:var(--gold);background:rgba(255,255,255,.07)}
.sec{max-width:680px;margin:0 auto;padding:16px;scroll-margin-top:48px}
.card{background:#fff;border:1px solid var(--line);border-radius:10px;padding:18px;margin-top:14px}
.card h2{font-size:12px;text-transform:uppercase;letter-spacing:.08em;color:var(--navy-2);margin:0 0 12px;border-bottom:2px solid var(--gold);padding-bottom:7px}
label{display:block;font-size:12px;font-weight:600;margin:12px 0 5px;color:var(--navy)}
label .req{color:var(--err)}
input[type=text],input[type=tel],select,textarea{width:100%;padding:10px 12px;border:1.5px solid var(--line);border-radius:7px;font-size:14px;background:#fff;color:var(--ink);font-family:inherit}
input:focus,select:focus,textarea:focus{outline:none;border-color:var(--navy-2)}
textarea{resize:vertical;min-height:70px}
.day-toggle{display:flex;gap:8px;margin-top:5px}
.day-toggle button{flex:1;padding:9px 6px;border:1.5px solid var(--line);background:#fff;border-radius:7px;font-size:12px;font-weight:600;color:var(--navy);cursor:pointer}
.day-toggle button.active{background:var(--navy);color:#fff;border-color:var(--navy)}
.session-list{display:flex;flex-direction:column;gap:6px;margin-top:5px}
.session-list label.opt{display:flex;align-items:flex-start;gap:8px;font-weight:400;font-size:13px;margin:0;padding:9px 11px;border:1.5px solid var(--line);border-radius:7px;cursor:pointer}
.session-list label.opt:has(input:checked){border-color:var(--navy);background:#f0f4f8}
.session-list input[type=radio]{margin-top:3px}
.sig-wrap{border:1.5px dashed var(--line);border-radius:8px;margin-top:6px;background:#fcfcfa;touch-action:none}
canvas#sigPad{width:100%;height:150px;display:block;cursor:crosshair;touch-action:none}
.sig-row{display:flex;justify-content:space-between;align-items:center;margin-top:5px}
.sig-hint{font-size:10px;color:#888}
.clear-btn{background:none;border:none;color:var(--navy-2);font-size:11px;font-weight:600;text-decoration:underline;cursor:pointer}
.submit-btn{width:100%;background:var(--navy);color:#fff;border:none;padding:13px;border-radius:8px;font-size:14px;font-weight:700;cursor:pointer;margin-top:18px}
.submit-btn:disabled{opacity:.5;cursor:not-allowed}
.msg{margin-top:12px;padding:10px 12px;border-radius:7px;font-size:12px;display:none}
.msg.show{display:block}
.msg.ok{background:#eaf6ee;color:var(--ok);border:1px solid #bfe3c9}
.msg.err{background:#fbeceb;color:var(--err);border:1px solid #f2c6c3}
.footer-note{text-align:center;font-size:10px;color:#999;margin-top:20px;padding-bottom:20px}
.success-screen{text-align:center;padding:36px 16px}
.success-screen .check{width:50px;height:50px;border-radius:50%;background:var(--ok);color:#fff;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;font-size:24px}
.success-screen h2{color:var(--navy);font-size:18px}
.success-screen p{color:#555;font-size:13px;margin-top:6px}
.sch-table{width:100%;border-collapse:collapse;font-size:13px;margin-top:8px}
.sch-table th{background:var(--navy);color:#fff;padding:8px 10px;text-align:left;font-size:11px;text-transform:uppercase}
.sch-table td{padding:8px 10px;border-bottom:1px solid var(--line);vertical-align:top}
.sch-table tr:nth-child(even){background:#fafaf7}
.sch-table .tm{white-space:nowrap;font-weight:600;color:var(--navy-2);font-size:12px;width:110px}
.sch-table .fc{color:#666;font-size:11px;font-style:italic}
.dh{background:var(--navy);color:#fff;padding:10px 14px;border-radius:8px;font-size:13px;font-weight:700;margin:16px 0 0;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:4px}
.dh span{font-size:11px;font-weight:400;opacity:.8}
.brk td{background:#f5f0e6 !important;font-style:italic;color:#888}
.sr{display:flex;gap:2px;margin-top:4px;direction:rtl;unicode-bidi:bidi-override}
.sr input{display:none}
.sr label{font-size:28px;color:var(--line);cursor:pointer;margin:0}
.sr label:hover,.sr label:hover~label,.sr input:checked~label{color:var(--gold)}
.rg{display:flex;flex-wrap:wrap;gap:8px;margin-top:5px}
.rg label{display:flex;align-items:center;gap:5px;font-weight:400;font-size:13px;padding:7px 12px;border:1.5px solid var(--line);border-radius:6px;cursor:pointer;margin:0}
.rg label:has(input:checked){border-color:var(--navy);background:#f0f4f8}
.rg input{margin:0}
.rh{display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:8px;margin-bottom:4px}
.rc{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:12px}
.rc select{flex:1;min-width:140px}
.sts{display:flex;gap:10px;margin-bottom:14px;flex-wrap:wrap}
.sb{flex:1;min-width:90px;background:var(--navy);color:#fff;border-radius:8px;padding:12px;text-align:center}
.sb .n{font-size:22px;font-weight:700;color:var(--gold)}
.sb .l{font-size:10px;opacity:.8;margin-top:2px}
.rw{overflow-x:auto}
.rt{width:100%;border-collapse:collapse;font-size:11px}
.rt th{background:var(--navy);color:#fff;padding:7px 8px;text-align:left;font-size:10px;text-transform:uppercase;white-space:nowrap}
.rt td{padding:6px 8px;border-bottom:1px solid var(--line);vertical-align:middle}
.rt tr:nth-child(even){background:#fafaf7}
.rt tr:hover{background:#f0f4f8}
.st{width:70px;height:35px;object-fit:contain;border:1px solid var(--line);border-radius:3px;background:#fff;cursor:pointer}
.pb{background:var(--gold);color:#fff;border:none;padding:10px 16px;border-radius:7px;font-size:12px;font-weight:700;cursor:pointer}
.rb{background:var(--navy-2);color:#fff;border:none;padding:10px 16px;border-radius:7px;font-size:12px;font-weight:700;cursor:pointer}
.mo{display:none;position:fixed;inset:0;background:rgba(0,0,0,.6);z-index:200;align-items:center;justify-content:center}
.mo.show{display:flex}
.mo img{max-width:90%;max-height:80vh;border-radius:8px;background:#fff;padding:8px}
.mo .cx{position:absolute;top:16px;right:20px;color:#fff;font-size:28px;cursor:pointer;background:none;border:none}
.divider{max-width:680px;margin:30px auto;border:none;border-top:2px solid var(--gold);opacity:.4}
@media print{.no-print,.topbar,.nav,.rc .pb,.rc .rb{display:none !important}body{background:#fff}.sec{padding:0;max-width:100%}.card{border:none;padding:8px}.rt{font-size:9px}.rt th{background:#333 !important;-webkit-print-color-adjust:exact;print-color-adjust:exact}.st{width:60px;height:30px}.sb,.dh{-webkit-print-color-adjust:exact;print-color-adjust:exact}@page{margin:.5cm;size:landscape}}
</style>
</head>
<body>
<div class="topbar">
<div class="eyebrow">Infinity Laghubitta Bittiya Sanstha Ltd.</div>
<h1>Leadership, Strategy &amp; Review Meeting</h1>
<p>July 31 - August 1, 2026</p>
</div>
<nav class="nav no-print" id="mainNav">
<a href="#sec-attendance" class="active">Attendance</a>
<a href="#sec-schedule">Schedule</a>
<a href="#sec-feedback">Feedback</a>
<a href="#sec-report">Report</a>
</nav>

<div class="sec" id="sec-attendance">
<form id="attForm">
<div class="card">
<h2>Session</h2>
<label>Day <span class="req">*</span></label>
<div class="day-toggle" id="dayToggle">
<button type="button" data-day="Day 1" class="active">Day 1 - Jul 31</button>
<button type="button" data-day="Day 2">Day 2 - Aug 1</button>
</div>
<label style="margin-top:14px">Check-in Point <span class="req">*</span></label>
<div class="session-list" id="sessionList"></div>
</div>
<div class="card">
<h2>Participant Details</h2>
<label>Full Name <span class="req">*</span></label>
<input type="text" id="attName" required placeholder="e.g. Subash Sharma">
<label>Branch / Department <span class="req">*</span></label>
<input type="text" id="attBranch" required placeholder="e.g. Kalanki Branch">
<label>Designation <span class="req">*</span></label>
<input type="text" id="attDesig" required placeholder="e.g. Branch Manager">
<label>Employee ID</label>
<input type="text" id="attEmpId" placeholder="Optional">
<label>Mobile Number <span class="req">*</span></label>
<input type="tel" id="attMobile" required placeholder="98XXXXXXXX">
</div>
<div class="card">
<h2>Signature</h2>
<div class="sig-wrap"><canvas id="sigPad"></canvas></div>
<div class="sig-row"><span class="sig-hint">Sign with finger or mouse</span><button type="button" class="clear-btn" id="clearSig">Clear</button></div>
</div>
<button type="submit" class="submit-btn" id="attSubmit">Submit Attendance</button>
<div class="msg" id="attMsg"></div>
</form>
<div class="success-screen" id="attSuccess" style="display:none">
<div class="check">&#10003;</div>
<h2>Attendance Recorded</h2>
<p id="attSuccessDetail"></p>
<button class="submit-btn" id="attAgain" style="max-width:260px;margin:16px auto 0">Mark Another Entry</button>
</div>
<div class="footer-note">IT Department - Infinity Laghubitta - Attendance recorded per session</div>
</div>

<hr class="divider">

<div class="sec" id="sec-schedule">
<div class="dh">Day 1 - July 31, 2026 <span>Leadership, Strategy &amp; Knowledge Sharing</span></div>
<div class="card" style="margin-top:8px;padding:10px;overflow-x:auto">
<table class="sch-table">
<thead><tr><th>Time</th><th>Program</th><th>Facilitator</th></tr></thead>
<tbody>
<tr class="brk"><td class="tm">7:00 - 8:00 am</td><td>Breakfast</td><td></td></tr>
<tr><td class="tm">8:00 - 8:30 am</td><td>Opening Ceremony &amp; Welcome Remarks</td><td class="fc">Management</td></tr>
<tr><td class="tm">8:30 - 9:00 am</td><td>CEO Talk: Vision, Leadership, Business Direction &amp; Expectations</td><td class="fc">CEO</td></tr>
<tr><td class="tm">9:00 - 9:45 am</td><td>Business Performance Review, Strategic Priorities &amp; Way Forward</td><td class="fc">DCEO</td></tr>
<tr><td class="tm">9:45 - 10:30 am</td><td>Knowledge Sharing Session: Credit Quality &amp; Best Practices</td><td class="fc">Credit Department</td></tr>
<tr class="brk"><td class="tm">10:30 - 10:45 am</td><td>Tea Break</td><td></td></tr>
<tr><td class="tm">10:45 - 11:05 am</td><td>Recovery Issues, NPL Management &amp; Strategic Recovery Approaches</td><td class="fc">Recovery &amp; Monitoring Dept</td></tr>
<tr><td class="tm">11:05 - 11:25 am</td><td>Audit Compliance &amp; Internal Control Updates</td><td class="fc">Internal Audit Department</td></tr>
<tr><td class="tm">11:25 - 11:45 am</td><td>Operational Risk, Process Improvement &amp; Digital Support</td><td class="fc">Finance &amp; Ops / IT Dept</td></tr>
<tr><td class="tm">11:45 - 12:05 pm</td><td>Human Resource Management, Performance Culture &amp; Employee Development</td><td class="fc">HR Department</td></tr>
<tr><td class="tm">12:05 - 1:00 pm</td><td>Interactive Questionnaire Forum (Open Discussion with CEO &amp; Management)</td><td class="fc">CEO &amp; Management Team</td></tr>
<tr class="brk"><td class="tm">1:00 - 2:00 pm</td><td>Lunch Break</td><td></td></tr>
<tr><td class="tm">2:00 - 2:45 pm</td><td>Group Discussion: Branch Challenges, Business Opportunities &amp; Solutions</td><td class="fc">All Participants</td></tr>
<tr><td class="tm">2:45 - 3:15 pm</td><td>Group Presentation &amp; Management Feedback</td><td class="fc">Group Leaders</td></tr>
<tr class="brk"><td class="tm">3:15 - 3:30 pm</td><td>Tea Break</td><td></td></tr>
<tr><td class="tm">3:30 - 4:45 pm</td><td>NPL Clinic: Practical Case Studies, Recovery Strategies &amp; Experience Sharing</td><td class="fc">Monitoring &amp; Recovery Team</td></tr>
<tr><td class="tm">4:45 - 5:30 pm</td><td>Awareness Session: Banking Offences and Punishment Act &amp; Regulatory Compliance</td><td class="fc">Legal/Compliance</td></tr>
<tr><td class="tm">5:30 - 6:00 pm</td><td>Programme Feedback</td><td class="fc">Program Coordinator</td></tr>
</tbody></table>
</div>
<div class="dh">Day 2 - August 1, 2026 <span>Performance Improvement, NPL Management &amp; Commitment</span></div>
<div class="card" style="margin-top:8px;padding:10px;overflow-x:auto">
<table class="sch-table">
<thead><tr><th>Time</th><th>Program</th><th>Facilitator</th></tr></thead>
<tbody>
<tr class="brk"><td class="tm">7:00 - 8:00 am</td><td>Breakfast</td><td></td></tr>
<tr><td class="tm">8:00 - 10:00 am</td><td>NPL Performance Review: Branches with NPL 20.01% and Above</td><td class="fc">Monitoring &amp; Recovery Team, Branch Managers</td></tr>
<tr class="brk"><td class="tm">10:00 - 10:15 am</td><td>Tea Break</td><td></td></tr>
<tr><td class="tm">10:15 - 11:30 am</td><td>NPL Performance Review: Branches with NPL 15.01% - 20.00%</td><td class="fc">Monitoring &amp; Recovery Team, Branch Managers</td></tr>
<tr><td class="tm">11:30 - 12:30 pm</td><td>NPL Performance Review: Branches with NPL 10.01% - 15.00%</td><td class="fc">Monitoring &amp; Recovery Team, Branch Managers</td></tr>
<tr class="brk"><td class="tm">12:30 - 1:30 pm</td><td>Lunch Break</td><td></td></tr>
<tr><td class="tm">1:30 - 2:30 pm</td><td>NPL Performance Review: Branches with NPL 5.01% - 10.00%</td><td class="fc">Monitoring &amp; Recovery Team, Branch Managers</td></tr>
<tr><td class="tm">2:30 - 3:30 pm</td><td>Best Practice Sharing: Green Branches with NPL 0% - 5.00%</td><td class="fc">Monitoring &amp; Recovery Team, Branch Managers</td></tr>
<tr class="brk"><td class="tm">3:15 - 3:30 pm</td><td>Tea Break</td><td></td></tr>
<tr><td class="tm">3:30 - 4:30 pm</td><td>Action Planning, Branch Commitments &amp; Target Setting</td><td class="fc">DCEO &amp; Recovery Team</td></tr>
<tr><td class="tm">4:30 - 5:15 pm</td><td>Opinion, Suggestions &amp; Open Discussion Forum</td><td class="fc">All Participants</td></tr>
<tr><td class="tm">5:15 - 5:45 pm</td><td>CEO Closing Remarks: Future Direction, Performance Expectations &amp; Motivation</td><td class="fc">CEO</td></tr>
<tr><td class="tm">5:45 - 6:30 pm</td><td>Closing Ceremony, Certificate Distribution &amp; Group Photo</td><td class="fc">All Participants</td></tr>
</tbody></table>
</div>
</div>

<hr class="divider">

<div class="sec" id="sec-feedback">
<form id="fbForm">
<div class="card">
<h2>Session Selection</h2>
<label>Day <span class="req">*</span></label>
<div class="day-toggle" id="fbDayToggle">
<button type="button" data-day="Day 1" class="active">Day 1 - Jul 31</button>
<button type="button" data-day="Day 2">Day 2 - Aug 1</button>
</div>
<label style="margin-top:14px">Select Session <span class="req">*</span></label>
<select id="fbSession" required><option value="">-- Choose a session --</option></select>
</div>
<div class="card">
<h2>Your Information</h2>
<label>Full Name <span class="req">*</span></label>
<input type="text" id="fbName" required placeholder="Your name">
<label>Branch / Department <span class="req">*</span></label>
<input type="text" id="fbBranch" required placeholder="Your branch or department">
</div>
<div class="card">
<h2>Session Rating</h2>
<label>Overall Session Rating <span class="req">*</span></label>
<div class="sr" id="starRating">
<input type="radio" name="rating" value="5" id="s5"><label for="s5">&#9733;</label>
<input type="radio" name="rating" value="4" id="s4"><label for="s4">&#9733;</label>
<input type="radio" name="rating" value="3" id="s3"><label for="s3">&#9733;</label>
<input type="radio" name="rating" value="2" id="s2"><label for="s2">&#9733;</label>
<input type="radio" name="rating" value="1" id="s1"><label for="s1">&#9733;</label>
</div>
<label>Content Quality <span class="req">*</span></label>
<div class="rg">
<label><input type="radio" name="cq" value="Excellent"> Excellent</label>
<label><input type="radio" name="cq" value="Good"> Good</label>
<label><input type="radio" name="cq" value="Average"> Average</label>
<label><input type="radio" name="cq" value="Below Average"> Below Average</label>
<label><input type="radio" name="cq" value="Poor"> Poor</label>
</div>
<label>Speaker Effectiveness <span class="req">*</span></label>
<div class="rg">
<label><input type="radio" name="se" value="Excellent"> Excellent</label>
<label><input type="radio" name="se" value="Good"> Good</label>
<label><input type="radio" name="se" value="Average"> Average</label>
<label><input type="radio" name="se" value="Below Average"> Below Average</label>
<label><input type="radio" name="se" value="Poor"> Poor</label>
</div>
</div>
<div class="card">
<h2>Your Experience</h2>
<label>Was this session relevant to your role? <span class="req">*</span></label>
<div class="rg">
<label><input type="radio" name="rel" value="Highly Relevant"> Highly Relevant</label>
<label><input type="radio" name="rel" value="Somewhat Relevant"> Somewhat Relevant</label>
<label><input type="radio" name="rel" value="Not Relevant"> Not Relevant</label>
</div>
<label>Would you recommend this session? <span class="req">*</span></label>
<div class="rg">
<label><input type="radio" name="rec" value="Highly Recommend"> Highly Recommend</label>
<label><input type="radio" name="rec" value="Recommend"> Recommend</label>
<label><input type="radio" name="rec" value="Neutral"> Neutral</label>
<label><input type="radio" name="rec" value="Do Not Recommend"> Do Not Recommend</label>
</div>
</div>
<div class="card">
<h2>Comments</h2>
<label>What did you like most about this session?</label>
<textarea id="fbComments" placeholder="Share what you valued..."></textarea>
<label>What could be improved?</label>
<textarea id="fbImprove" placeholder="Suggestions for improvement..."></textarea>
<label>Any additional suggestions?</label>
<textarea id="fbSuggest" placeholder="Other thoughts..."></textarea>
</div>
<button type="submit" class="submit-btn" id="fbSubmit">Submit Feedback</button>
<div class="msg" id="fbMsg"></div>
</form>
<div class="success-screen" id="fbSuccess" style="display:none">
<div class="check">&#10003;</div>
<h2>Feedback Submitted</h2>
<p>Thank you for your valuable feedback!</p>
<button class="submit-btn" id="fbAgain" style="max-width:260px;margin:16px auto 0">Submit Another</button>
</div>
</div>

<hr class="divider">

<div class="sec" id="sec-report">
<div class="rh">
<div><h2 style="font-size:14px;color:var(--navy);margin:0">Attendance Report</h2><p style="font-size:11px;color:#888;margin:2px 0 0">Public view with signatures</p></div>
<div style="display:flex;gap:8px"><button class="rb" id="rptRefresh">Refresh</button><button class="pb" id="rptPrint">Print</button></div>
</div>
<div class="rc">
<select id="rptDay"><option value="">All Days</option><option value="Day 1">Day 1 - Jul 31</option><option value="Day 2">Day 2 - Aug 1</option></select>
<select id="rptSession"><option value="">All Sessions</option></select>
</div>
<div class="sts">
<div class="sb"><div class="n" id="statTotal">0</div><div class="l">Total Records</div></div>
<div class="sb"><div class="n" id="statD1">0</div><div class="l">Day 1</div></div>
<div class="sb"><div class="n" id="statD2">0</div><div class="l">Day 2</div></div>
</div>
<div class="rw">
<table class="rt">
<thead><tr><th>#</th><th>Date</th><th>Day</th><th>Session</th><th>Name</th><th>Branch</th><th>Designation</th><th>Mobile</th><th>Signature</th></tr></thead>
<tbody id="rptBody"><tr><td colspan="9" style="text-align:center;padding:20px;color:#888">Loading report data...</td></tr></tbody>
</table>
</div>
</div>

<div class="mo" id="sigModal"><button class="cx" id="sigModalClose">&times;</button><img id="sigModalImg" src=""></div>

<script>
const SCRIPT_URL = "https://script.google.com/macros/s/AKfycbzjGP1uz-7AqL4Xc4R0xZoPu1iPvM-i8KP_O1hx-ZLSvQhvNP-YXyp8zNUDUxo4L_l8/exec";
const SESSIONS = {
"Day 1": ["Opening Ceremony & Welcome Remarks","CEO Talk: Vision, Leadership & Business Direction","Business Performance Review & Strategic Priorities","Knowledge Sharing: Credit Quality & Best Practices","Recovery Issues & NPL Management","Audit Compliance & Internal Control Updates","Operational Risk, Process Improvement & Digital Support","HR Management, Performance Culture & Development","Interactive Forum with CEO & Management","Group Discussion: Branch Challenges & Opportunities","Group Presentation & Management Feedback","NPL Clinic: Case Studies & Recovery Strategies","Banking Offences & Punishment Act Awareness","Programme Feedback"],
"Day 2": ["NPL Review: Branches 20.01% and above","NPL Review: Branches 15.01% - 20.00%","NPL Review: Branches 10.01% - 15.00%","NPL Review: Branches 5.01% - 10.00%","Best Practice Sharing: Green Branches (0% - 5.00%)","Action Planning & Branch Commitments","Opinion, Suggestions & Open Discussion","CEO Closing Remarks","Closing Ceremony & Certificate Distribution"]
};

var attCurrentDay = "Day 1";
var fbCurrentDay = "Day 1";
var rptData = [];

// NAV SCROLL HIGHLIGHT
var navLinks = document.querySelectorAll(".nav a");
var sections = document.querySelectorAll(".sec");
window.addEventListener("scroll", function(){
var scrollY = window.scrollY + 60;
sections.forEach(function(sec, i){
var top = sec.offsetTop;
var h = sec.offsetHeight;
if(scrollY >= top && scrollY < top + h){
navLinks.forEach(function(a){a.classList.remove("active")});
navLinks[i].classList.add("active");
}
});
});

// ATTENDANCE SESSIONS
function renderAttSessions(day){
var sl = document.getElementById("sessionList");
sl.innerHTML = "";
SESSIONS[day].forEach(function(s, i){
var w = document.createElement("label");
w.className = "opt";
w.innerHTML = '<input type="radio" name="session" value="' + s + '"' + (i===0?" required":"") + '> <span>' + s + '</span>';
sl.appendChild(w);
});
}
renderAttSessions(attCurrentDay);

document.getElementById("dayToggle").addEventListener("click", function(e){
var btn = e.target.closest("button");
if(!btn) return;
this.querySelectorAll("button").forEach(function(b){b.classList.remove("active")});
btn.classList.add("active");
attCurrentDay = btn.dataset.day;
renderAttSessions(attCurrentDay);
});

// FEEDBACK SESSIONS
function renderFbSessions(day){
var sel = document.getElementById("fbSession");
var val = sel.value;
sel.innerHTML = '<option value="">-- Choose a session --</option>';
SESSIONS[day].forEach(function(s){
var o = document.createElement("option");
o.value = s; o.textContent = s;
sel.appendChild(o);
});
if(val && SESSIONS[day].indexOf(val) >= 0) sel.value = val;
}
renderFbSessions(fbCurrentDay);

document.getElementById("fbDayToggle").addEventListener("click", function(e){
var btn = e.target.closest("button");
if(!btn) return;
this.querySelectorAll("button").forEach(function(b){b.classList.remove("active")});
btn.classList.add("active");
fbCurrentDay = btn.dataset.day;
renderFbSessions(fbCurrentDay);
});

// SIGNATURE PAD
var canvas = document.getElementById("sigPad");
var ctx = canvas.getContext("2d");
var drawing = false, hasSig = false;

function resizeCanvas(){
var ratio = window.devicePixelRatio || 1;
var rect = canvas.getBoundingClientRect();
canvas.width = rect.width * ratio;
canvas.height = 150 * ratio;
ctx.scale(ratio, ratio);
ctx.lineWidth = 2;
ctx.lineCap = "round";
ctx.strokeStyle = "#0b2545";
}
resizeCanvas();
window.addEventListener("resize", function(){
var data = hasSig ? canvas.toDataURL() : null;
resizeCanvas();
if(data){
var img = new Image();
img.onload = function(){ctx.drawImage(img,0,0,canvas.width/(window.devicePixelRatio||1),150)};
img.src = data;
}
});

function sigPos(e){
var rect = canvas.getBoundingClientRect();
var t = e.touches ? e.touches[0] : e;
return {x: t.clientX - rect.left, y: t.clientY - rect.top};
}
function sigStart(e){drawing=true;hasSig=true;var p=sigPos(e);ctx.beginPath();ctx.moveTo(p.x,p.y);e.preventDefault();}
function sigMove(e){if(!drawing)return;var p=sigPos(e);ctx.lineTo(p.x,p.y);ctx.stroke();e.preventDefault();}
function sigEnd(){drawing=false;}

canvas.addEventListener("mousedown", sigStart);
canvas.addEventListener("mousemove", sigMove);
window.addEventListener("mouseup", sigEnd);
canvas.addEventListener("touchstart", sigStart, {passive:false});
canvas.addEventListener("touchmove", sigMove, {passive:false});
canvas.addEventListener("touchend", sigEnd);

document.getElementById("clearSig").addEventListener("click", function(){
ctx.clearRect(0,0,canvas.width,canvas.height);
hasSig = false;
});

// HELPER
function showMsg(id, text, type){
var m = document.getElementById(id);
m.textContent = text;
m.className = "msg show " + type;
}

// ATTENDANCE SUBMIT
document.getElementById("attForm").addEventListener("submit", function(e){
e.preventDefault();
var session = this.querySelector('input[name="session"]:checked');
if(!session){showMsg("attMsg","Please select a session.","err");return;}
if(!hasSig){showMsg("attMsg","Please provide your signature.","err");return;}

var payload = {
type:"attendance", day:attCurrentDay, session:session.value,
fullName:document.getElementById("attName").value.trim(),
branch:document.getElementById("attBranch").value.trim(),
designation:document.getElementById("attDesig").value.trim(),
empId:document.getElementById("attEmpId").value.trim(),
mobile:document.getElementById("attMobile").value.trim(),
signature:canvas.toDataURL("image/png"),
timestamp:new Date().toISOString()
};

var btn = document.getElementById("attSubmit");
btn.disabled = true; btn.textContent = "Submitting...";

fetch(SCRIPT_URL, {method:"POST", mode:"no-cors", headers:{"Content-Type":"text/plain"}, body:JSON.stringify(payload)})
.then(function(){
document.getElementById("attSuccessDetail").textContent = payload.fullName + " - " + payload.day + ", " + payload.session;
document.getElementById("attForm").style.display = "none";
document.getElementById("attSuccess").style.display = "block";
}).catch(function(){
showMsg("attMsg","Network error. Please try again.","err");
}).finally(function(){
btn.disabled = false; btn.textContent = "Submit Attendance";
});
});

document.getElementById("attAgain").addEventListener("click", function(){
document.getElementById("attForm").reset();
ctx.clearRect(0,0,canvas.width,canvas.height);
hasSig = false;
document.getElementById("attSuccess").style.display = "none";
document.getElementById("attForm").style.display = "block";
document.getElementById("attMsg").className = "msg";
});

// FEEDBACK SUBMIT
document.getElementById("fbForm").addEventListener("submit", function(e){
e.preventDefault();
var session = document.getElementById("fbSession").value;
var rating = document.querySelector('input[name="rating"]:checked');
var cq = document.querySelector('input[name="cq"]:checked');
var se = document.querySelector('input[name="se"]:checked');
var rel = document.querySelector('input[name="rel"]:checked');
var rec = document.querySelector('input[name="rec"]:checked');

if(!session){showMsg("fbMsg","Please select a session.","err");return;}
if(!rating){showMsg("fbMsg","Please provide a star rating.","err");return;}
if(!cq){showMsg("fbMsg","Please rate content quality.","err");return;}
if(!se){showMsg("fbMsg","Please rate speaker effectiveness.","err");return;}
if(!rel){showMsg("fbMsg","Please answer relevance question.","err");return;}
if(!rec){showMsg("fbMsg","Please answer recommendation question.","err");return;}

var payload = {
type:"feedback", day:fbCurrentDay, session:session,
name:document.getElementById("fbName").value.trim(),
branch:document.getElementById("fbBranch").value.trim(),
rating:rating.value, contentQuality:cq.value, speakerEffectiveness:se.value,
relevantToRole:rel.value, wouldRecommend:rec.value,
comments:document.getElementById("fbComments").value.trim(),
improvements:document.getElementById("fbImprove").value.trim(),
suggestions:document.getElementById("fbSuggest").value.trim(),
timestamp:new Date().toISOString()
};

var btn = document.getElementById("fbSubmit");
btn.disabled = true; btn.textContent = "Submitting...";

fetch(SCRIPT_URL, {method:"POST", mode:"no-cors", headers:{"Content-Type":"text/plain"}, body:JSON.stringify(payload)})
.then(function(){
document.getElementById("fbForm").style.display = "none";
document.getElementById("fbSuccess").style.display = "block";
}).catch(function(){
showMsg("fbMsg","Network error. Please try again.","err");
}).finally(function(){
btn.disabled = false; btn.textContent = "Submit Feedback";
});
});

document.getElementById("fbAgain").addEventListener("click", function(){
document.getElementById("fbForm").reset();
document.getElementById("fbSuccess").style.display = "none";
document.getElementById("fbForm").style.display = "block";
document.getElementById("fbMsg").className = "msg";
renderFbSessions(fbCurrentDay);
});

// REPORT
function loadReport(){
document.getElementById("rptBody").innerHTML = '<tr><td colspan="9" style="text-align:center;padding:20px;color:#888">Loading...</td></tr>';

fetch(SCRIPT_URL + "?action=report")
.then(function(r){return r.json();})
.then(function(data){
rptData = data || [];
updateReportStats();
populateSessionFilter();
renderReportTable();
}).catch(function(){
document.getElementById("rptBody").innerHTML = '<tr><td colspan="9" style="text-align:center;padding:20px;color:#b3261e">Failed to load data.</td></tr>';
});
}

function getFilteredData(){
var day = document.getElementById("rptDay").value;
var sess = document.getElementById("rptSession").value;
return rptData.filter(function(r){
if(day && r["Day"] !== day) return false;
if(sess && r["Session"] !== sess) return false;
return true;
});
}

function updateReportStats(){
var filtered = getFilteredData();
document.getElementById("statTotal").textContent = filtered.length;
document.getElementById("statD1").textContent = rptData.filter(function(r){return r["Day"]==="Day 1"}).length;
document.getElementById("statD2").textContent = rptData.filter(function(r){return r["Day"]==="Day 2"}).length;
}

function populateSessionFilter(){
var sel = document.getElementById("rptSession");
var cur = sel.value;
var sessions = {};
rptData.forEach(function(r){if(r["Session"]) sessions[r["Session"]]=true;});
sel.innerHTML = '<option value="">All Sessions</option>';
Object.keys(sessions).sort().forEach(function(s){
var o = document.createElement("option");
o.value = s; o.textContent = s;
sel.appendChild(o);
});
if(cur) sel.value = cur;
}

function renderReportTable(){
var data = getFilteredData();
var body = document.getElementById("rptBody");
if(!data.length){
body.innerHTML = '<tr><td colspan="9" style="text-align:center;padding:20px;color:#888">No records found.</td></tr>';
return;
}
body.innerHTML = "";
data.forEach(function(r, i){
var tr = document.createElement("tr");
var dateStr = r["Timestamp"] ? new Date(r["Timestamp"]).toLocaleDateString() : "";
var sigSrc = r["Signature"] || "";
var sigHtml = sigSrc ? '<img class="st" src="' + sigSrc + '" onclick="showSig(this.src)" alt="sig">' : "-";
tr.innerHTML = '<td>' + (i+1) + '</td><td>' + dateStr + '</td><td>' + (r["Day"]||"") + '</td><td>' + (r["Session"]||"") + '</td><td>' + (r["Full Name"]||"") + '</td><td>' + (r["Branch/Department"]||"") + '</td><td>' + (r["Designation"]||"") + '</td><td>' + (r["Mobile"]||"") + '</td><td>' + sigHtml + '</td>';
body.appendChild(tr);
});
}

document.getElementById("rptDay").addEventListener("change", function(){
updateReportStats();
populateSessionFilter();
renderReportTable();
});
document.getElementById("rptSession").addEventListener("change", function(){
updateReportStats();
renderReportTable();
});
document.getElementById("rptRefresh").addEventListener("click", loadReport);
document.getElementById("rptPrint").addEventListener("click", function(){window.print();});

// SIGNATURE MODAL
function showSig(src){
document.getElementById("sigModalImg").src = src;
document.getElementById("sigModal").classList.add("show");
}
document.getElementById("sigModalClose").addEventListener("click", function(){
document.getElementById("sigModal").classList.remove("show");
});
document.getElementById("sigModal").addEventListener("click", function(e){
if(e.target === this) this.classList.remove("show");
});

// AUTO-LOAD REPORT ON SCROLL
var reportLoaded = false;
var reportObserver = new IntersectionObserver(function(entries){
entries.forEach(function(entry){
if(entry.isIntersecting && !reportLoaded){
reportLoaded = true;
loadReport();
}
});
},{threshold:0.1});
reportObserver.observe(document.getElementById("sec-report"));
</script>
</body>
</html>
"@
Set-Content -Path "C:\Users\Lenovo\Documents\Default Project\ilbsl-attendance\index.html" -Value $html -Encoding UTF8 -NoNewline
