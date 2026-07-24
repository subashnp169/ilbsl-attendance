$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ILBSL Leadership Meeting Portal</title>
<style>
:root{--navy:#0b2545;--navy-2:#123a6b;--gold:#c8952b;--gold-light:#f0e6d0;--paper:#f7f5f0;--ink:#1c2530;--line:#d7d2c4;--ok:#1e7a3d;--err:#b3261e;--white:#fff;--shadow:0 4px 24px rgba(11,37,69,.08);--shadow-lg:0 12px 40px rgba(11,37,69,.12)}
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Arial,sans-serif;background:var(--paper);color:var(--ink);scroll-behavior:smooth}

/* HOME PAGE */
.home{min-height:100vh;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:20px}
.home.hidden{display:none}
.hero{text-align:center;margin-bottom:32px}
.hero .logo{width:72px;height:72px;border-radius:50%;background:linear-gradient(135deg,var(--navy),var(--navy-2));display:flex;align-items:center;justify-content:center;margin:0 auto 16px;font-size:28px;color:var(--gold);font-weight:700;box-shadow:0 4px 20px rgba(11,37,69,.2)}
.hero h1{font-size:22px;color:var(--navy);margin:0 0 4px;font-weight:800}
.hero p{font-size:13px;color:#777;margin:0}
.hero .badge{display:inline-block;background:var(--gold);color:#fff;font-size:10px;font-weight:700;padding:4px 12px;border-radius:20px;margin-top:10px;letter-spacing:.05em}
.portal-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px;max-width:520px;width:100%}
.portal-card{background:var(--white);border:1px solid var(--line);border-radius:16px;padding:28px 20px;text-align:center;cursor:pointer;transition:all .25s ease;text-decoration:none;color:var(--ink);position:relative;overflow:hidden}
.portal-card::before{content:"";position:absolute;top:0;left:0;right:0;height:4px;transition:height .25s}
.portal-card:hover{transform:translateY(-4px);box-shadow:var(--shadow-lg);border-color:transparent}
.portal-card:hover::before{height:4px}
.portal-card .icon{width:56px;height:56px;border-radius:14px;display:flex;align-items:center;justify-content:center;margin:0 auto 14px;font-size:24px;transition:transform .25s}
.portal-card:hover .icon{transform:scale(1.08)}
.portal-card h3{font-size:14px;font-weight:700;margin:0 0 6px;color:var(--navy)}
.portal-card p{font-size:11px;color:#888;line-height:1.4;margin:0}
.portal-card .arrow{display:block;margin-top:12px;font-size:18px;color:var(--gold);transition:transform .25s}
.portal-card:hover .arrow{transform:translateX(4px)}

.pc-att .icon{background:#e8f4ec;color:var(--ok)}.pc-att::before{background:var(--ok)}
.pc-sch .icon{background:#e8eef6;color:var(--navy-2)}.pc-sch::before{background:var(--navy-2)}
.pc-fb .icon{background:var(--gold-light);color:var(--gold)}.pc-fb::before{background:var(--gold)}
.pc-rpt .icon{background:#f0e8f6;color:#7b3fa0}.pc-rpt::before{background:#7b3fa0}

.home-footer{text-align:center;margin-top:28px;font-size:10px;color:#aaa}

/* PORTAL PAGES */
.portal{display:none;min-height:100vh}
.portal.active{display:block}

.topbar{background:linear-gradient(135deg,var(--navy),var(--navy-2));color:#fff;padding:16px 20px 20px;text-align:center;position:relative}
.topbar .back{position:absolute;left:16px;top:50%;transform:translateY(-50%);background:rgba(255,255,255,.12);border:none;color:#fff;width:34px;height:34px;border-radius:50%;cursor:pointer;font-size:16px;display:flex;align-items:center;justify-content:center}
.topbar .eyebrow{letter-spacing:.14em;text-transform:uppercase;font-size:10px;color:var(--gold);font-weight:600}
.topbar h1{margin:4px 0 2px;font-size:17px;font-weight:700}
.topbar p{margin:0;font-size:12px;opacity:.8}
.topbar .section-icon{width:40px;height:40px;border-radius:10px;margin:10px auto 0;display:flex;align-items:center;justify-content:center;font-size:18px}

.nav{position:sticky;top:0;z-index:100;background:var(--navy);display:flex;overflow-x:auto;box-shadow:0 2px 8px rgba(0,0,0,.15)}
.nav a{flex:1;min-width:0;padding:11px 8px;color:rgba(255,255,255,.5);text-decoration:none;font-size:12px;font-weight:600;text-align:center;white-space:nowrap;border-bottom:3px solid transparent;transition:.2s}
.nav a:hover,.nav a.active{color:#fff;border-bottom-color:var(--gold);background:rgba(255,255,255,.07)}
.nav .home-link{flex:0 0 auto;padding:11px 16px;color:var(--gold);font-weight:700}
.nav .home-link:hover{background:rgba(200,149,43,.1)}

.sec{max-width:700px;margin:0 auto;padding:20px 16px;scroll-margin-top:48px}

/* IMPROVED CARDS */
.card{background:var(--white);border:1px solid var(--line);border-radius:14px;padding:22px;margin-top:16px;box-shadow:0 2px 12px rgba(11,37,69,.04);transition:box-shadow .2s}
.card:hover{box-shadow:var(--shadow)}
.card h2{font-size:11px;text-transform:uppercase;letter-spacing:.1em;color:var(--navy-2);margin:0 0 14px;padding-bottom:8px;border-bottom:2px solid var(--gold);display:flex;align-items:center;gap:8px}
.card h2 .hicon{width:22px;height:22px;border-radius:6px;display:flex;align-items:center;justify-content:center;font-size:11px;flex-shrink:0}

label{display:block;font-size:12px;font-weight:600;margin:14px 0 5px;color:var(--navy)}
label .req{color:var(--err)}
input[type=text],input[type=tel],select,textarea{width:100%;padding:11px 14px;border:1.5px solid var(--line);border-radius:10px;font-size:14px;background:var(--white);color:var(--ink);font-family:inherit;transition:border-color .2s,box-shadow .2s}
input:focus,select:focus,textarea:focus{outline:none;border-color:var(--navy-2);box-shadow:0 0 0 3px rgba(18,58,107,.08)}
textarea{resize:vertical;min-height:72px}

.day-toggle{display:flex;gap:8px;margin-top:5px}
.day-toggle button{flex:1;padding:10px 6px;border:1.5px solid var(--line);background:var(--white);border-radius:10px;font-size:12px;font-weight:600;color:var(--navy);cursor:pointer;transition:.2s}
.day-toggle button.active{background:var(--navy);color:#fff;border-color:var(--navy);box-shadow:0 2px 8px rgba(11,37,69,.15)}

.session-list{display:flex;flex-direction:column;gap:6px;margin-top:6px}
.session-list label.opt{display:flex;align-items:flex-start;gap:10px;font-weight:400;font-size:13px;margin:0;padding:11px 14px;border:1.5px solid var(--line);border-radius:10px;cursor:pointer;transition:.2s}
.session-list label.opt:hover{border-color:var(--navy-2);background:#fafbfc}
.session-list label.opt:has(input:checked){border-color:var(--navy);background:#f0f4f8;box-shadow:0 0 0 2px rgba(11,37,69,.06)}
.session-list input[type=radio]{margin-top:3px;accent-color:var(--navy)}

.sig-wrap{border:1.5px dashed var(--line);border-radius:10px;margin-top:8px;background:#fafaf8;touch-action:none}
canvas#sigPad{width:100%;height:150px;display:block;cursor:crosshair;touch-action:none}
.sig-row{display:flex;justify-content:space-between;align-items:center;margin-top:6px;padding:0 4px}
.sig-hint{font-size:10px;color:#999}
.clear-btn{background:none;border:none;color:var(--navy-2);font-size:11px;font-weight:600;text-decoration:underline;cursor:pointer}

.submit-btn{width:100%;background:linear-gradient(135deg,var(--navy),var(--navy-2));color:#fff;border:none;padding:14px;border-radius:10px;font-size:14px;font-weight:700;cursor:pointer;margin-top:20px;transition:all .2s;box-shadow:0 2px 12px rgba(11,37,69,.15)}
.submit-btn:hover{transform:translateY(-1px);box-shadow:0 4px 16px rgba(11,37,69,.2)}
.submit-btn:active{transform:translateY(0)}
.submit-btn:disabled{opacity:.5;cursor:not-allowed;transform:none}

.msg{margin-top:12px;padding:11px 14px;border-radius:10px;font-size:12px;display:none}
.msg.show{display:block}
.msg.ok{background:#eaf6ee;color:var(--ok);border:1px solid #bfe3c9}
.msg.err{background:#fbeceb;color:var(--err);border:1px solid #f2c6c3}

.footer-note{text-align:center;font-size:10px;color:#bbb;margin-top:24px;padding-bottom:24px}
.success-screen{text-align:center;padding:40px 16px}
.success-screen .check{width:56px;height:56px;border-radius:50%;background:linear-gradient(135deg,var(--ok),#28a745);color:#fff;display:flex;align-items:center;justify-content:center;margin:0 auto 16px;font-size:26px;box-shadow:0 4px 16px rgba(30,122,61,.2)}
.success-screen h2{color:var(--navy);font-size:18px}
.success-screen p{color:#666;font-size:13px;margin-top:6px}

/* SCHEDULE */
.sch-table{width:100%;border-collapse:separate;border-spacing:0;font-size:13px;margin-top:8px}
.sch-table th{background:var(--navy);color:#fff;padding:10px 14px;text-align:left;font-size:10px;text-transform:uppercase;letter-spacing:.06em}
.sch-table th:first-child{border-radius:8px 0 0 0}
.sch-table th:last-child{border-radius:0 8px 0 0}
.sch-table td{padding:10px 14px;border-bottom:1px solid #eee;vertical-align:top}
.sch-table tr:last-child td{border-bottom:none}
.sch-table tr:hover td{background:#f8f7f4}
.sch-table .tm{white-space:nowrap;font-weight:600;color:var(--navy-2);font-size:12px;width:120px}
.sch-table .fc{color:#888;font-size:11px;font-style:italic}
.dh{background:linear-gradient(135deg,var(--navy),var(--navy-2));color:#fff;padding:12px 16px;border-radius:10px;font-size:13px;font-weight:700;margin:20px 0 0;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:4px;box-shadow:0 2px 12px rgba(11,37,69,.12)}
.dh span{font-size:11px;font-weight:400;opacity:.75}
.brk td{background:#faf6ee !important;font-style:italic;color:#999}

/* FEEDBACK */
.sr{display:flex;gap:4px;margin-top:6px;direction:rtl;unicode-bidi:bidi-override}
.sr input{display:none}
.sr label{font-size:30px;color:var(--line);cursor:pointer;margin:0;transition:color .15s}
.sr label:hover,.sr label:hover~label,.sr input:checked~label{color:var(--gold)}
.rg{display:flex;flex-wrap:wrap;gap:8px;margin-top:6px}
.rg label{display:flex;align-items:center;gap:6px;font-weight:400;font-size:13px;padding:8px 14px;border:1.5px solid var(--line);border-radius:20px;cursor:pointer;margin:0;transition:.2s}
.rg label:hover{border-color:var(--navy-2);background:#f8f9fa}
.rg label:has(input:checked){border-color:var(--navy);background:#f0f4f8;font-weight:600;box-shadow:0 0 0 2px rgba(11,37,69,.06)}
.rg input{margin:0;accent-color:var(--navy)}

/* REPORT */
.rh{display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:8px;margin-bottom:8px}
.rc{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:14px}
.rc select{flex:1;min-width:140px;padding:10px 14px;border:1.5px solid var(--line);border-radius:10px;font-size:13px}
.sts{display:flex;gap:12px;margin-bottom:16px;flex-wrap:wrap}
.sb{flex:1;min-width:100px;background:linear-gradient(135deg,var(--navy),var(--navy-2));color:#fff;border-radius:12px;padding:16px;text-align:center;box-shadow:0 2px 12px rgba(11,37,69,.1)}
.sb .n{font-size:24px;font-weight:800;color:var(--gold)}
.sb .l{font-size:10px;opacity:.75;margin-top:3px}
.rw{overflow-x:auto;border-radius:10px;border:1px solid var(--line)}
.rt{width:100%;border-collapse:collapse;font-size:11px}
.rt th{background:var(--navy);color:#fff;padding:8px 10px;text-align:left;font-size:10px;text-transform:uppercase;white-space:nowrap}
.rt td{padding:7px 10px;border-bottom:1px solid #f0f0f0;vertical-align:middle}
.rt tr:last-child td{border-bottom:none}
.rt tr:nth-child(even) td{background:#fafaf8}
.rt tr:hover td{background:#f0f4f8}
.st{width:70px;height:35px;object-fit:contain;border:1px solid var(--line);border-radius:6px;background:#fff;cursor:pointer;transition:transform .2s}
.st:hover{transform:scale(1.05)}
.pb{background:linear-gradient(135deg,var(--gold),#d4a437);color:#fff;border:none;padding:10px 18px;border-radius:8px;font-size:12px;font-weight:700;cursor:pointer;transition:all .2s;box-shadow:0 2px 8px rgba(200,149,43,.2)}
.pb:hover{transform:translateY(-1px);box-shadow:0 4px 12px rgba(200,149,43,.3)}
.rb{background:var(--navy-2);color:#fff;border:none;padding:10px 18px;border-radius:8px;font-size:12px;font-weight:700;cursor:pointer;transition:all .2s}
.rb:hover{opacity:.9}

.mo{display:none;position:fixed;inset:0;background:rgba(0,0,0,.7);z-index:200;align-items:center;justify-content:center}
.mo.show{display:flex}
.mo img{max-width:90%;max-height:80vh;border-radius:12px;background:#fff;padding:10px;box-shadow:0 20px 60px rgba(0,0,0,.3)}
.mo .cx{position:absolute;top:20px;right:24px;color:#fff;font-size:32px;cursor:pointer;background:rgba(255,255,255,.15);border:none;width:40px;height:40px;border-radius:50%;display:flex;align-items:center;justify-content:center}

.divider{max-width:700px;margin:36px auto;border:none;border-top:2px solid var(--gold);opacity:.3}

@media print{.no-print,.topbar,.nav,.rc .pb,.rc .rb,.home{display:none !important}body{background:#fff}.portal{display:block !important}.sec{padding:0;max-width:100%}.card{border:none;padding:8px;box-shadow:none}.rt{font-size:9px}.rt th{background:#333 !important;-webkit-print-color-adjust:exact;print-color-adjust:exact}.st{width:60px;height:30px}.sb,.dh{-webkit-print-color-adjust:exact;print-color-adjust:exact}@page{margin:.5cm;size:landscape}}

@media(max-width:480px){
  .portal-grid{grid-template-columns:1fr;max-width:320px}
  .hero h1{font-size:18px}
}
</style>
</head>
<body>

<!-- ==================== HOME PAGE ==================== -->
<div class="home" id="homePage">
  <div class="hero">
    <div class="logo">IL</div>
    <h1>Leadership, Strategy &amp; Review Meeting</h1>
    <p>Infinity Laghubitta Bittiya Sanstha Ltd.</p>
    <div class="badge">July 31 - August 1, 2026</div>
  </div>
  <div class="portal-grid">
    <div class="portal-card pc-att" onclick="openPortal('attendance')">
      <div class="icon">&#9745;</div>
      <h3>Attendance</h3>
      <p>Mark your attendance for each session with digital signature</p>
      <span class="arrow">&rarr;</span>
    </div>
    <div class="portal-card pc-sch" onclick="openPortal('schedule')">
      <div class="icon">&#128197;</div>
      <h3>Schedule</h3>
      <p>View the full 2-day program agenda with time slots</p>
      <span class="arrow">&rarr;</span>
    </div>
    <div class="portal-card pc-fb" onclick="openPortal('feedback')">
      <div class="icon">&#11088;</div>
      <h3>Feedback</h3>
      <p>Rate sessions and share your valuable feedback</p>
      <span class="arrow">&rarr;</span>
    </div>
    <div class="portal-card pc-rpt" onclick="openPortal('report')">
      <div class="icon">&#128202;</div>
      <h3>Report</h3>
      <p>View attendance report with signatures and print</p>
      <span class="arrow">&rarr;</span>
    </div>
  </div>
  <div class="home-footer">IT Department &middot; Infinity Laghubitta Bittiya Sanstha Ltd.</div>
</div>

<!-- ==================== ATTENDANCE PORTAL ==================== -->
<div class="portal" id="portal-attendance">
  <div class="topbar">
    <button class="back" onclick="goHome()">&larr;</button>
    <div class="eyebrow">Infinity Laghubitta Bittiya Sanstha Ltd.</div>
    <h1>Attendance</h1>
    <p>Mark your check-in for each session</p>
  </div>
  <div class="sec">
    <form id="attForm">
      <div class="card">
        <h2><span class="hicon" style="background:#e8f4ec;color:var(--ok)">&#128197;</span> Session</h2>
        <label>Day <span class="req">*</span></label>
        <div class="day-toggle" id="dayToggle">
          <button type="button" data-day="Day 1" class="active">Day 1 - Jul 31</button>
          <button type="button" data-day="Day 2">Day 2 - Aug 1</button>
        </div>
        <label style="margin-top:16px">Check-in Point <span class="req">*</span></label>
        <div class="session-list" id="sessionList"></div>
      </div>
      <div class="card">
        <h2><span class="hicon" style="background:#e8eef6;color:var(--navy-2)">&#128100;</span> Participant Details</h2>
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
        <h2><span class="hicon" style="background:var(--gold-light);color:var(--gold)">&#9998;</span> Signature</h2>
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
</div>

<!-- ==================== SCHEDULE PORTAL ==================== -->
<div class="portal" id="portal-schedule">
  <div class="topbar">
    <button class="back" onclick="goHome()">&larr;</button>
    <div class="eyebrow">Infinity Laghubitta Bittiya Sanstha Ltd.</div>
    <h1>Schedule</h1>
    <p>Full 2-day program agenda</p>
  </div>
  <div class="sec">
    <div class="dh">Day 1 - July 31, 2026 <span>Leadership, Strategy &amp; Knowledge Sharing</span></div>
    <div class="card" style="margin-top:10px;padding:12px;overflow-x:auto">
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
    <div class="card" style="margin-top:10px;padding:12px;overflow-x:auto">
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
    <div class="footer-note">IT Department - Infinity Laghubitta</div>
  </div>
</div>

<!-- ==================== FEEDBACK PORTAL ==================== -->
<div class="portal" id="portal-feedback">
  <div class="topbar">
    <button class="back" onclick="goHome()">&larr;</button>
    <div class="eyebrow">Infinity Laghubitta Bittiya Sanstha Ltd.</div>
    <h1>Feedback</h1>
    <p>Rate sessions and share your experience</p>
  </div>
  <div class="sec">
    <form id="fbForm">
      <div class="card">
        <h2><span class="hicon" style="background:#e8eef6;color:var(--navy-2)">&#128197;</span> Session Selection</h2>
        <label>Day <span class="req">*</span></label>
        <div class="day-toggle" id="fbDayToggle">
          <button type="button" data-day="Day 1" class="active">Day 1 - Jul 31</button>
          <button type="button" data-day="Day 2">Day 2 - Aug 1</button>
        </div>
        <label style="margin-top:16px">Select Session <span class="req">*</span></label>
        <select id="fbSession" required><option value="">-- Choose a session --</option></select>
      </div>
      <div class="card">
        <h2><span class="hicon" style="background:#e8f4ec;color:var(--ok)">&#128100;</span> Your Information</h2>
        <label>Full Name <span class="req">*</span></label>
        <input type="text" id="fbName" required placeholder="Your name">
        <label>Branch / Department <span class="req">*</span></label>
        <input type="text" id="fbBranch" required placeholder="Your branch or department">
      </div>
      <div class="card">
        <h2><span class="hicon" style="background:var(--gold-light);color:var(--gold)">&#11088;</span> Session Rating</h2>
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
        <h2><span class="hicon" style="background:#f0e8f6;color:#7b3fa0">&#128172;</span> Your Experience</h2>
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
        <h2><span class="hicon" style="background:#e8eef6;color:var(--navy-2)">&#9998;</span> Comments</h2>
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
    <div class="footer-note">IT Department - Infinity Laghubitta</div>
  </div>
</div>

<!-- ==================== REPORT PORTAL ==================== -->
<div class="portal" id="portal-report">
  <div class="topbar">
    <button class="back" onclick="goHome()">&larr;</button>
    <div class="eyebrow">Infinity Laghubitta Bittiya Sanstha Ltd.</div>
    <h1>Report</h1>
    <p>Attendance report with signatures</p>
  </div>
  <div class="sec">
    <div class="rh">
      <div style="font-size:14px;font-weight:700;color:var(--navy)">Attendance Records</div>
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
        <tbody id="rptBody"><tr><td colspan="9" style="text-align:center;padding:24px;color:#aaa">Click Refresh to load data</td></tr></tbody>
      </table>
    </div>
    <div class="footer-note">IT Department - Infinity Laghubitta</div>
  </div>
</div>

<div class="mo" id="sigModal"><button class="cx" id="sigModalClose">&times;</button><img id="sigModalImg" src=""></div>

<script>
var SCRIPT_URL = "https://script.google.com/macros/s/AKfycbzjGP1uz-7AqL4Xc4R0xZoPu1iPvM-i8KP_O1hx-ZLSvQhvNP-YXyp8zNUDUxo4L_l8/exec";
var SESSIONS = {
  "Day 1": ["Opening Ceremony & Welcome Remarks","CEO Talk: Vision, Leadership & Business Direction","Business Performance Review & Strategic Priorities","Knowledge Sharing: Credit Quality & Best Practices","Recovery Issues & NPL Management","Audit Compliance & Internal Control Updates","Operational Risk, Process Improvement & Digital Support","HR Management, Performance Culture & Development","Interactive Forum with CEO & Management","Group Discussion: Branch Challenges & Opportunities","Group Presentation & Management Feedback","NPL Clinic: Case Studies & Recovery Strategies","Banking Offences & Punishment Act Awareness","Programme Feedback"],
  "Day 2": ["NPL Review: Branches 20.01% and above","NPL Review: Branches 15.01% - 20.00%","NPL Review: Branches 10.01% - 15.00%","NPL Review: Branches 5.01% - 10.00%","Best Practice Sharing: Green Branches (0% - 5.00%)","Action Planning & Branch Commitments","Opinion, Suggestions & Open Discussion","CEO Closing Remarks","Closing Ceremony & Certificate Distribution"]
};

var attCurrentDay = "Day 1";
var fbCurrentDay = "Day 1";
var rptData = [];
var reportLoaded = false;

// HOME / PORTAL NAVIGATION
function openPortal(name){
  document.getElementById("homePage").classList.add("hidden");
  document.querySelectorAll(".portal").forEach(function(p){p.classList.remove("active")});
  document.getElementById("portal-"+name).classList.add("active");
  window.scrollTo(0,0);
  if(name === "report" && !reportLoaded){reportLoaded = true; loadReport();}
}
function goHome(){
  document.querySelectorAll(".portal").forEach(function(p){p.classList.remove("active")});
  document.getElementById("homePage").classList.remove("hidden");
  window.scrollTo(0,0);
}

// ATTENDANCE SESSIONS
function renderAttSessions(day){
  var sl = document.getElementById("sessionList");
  sl.innerHTML = "";
  SESSIONS[day].forEach(function(s,i){
    var w = document.createElement("label");
    w.className = "opt";
    w.innerHTML = '<input type="radio" name="session" value="'+s+'"'+(i===0?" required":"")+'> <span>'+s+'</span>';
    sl.appendChild(w);
  });
}
renderAttSessions(attCurrentDay);

document.getElementById("dayToggle").addEventListener("click",function(e){
  var btn = e.target.closest("button");
  if(!btn)return;
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
  if(val && SESSIONS[day].indexOf(val)>=0) sel.value = val;
}
renderFbSessions(fbCurrentDay);

document.getElementById("fbDayToggle").addEventListener("click",function(e){
  var btn = e.target.closest("button");
  if(!btn)return;
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
  var ratio = window.devicePixelRatio||1;
  var rect = canvas.getBoundingClientRect();
  canvas.width = rect.width*ratio;
  canvas.height = 150*ratio;
  ctx.scale(ratio,ratio);
  ctx.lineWidth = 2;
  ctx.lineCap = "round";
  ctx.strokeStyle = "#0b2545";
}
resizeCanvas();
window.addEventListener("resize",function(){
  var data = hasSig?canvas.toDataURL():null;
  resizeCanvas();
  if(data){
    var img = new Image();
    img.onload=function(){ctx.drawImage(img,0,0,canvas.width/(window.devicePixelRatio||1),150)};
    img.src=data;
  }
});

function sigPos(e){
  var rect=canvas.getBoundingClientRect();
  var t=e.touches?e.touches[0]:e;
  return{x:t.clientX-rect.left,y:t.clientY-rect.top};
}
function sigStart(e){drawing=true;hasSig=true;var p=sigPos(e);ctx.beginPath();ctx.moveTo(p.x,p.y);e.preventDefault();}
function sigMove(e){if(!drawing)return;var p=sigPos(e);ctx.lineTo(p.x,p.y);ctx.stroke();e.preventDefault();}
function sigEnd(){drawing=false;}

canvas.addEventListener("mousedown",sigStart);
canvas.addEventListener("mousemove",sigMove);
window.addEventListener("mouseup",sigEnd);
canvas.addEventListener("touchstart",sigStart,{passive:false});
canvas.addEventListener("touchmove",sigMove,{passive:false});
canvas.addEventListener("touchend",sigEnd);

document.getElementById("clearSig").addEventListener("click",function(){
  ctx.clearRect(0,0,canvas.width,canvas.height);
  hasSig = false;
});

// HELPER
function showMsg(id,text,type){
  var m=document.getElementById(id);
  m.textContent=text;
  m.className="msg show "+type;
}

// ATTENDANCE SUBMIT
document.getElementById("attForm").addEventListener("submit",function(e){
  e.preventDefault();
  var session=this.querySelector('input[name="session"]:checked');
  if(!session){showMsg("attMsg","Please select a session.","err");return;}
  if(!hasSig){showMsg("attMsg","Please provide your signature.","err");return;}

  var payload={
    type:"attendance",day:attCurrentDay,session:session.value,
    fullName:document.getElementById("attName").value.trim(),
    branch:document.getElementById("attBranch").value.trim(),
    designation:document.getElementById("attDesig").value.trim(),
    empId:document.getElementById("attEmpId").value.trim(),
    mobile:document.getElementById("attMobile").value.trim(),
    signature:canvas.toDataURL("image/png"),
    timestamp:new Date().toISOString()
  };

  var btn=document.getElementById("attSubmit");
  btn.disabled=true;btn.textContent="Submitting...";

  fetch(SCRIPT_URL,{method:"POST",mode:"no-cors",headers:{"Content-Type":"text/plain"},body:JSON.stringify(payload)})
  .then(function(){
    document.getElementById("attSuccessDetail").textContent=payload.fullName+" - "+payload.day+", "+payload.session;
    document.getElementById("attForm").style.display="none";
    document.getElementById("attSuccess").style.display="block";
  }).catch(function(){
    showMsg("attMsg","Network error. Please try again.","err");
  }).finally(function(){
    btn.disabled=false;btn.textContent="Submit Attendance";
  });
});

document.getElementById("attAgain").addEventListener("click",function(){
  document.getElementById("attForm").reset();
  ctx.clearRect(0,0,canvas.width,canvas.height);
  hasSig=false;
  document.getElementById("attSuccess").style.display="none";
  document.getElementById("attForm").style.display="block";
  document.getElementById("attMsg").className="msg";
});

// FEEDBACK SUBMIT
document.getElementById("fbForm").addEventListener("submit",function(e){
  e.preventDefault();
  var session=document.getElementById("fbSession").value;
  var rating=document.querySelector('input[name="rating"]:checked');
  var cq=document.querySelector('input[name="cq"]:checked');
  var se=document.querySelector('input[name="se"]:checked');
  var rel=document.querySelector('input[name="rel"]:checked');
  var rec=document.querySelector('input[name="rec"]:checked');

  if(!session){showMsg("fbMsg","Please select a session.","err");return;}
  if(!rating){showMsg("fbMsg","Please provide a star rating.","err");return;}
  if(!cq){showMsg("fbMsg","Please rate content quality.","err");return;}
  if(!se){showMsg("fbMsg","Please rate speaker effectiveness.","err");return;}
  if(!rel){showMsg("fbMsg","Please answer relevance question.","err");return;}
  if(!rec){showMsg("fbMsg","Please answer recommendation question.","err");return;}

  var payload={
    type:"feedback",day:fbCurrentDay,session:session,
    name:document.getElementById("fbName").value.trim(),
    branch:document.getElementById("fbBranch").value.trim(),
    rating:rating.value,contentQuality:cq.value,speakerEffectiveness:se.value,
    relevantToRole:rel.value,wouldRecommend:rec.value,
    comments:document.getElementById("fbComments").value.trim(),
    improvements:document.getElementById("fbImprove").value.trim(),
    suggestions:document.getElementById("fbSuggest").value.trim(),
    timestamp:new Date().toISOString()
  };

  var btn=document.getElementById("fbSubmit");
  btn.disabled=true;btn.textContent="Submitting...";

  fetch(SCRIPT_URL,{method:"POST",mode:"no-cors",headers:{"Content-Type":"text/plain"},body:JSON.stringify(payload)})
  .then(function(){
    document.getElementById("fbForm").style.display="none";
    document.getElementById("fbSuccess").style.display="block";
  }).catch(function(){
    showMsg("fbMsg","Network error. Please try again.","err");
  }).finally(function(){
    btn.disabled=false;btn.textContent="Submit Feedback";
  });
});

document.getElementById("fbAgain").addEventListener("click",function(){
  document.getElementById("fbForm").reset();
  document.getElementById("fbSuccess").style.display="none";
  document.getElementById("fbForm").style.display="block";
  document.getElementById("fbMsg").className="msg";
  renderFbSessions(fbCurrentDay);
});

// REPORT
function loadReport(){
  document.getElementById("rptBody").innerHTML='<tr><td colspan="9" style="text-align:center;padding:24px;color:#aaa">Loading...</td></tr>';
  fetch(SCRIPT_URL+"?action=report")
  .then(function(r){return r.json();})
  .then(function(data){
    rptData=data||[];
    updateReportStats();
    populateSessionFilter();
    renderReportTable();
  }).catch(function(){
    document.getElementById("rptBody").innerHTML='<tr><td colspan="9" style="text-align:center;padding:24px;color:var(--err)">Failed to load data.</td></tr>';
  });
}

function getFilteredData(){
  var day=document.getElementById("rptDay").value;
  var sess=document.getElementById("rptSession").value;
  return rptData.filter(function(r){
    if(day&&r["Day"]!==day)return false;
    if(sess&&r["Session"]!==sess)return false;
    return true;
  });
}

function updateReportStats(){
  var filtered=getFilteredData();
  document.getElementById("statTotal").textContent=filtered.length;
  document.getElementById("statD1").textContent=rptData.filter(function(r){return r["Day"]==="Day 1"}).length;
  document.getElementById("statD2").textContent=rptData.filter(function(r){return r["Day"]==="Day 2"}).length;
}

function populateSessionFilter(){
  var sel=document.getElementById("rptSession");
  var cur=sel.value;
  var sessions={};
  rptData.forEach(function(r){if(r["Session"])sessions[r["Session"]]=true;});
  sel.innerHTML='<option value="">All Sessions</option>';
  Object.keys(sessions).sort().forEach(function(s){
    var o=document.createElement("option");
    o.value=s;o.textContent=s;
    sel.appendChild(o);
  });
  if(cur)sel.value=cur;
}

function renderReportTable(){
  var data=getFilteredData();
  var body=document.getElementById("rptBody");
  if(!data.length){
    body.innerHTML='<tr><td colspan="9" style="text-align:center;padding:24px;color:#aaa">No records found.</td></tr>';
    return;
  }
  body.innerHTML="";
  data.forEach(function(r,i){
    var tr=document.createElement("tr");
    var dateStr=r["Timestamp"]?new Date(r["Timestamp"]).toLocaleDateString():"";
    var sigSrc=r["Signature"]||"";
    var sigHtml=sigSrc?'<img class="st" src="'+sigSrc+'" onclick="showSig(this.src)" alt="sig">':"-";
    tr.innerHTML='<td>'+(i+1)+'</td><td>'+dateStr+'</td><td>'+(r["Day"]||"")+'</td><td>'+(r["Session"]||"")+'</td><td>'+(r["Full Name"]||"")+'</td><td>'+(r["Branch/Department"]||"")+'</td><td>'+(r["Designation"]||"")+'</td><td>'+(r["Mobile"]||"")+'</td><td>'+sigHtml+'</td>';
    body.appendChild(tr);
  });
}

document.getElementById("rptDay").addEventListener("change",function(){
  updateReportStats();populateSessionFilter();renderReportTable();
});
document.getElementById("rptSession").addEventListener("change",function(){
  updateReportStats();renderReportTable();
});
document.getElementById("rptRefresh").addEventListener("click",loadReport);
document.getElementById("rptPrint").addEventListener("click",function(){window.print();});

// SIGNATURE MODAL
function showSig(src){
  document.getElementById("sigModalImg").src=src;
  document.getElementById("sigModal").classList.add("show");
}
document.getElementById("sigModalClose").addEventListener("click",function(){
  document.getElementById("sigModal").classList.remove("show");
});
document.getElementById("sigModal").addEventListener("click",function(e){
  if(e.target===this)this.classList.remove("show");
});
</script>
</body>
</html>
"@
Set-Content -Path "C:\Users\Lenovo\Documents\Default Project\ilbsl-attendance\index.html" -Value $html -Encoding UTF8 -NoNewline
