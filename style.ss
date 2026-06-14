/* ═══════════════════════════════════════════════════════
   K. Radhir Portfolio — style.css
   ═══════════════════════════════════════════════════════ */

/* ── CSS Variables ── */
:root {
  --bg:           #080B14;
  --bg2:          #0D1120;
  --bg3:          #111827;
  --purple:       #7C3AED;
  --purple-light: #A78BFA;
  --cyan:         #06B6D4;
  --cyan-light:   #67E8F9;
  --green:        #10B981;
  --text:         #F1F5F9;
  --text-muted:   #94A3B8;
  --border:       #1E293B;
  --card:         #0F172A;
}

/* ── Reset & Base ── */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
html {
  scroll-behavior: smooth;
}
body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Space Grotesk', sans-serif;
  line-height: 1.6;
  overflow-x: hidden;
}

/* ═══════════════════════════════════════════════════════
   NAVIGATION
   ═══════════════════════════════════════════════════════ */
nav {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 100;
  background: rgba(8, 11, 20, 0.85);
  backdrop-filter: blur(12px);
  border-bottom: 1px solid var(--border);
  padding: 14px 32px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.nav-logo {
  font-family: 'JetBrains Mono', monospace;
  font-size: 15px;
  color: var(--cyan-light);
  font-weight: 600;
}
.nav-links {
  display: flex;
  gap: 28px;
  list-style: none;
}
.nav-links a {
  color: var(--text-muted);
  text-decoration: none;
  font-size: 14px;
  transition: color 0.2s;
}
.nav-links a:hover {
  color: var(--cyan-light);
}
.nav-cta {
  background: linear-gradient(135deg, var(--purple), var(--cyan));
  color: white;
  border: none;
  padding: 9px 20px;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  font-family: inherit;
  transition: opacity 0.2s;
}
.nav-cta:hover {
  opacity: 0.85;
}

/* ═══════════════════════════════════════════════════════
   HERO
   ═══════════════════════════════════════════════════════ */
.hero {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 100px 32px 60px;
  position: relative;
  overflow: hidden;
}
.hero::before {
  content: '';
  position: absolute;
  top: -200px;
  left: 50%;
  transform: translateX(-50%);
  width: 800px;
  height: 800px;
  background: radial-gradient(circle, rgba(124, 58, 237, 0.15) 0%, transparent 70%);
  pointer-events: none;
}
.hero-badge {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  background: rgba(124, 58, 237, 0.15);
  border: 1px solid rgba(124, 58, 237, 0.4);
  color: var(--purple-light);
  font-size: 12px;
  font-weight: 600;
  padding: 6px 14px;
  border-radius: 100px;
  margin-bottom: 24px;
  letter-spacing: 0.05em;
  text-transform: uppercase;
}
.hero-badge::before {
  content: '●';
  color: var(--purple);
  animation: pulse 2s infinite;
}
.hero h1 {
  font-size: clamp(48px, 9vw, 96px);
  font-weight: 700;
  line-height: 1;
  letter-spacing: -2px;
  margin-bottom: 10px;
}
.grad {
  background: linear-gradient(135deg, var(--purple-light), var(--cyan-light));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
.hero-sub {
  color: var(--text-muted);
  font-size: clamp(15px, 2.5vw, 18px);
  max-width: 560px;
  margin: 16px auto 36px;
}
.hero-btns {
  display: flex;
  gap: 14px;
  justify-content: center;
  flex-wrap: wrap;
}

/* ═══════════════════════════════════════════════════════
   BUTTONS
   ═══════════════════════════════════════════════════════ */
.btn-primary {
  background: linear-gradient(135deg, var(--purple), var(--cyan));
  color: white;
  padding: 13px 28px;
  border-radius: 10px;
  font-size: 15px;
  font-weight: 600;
  text-decoration: none;
  border: none;
  cursor: pointer;
  font-family: inherit;
  transition: transform 0.2s, opacity 0.2s;
  display: inline-block;
}
.btn-primary:hover {
  transform: translateY(-2px);
  opacity: 0.9;
}
.btn-ghost {
  background: transparent;
  color: var(--text);
  border: 1px solid var(--border);
  padding: 13px 28px;
  border-radius: 10px;
  font-size: 15px;
  font-weight: 500;
  text-decoration: none;
  cursor: pointer;
  font-family: inherit;
  transition: border-color 0.2s, color 0.2s;
  display: inline-block;
}
.btn-ghost:hover {
  border-color: var(--cyan);
  color: var(--cyan-light);
}
.btn-sm {
  flex: 1;
  padding: 9px;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 600;
  font-family: inherit;
  cursor: pointer;
  transition: all 0.2s;
  text-align: center;
  text-decoration: none;
  display: block;
}
.btn-sm-primary {
  background: linear-gradient(135deg, var(--purple), var(--cyan));
  color: white;
  border: none;
}
.btn-sm-ghost {
  background: transparent;
  color: var(--text-muted);
  border: 1px solid var(--border);
}
.btn-sm-ghost:hover {
  border-color: var(--cyan);
  color: var(--cyan-light);
}

/* ═══════════════════════════════════════════════════════
   SECTION BASE
   ═══════════════════════════════════════════════════════ */
.section {
  padding: 80px 32px;
  max-width: 1100px;
  margin: 0 auto;
}
.section-label {
  font-family: 'JetBrains Mono', monospace;
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--cyan);
  margin-bottom: 12px;
}
.section-title {
  font-size: clamp(28px, 4vw, 42px);
  font-weight: 700;
  letter-spacing: -1px;
  margin-bottom: 8px;
}
.section-desc {
  color: var(--text-muted);
  font-size: 16px;
  max-width: 560px;
  margin-bottom: 48px;
}
.divider {
  height: 1px;
  background: var(--border);
  margin: 0 32px;
}

/* ═══════════════════════════════════════════════════════
   PORTFOLIO CARDS
   ═══════════════════════════════════════════════════════ */
.portfolio-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: 20px;
}
.card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 16px;
  overflow: hidden;
  transition: transform 0.2s, border-color 0.2s;
}
.card:hover {
  transform: translateY(-4px);
  border-color: rgba(124, 58, 237, 0.5);
}
.card-preview {
  width: 100%;
  height: 200px;
  background: var(--bg3);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  border-bottom: 1px solid var(--border);
}
.preview-label {
  position: absolute;
  top: 10px;
  right: 10px;
  background: rgba(6, 182, 212, 0.15);
  border: 1px solid rgba(6, 182, 212, 0.4);
  color: var(--cyan-light);
  font-size: 10px;
  font-weight: 600;
  padding: 3px 8px;
  border-radius: 6px;
  letter-spacing: 0.05em;
}
.card-body {
  padding: 20px;
}
.card-title {
  font-size: 17px;
  font-weight: 600;
  margin-bottom: 6px;
}
.card-desc {
  color: var(--text-muted);
  font-size: 13px;
  line-height: 1.5;
  margin-bottom: 16px;
}
.tags {
  display: flex;
  gap: 6px;
  flex-wrap: wrap;
  margin-bottom: 16px;
}
.tag {
  background: rgba(124, 58, 237, 0.12);
  border: 1px solid rgba(124, 58, 237, 0.25);
  color: var(--purple-light);
  font-size: 11px;
  font-weight: 600;
  padding: 3px 9px;
  border-radius: 6px;
  letter-spacing: 0.03em;
}
.card-actions {
  display: flex;
  gap: 10px;
}

/* ═══════════════════════════════════════════════════════
   DEMO SECTION
   ═══════════════════════════════════════════════════════ */
.demos-section {
  padding: 60px 0;
  background: var(--bg2);
}
.demos-section .section {
  max-width: 1200px;
}
.demo-tabs {
  display: flex;
  gap: 8px;
  margin-bottom: 32px;
  flex-wrap: wrap;
}
.demo-tab {
  padding: 10px 20px;
  border-radius: 10px;
  font-size: 13px;
  font-weight: 600;
  font-family: inherit;
  cursor: pointer;
  border: 1px solid var(--border);
  background: transparent;
  color: var(--text-muted);
  transition: all 0.2s;
}
.demo-tab.active {
  background: linear-gradient(135deg, var(--purple), var(--cyan));
  color: white;
  border-color: transparent;
}
.demo-frame {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 16px;
  overflow: hidden;
}
.demo-topbar {
  background: var(--bg3);
  padding: 12px 20px;
  display: flex;
  align-items: center;
  gap: 12px;
  border-bottom: 1px solid var(--border);
}
.dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}
.dot-r { background: #EF4444; }
.dot-y { background: #F59E0B; }
.dot-g { background: #10B981; }
.demo-url {
  flex: 1;
  background: var(--bg);
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 5px 12px;
  font-family: 'JetBrains Mono', monospace;
  font-size: 12px;
  color: var(--text-muted);
}
.demo-content {
  display: none;
}
.demo-content.active {
  display: block;
}

/* ── Demo: Landing Page ── */
.landing-demo {
  background: #0A0F1E;
  min-height: 500px;
  padding: 60px 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}
.ld-badge {
  background: rgba(124, 58, 237, 0.2);
  border: 1px solid rgba(124, 58, 237, 0.4);
  color: #A78BFA;
  font-size: 11px;
  padding: 4px 14px;
  border-radius: 20px;
  margin-bottom: 20px;
  display: inline-block;
}
.ld-h1 {
  font-size: clamp(32px, 5vw, 56px);
  font-weight: 700;
  letter-spacing: -1px;
  margin-bottom: 12px;
  line-height: 1.1;
}
.ld-grad {
  background: linear-gradient(135deg, #7C3AED, #06B6D4);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
.ld-sub {
  color: #94A3B8;
  font-size: 16px;
  max-width: 440px;
  margin: 0 auto 32px;
}
.ld-btns {
  display: flex;
  gap: 12px;
  justify-content: center;
  flex-wrap: wrap;
}
.ld-btn1 {
  background: linear-gradient(135deg, #7C3AED, #06B6D4);
  color: white;
  border: none;
  padding: 12px 28px;
  border-radius: 10px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  font-family: inherit;
}
.ld-btn2 {
  background: transparent;
  color: #94A3B8;
  border: 1px solid #1E293B;
  padding: 12px 28px;
  border-radius: 10px;
  font-size: 14px;
  cursor: pointer;
  font-family: inherit;
}
.ld-stats {
  display: flex;
  gap: 40px;
  margin-top: 48px;
  justify-content: center;
}
.ld-stat-n {
  font-size: 28px;
  font-weight: 700;
  color: #A78BFA;
}
.ld-stat-l {
  font-size: 12px;
  color: #64748B;
  margin-top: 2px;
}

/* ── Demo: Todo App ── */
.todo-demo {
  background: #0A0F1E;
  min-height: 500px;
  padding: 40px;
}
.todo-title-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}
.todo-h {
  font-size: 22px;
  font-weight: 700;
}
.todo-date {
  font-size: 13px;
  color: #64748B;
}
.todo-input-row {
  display: flex;
  gap: 10px;
  margin-bottom: 24px;
}
.todo-input {
  flex: 1;
  background: #0F172A;
  border: 1px solid #1E293B;
  color: #F1F5F9;
  padding: 12px 16px;
  border-radius: 10px;
  font-size: 14px;
  font-family: inherit;
  outline: none;
}
.todo-input:focus {
  border-color: #7C3AED;
}
.todo-select {
  background: #0F172A;
  border: 1px solid #1E293B;
  color: #94A3B8;
  padding: 12px;
  border-radius: 10px;
  font-family: inherit;
  font-size: 13px;
  cursor: pointer;
  outline: none;
}
.todo-add {
  background: linear-gradient(135deg, #7C3AED, #06B6D4);
  color: white;
  border: none;
  padding: 12px 20px;
  border-radius: 10px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  font-family: inherit;
  white-space: nowrap;
}
.todo-filters {
  display: flex;
  gap: 8px;
  margin-bottom: 20px;
}
.todo-filter {
  padding: 6px 16px;
  border-radius: 8px;
  border: 1px solid #1E293B;
  background: transparent;
  color: #64748B;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  font-family: inherit;
  transition: all 0.2s;
}
.todo-filter.active {
  background: rgba(124, 58, 237, 0.2);
  border-color: rgba(124, 58, 237, 0.4);
  color: #A78BFA;
}
.todo-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.todo-item {
  background: #0F172A;
  border: 1px solid #1E293B;
  border-radius: 12px;
  padding: 14px 16px;
  display: flex;
  align-items: center;
  gap: 12px;
  transition: border-color 0.2s;
}
.todo-item:hover {
  border-color: #334155;
}
.todo-item.done {
  opacity: 0.5;
}
.todo-cb {
  width: 20px;
  height: 20px;
  border-radius: 6px;
  border: 2px solid #334155;
  background: transparent;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition: all 0.2s;
}
.todo-cb.checked {
  background: linear-gradient(135deg, #7C3AED, #06B6D4);
  border-color: transparent;
}
.todo-cb.checked::after {
  content: '✓';
  color: white;
  font-size: 11px;
  font-weight: 700;
}
.todo-text {
  flex: 1;
  font-size: 14px;
}
.todo-item.done .todo-text {
  text-decoration: line-through;
  color: #475569;
}
.todo-del {
  background: none;
  border: none;
  color: #475569;
  cursor: pointer;
  font-size: 16px;
  padding: 0 4px;
  transition: color 0.2s;
}
.todo-del:hover {
  color: #EF4444;
}
.todo-priority {
  font-size: 10px;
  font-weight: 700;
  padding: 3px 8px;
  border-radius: 5px;
  flex-shrink: 0;
}
.p-high { background: rgba(239,68,68,.15); color: #F87171; }
.p-med  { background: rgba(245,158,11,.15); color: #FCD34D; }
.p-low  { background: rgba(16,185,129,.15); color: #6EE7B7; }

/* ── Demo: Calculator ── */
.calc-demo {
  background: #0A0F1E;
  min-height: 500px;
  padding: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.calc-wrap {
  background: #0F172A;
  border: 1px solid #1E293B;
  border-radius: 24px;
  padding: 28px;
  width: 320px;
}
.calc-display {
  background: #080B14;
  border-radius: 16px;
  padding: 20px 20px 12px;
  text-align: right;
  margin-bottom: 20px;
  border: 1px solid #1E293B;
}
.calc-expr {
  color: #64748B;
  font-size: 14px;
  min-height: 20px;
  font-family: 'JetBrains Mono', monospace;
}
.calc-val {
  font-size: 42px;
  font-weight: 300;
  font-family: 'JetBrains Mono', monospace;
  color: #F1F5F9;
  margin-top: 4px;
  word-break: break-all;
}
.calc-btns {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 10px;
}
.c-btn {
  padding: 18px;
  border-radius: 12px;
  border: none;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  font-family: 'JetBrains Mono', monospace;
  transition: all 0.1s;
  user-select: none;
}
.c-btn:active {
  transform: scale(0.93);
}
.c-num { background: #1E293B; color: #F1F5F9; }
.c-num:hover { background: #2D3F55; }
.c-op  { background: rgba(124,58,237,.2); color: #A78BFA; border: 1px solid rgba(124,58,237,.3); }
.c-op:hover { background: rgba(124,58,237,.35); }
.c-eq  { background: linear-gradient(135deg, #7C3AED, #06B6D4); color: white; }
.c-clr { background: rgba(239,68,68,.15); color: #F87171; }
.c-clr:hover { background: rgba(239,68,68,.25); }
.c-zero { grid-column: span 2; }

/* ── Demo: Color Palette ── */
.palette-demo {
  background: #0A0F1E;
  min-height: 500px;
  padding: 40px;
}
.palette-title {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 6px;
}
.palette-sub {
  color: #64748B;
  font-size: 14px;
  margin-bottom: 28px;
}
.palette-controls {
  display: flex;
  gap: 12px;
  margin-bottom: 28px;
  align-items: center;
  flex-wrap: wrap;
}
.palette-seed-row {
  display: flex;
  gap: 10px;
  align-items: center;
}
.color-picker-label {
  font-size: 13px;
  color: #94A3B8;
}
.color-picker {
  width: 44px;
  height: 44px;
  border-radius: 10px;
  border: 2px solid #1E293B;
  cursor: pointer;
  padding: 2px;
  background: transparent;
}
.palette-scheme-btns {
  display: flex;
  gap: 8px;
}
.scheme-btn {
  padding: 8px 14px;
  border-radius: 8px;
  border: 1px solid #1E293B;
  background: transparent;
  color: #64748B;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  font-family: inherit;
  transition: all 0.2s;
}
.scheme-btn.active {
  background: rgba(124, 58, 237, 0.2);
  border-color: rgba(124, 58, 237, 0.4);
  color: #A78BFA;
}
.palette-gen-btn {
  margin-left: auto;
  background: linear-gradient(135deg, #7C3AED, #06B6D4);
  color: white;
  border: none;
  padding: 10px 22px;
  border-radius: 10px;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  font-family: inherit;
}
.palette-swatches {
  display: flex;
  border-radius: 16px;
  overflow: hidden;
  margin-bottom: 20px;
  height: 120px;
}
.swatch {
  flex: 1;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  padding-bottom: 10px;
  cursor: pointer;
  transition: flex 0.3s;
  position: relative;
}
.swatch:hover {
  flex: 1.4;
}
.swatch-hex {
  font-size: 10px;
  font-weight: 700;
  font-family: 'JetBrains Mono', monospace;
  background: rgba(0,0,0,.5);
  color: white;
  padding: 3px 7px;
  border-radius: 5px;
}
.palette-list {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.palette-row {
  display: flex;
  align-items: center;
  gap: 14px;
  background: #0F172A;
  border: 1px solid #1E293B;
  border-radius: 10px;
  padding: 12px 16px;
}
.pl-swatch {
  width: 32px;
  height: 32px;
  border-radius: 8px;
  flex-shrink: 0;
}
.pl-hex {
  font-family: 'JetBrains Mono', monospace;
  font-size: 13px;
  flex: 1;
}
.pl-name {
  color: #64748B;
  font-size: 12px;
  flex: 1;
}
.pl-copy {
  background: none;
  border: 1px solid #1E293B;
  color: #94A3B8;
  padding: 5px 12px;
  border-radius: 7px;
  font-size: 11px;
  cursor: pointer;
  font-family: inherit;
  transition: all 0.2s;
}
.pl-copy:hover {
  border-color: #06B6D4;
  color: #67E8F9;
}
.pl-copy.copied {
  background: rgba(16,185,129,.15);
  border-color: #10B981;
  color: #6EE7B7;
}

/* ═══════════════════════════════════════════════════════
   SKILLS
   ═══════════════════════════════════════════════════════ */
.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
}
.skill-card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 14px;
  padding: 24px;
  text-align: center;
}
.skill-ring {
  width: 80px;
  height: 80px;
  margin: 0 auto 16px;
  position: relative;
}
.skill-ring svg {
  transform: rotate(-90deg);
}
.skill-ring-bg {
  fill: none;
  stroke: #1E293B;
  stroke-width: 8;
}
.skill-ring-fill {
  fill: none;
  stroke-width: 8;
  stroke-linecap: round;
  transition: stroke-dashoffset 0.8s ease;
}
.skill-pct {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 17px;
  font-weight: 700;
  font-family: 'JetBrains Mono', monospace;
}
.skill-name {
  font-size: 13px;
  color: var(--text-muted);
  font-weight: 500;
}

/* ═══════════════════════════════════════════════════════
   ABOUT
   ═══════════════════════════════════════════════════════ */
.about-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 48px;
  align-items: center;
}
.about-avatar {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--purple), var(--cyan));
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
  font-weight: 700;
  margin-bottom: 20px;
}
.about-name {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 8px;
}
.about-role {
  color: var(--cyan-light);
  font-size: 14px;
  font-family: 'JetBrains Mono', monospace;
  margin-bottom: 16px;
}
.about-bio {
  color: var(--text-muted);
  font-size: 15px;
  line-height: 1.7;
  margin-bottom: 24px;
}
.about-stats {
  display: flex;
  gap: 28px;
}
.stat-val {
  font-size: 26px;
  font-weight: 700;
  color: var(--purple-light);
}
.stat-label {
  font-size: 12px;
  color: var(--text-muted);
}
.about-services {
  display: flex;
  flex-direction: column;
  gap: 14px;
}
.service-item {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 18px;
  display: flex;
  gap: 14px;
  align-items: flex-start;
  transition: border-color 0.2s;
}
.service-item:hover {
  border-color: rgba(124, 58, 237, 0.5);
}
.service-icon {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  background: rgba(124, 58, 237, 0.15);
  display: flex;
  align-items: center;
