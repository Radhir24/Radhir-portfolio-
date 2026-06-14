/* ═══════════════════════════════════════════════════════
   K. Radhir Portfolio — script.js
   ═══════════════════════════════════════════════════════ */

/* ────────────────────────────────────────────────────────
   1. DEMO SWITCHER
   ──────────────────────────────────────────────────────── */

const demoUrls = {
  landing: 'portfolio.k-radhir.dev/landing',
  todo:    'portfolio.k-radhir.dev/todo-app',
  calc:    'portfolio.k-radhir.dev/calculator',
  palette: 'portfolio.k-radhir.dev/palette-gen'
};

const demoTabIndex = { landing: 0, todo: 1, calc: 2, palette: 3 };

function openDemo(id) {
  // hide all demo panels
  document.querySelectorAll('.demo-content').forEach(function(d) {
    d.classList.remove('active');
  });
  // deactivate all tabs
  document.querySelectorAll('.demo-tab').forEach(function(t) {
    t.classList.remove('active');
  });
  // show selected demo & tab
  document.getElementById('demo-' + id).classList.add('active');
  document.getElementById('demoUrl').textContent = demoUrls[id];
  document.querySelectorAll('.demo-tab')[demoTabIndex[id]].classList.add('active');

  // scroll demos section into view
  document.getElementById('demos').scrollIntoView({ behavior: 'smooth' });

  // trigger demo-specific init
  if (id === 'landing') animateCounters();
  if (id === 'palette') generatePalette();
}


/* ────────────────────────────────────────────────────────
   2. LANDING PAGE — COUNTER ANIMATION
   ──────────────────────────────────────────────────────── */

var countersRan = false;

function animateCounters() {
  if (countersRan) return;
  countersRan = true;

  var targets = [
    { id: 'ldN1', end: 12400, suffix: '+' },
    { id: 'ldN2', end: 850,   suffix: '+' },
    { id: 'ldN3', end: 42,    suffix: ''  }
  ];

  targets.forEach(function(t) {
    var current = 0;
    var step = Math.ceil(t.end / 60);
    var el = document.getElementById(t.id);
    var interval = setInterval(function() {
      current = Math.min(current + step, t.end);
      el.textContent = current.toLocaleString() + t.suffix;
      if (current >= t.end) clearInterval(interval);
    }, 20);
  });
}

// Auto-run counters if landing demo is visible on page load
window.addEventListener('load', function() {
  if (document.getElementById('demo-landing').classList.contains('active')) {
    animateCounters();
  }
});


/* ────────────────────────────────────────────────────────
   3. TODO APP
   ──────────────────────────────────────────────────────── */

var todos = [
  { id: 1, text: 'Design portfolio hero section',  priority: 'high', done: false },
  { id: 2, text: 'Build responsive landing page',  priority: 'high', done: true  },
  { id: 3, text: 'Write project descriptions',     priority: 'med',  done: false },
  { id: 4, text: 'Add live demos',                 priority: 'med',  done: false },
  { id: 5, text: 'Test on mobile devices',         priority: 'low',  done: false }
];

var todoFilter = 'all';
var nextTodoId = 6;

// Set today's date label
var todayLabel = document.getElementById('todoDate');
if (todayLabel) {
  todayLabel.textContent = new Date().toLocaleDateString('en-US', {
    weekday: 'long', month: 'short', day: 'numeric'
  });
}

function renderTodos() {
  var list = document.getElementById('todoList');
  if (!list) return;

  var visible = todos.filter(function(t) {
    if (todoFilter === 'active') return !t.done;
    if (todoFilter === 'done')   return  t.done;
    return true;
  });

  if (!visible.length) {
    list.innerHTML = '<div style="text-align:center;color:#475569;padding:24px;font-size:14px">No tasks here ✨</div>';
    return;
  }

  list.innerHTML = visible.map(function(t) {
    var prioClass = t.priority === 'high' ? 'p-high' : t.priority === 'med' ? 'p-med' : 'p-low';
    return (
      '<div class="todo-item ' + (t.done ? 'done' : '') + '" id="ti-' + t.id + '">' +
        '<div class="todo-cb ' + (t.done ? 'checked' : '') + '" onclick="toggleTodo(' + t.id + ')"></div>' +
        '<span class="todo-text">' + escapeHtml(t.text) + '</span>' +
        '<span class="todo-priority ' + prioClass + '">' + t.priority.toUpperCase() + '</span>' +
        '<button class="todo-del" onclick="deleteTodo(' + t.id + ')">✕</button>' +
      '</div>'
    );
  }).join('');
}

function escapeHtml(str) {
  return str.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
}

function addTodo() {
  var inp  = document.getElementById('todoInput');
  var text = inp.value.trim();
  if (!text) return;
  var prio = document.getElementById('todoPriority').value;
  todos.unshift({ id: nextTodoId++, text: text, priority: prio, done: false });
  inp.value = '';
  renderTodos();
}

function toggleTodo(id) {
  var t = todos.find(function(t) { return t.id === id; });
  if (t) { t.done = !t.done; renderTodos(); }
}

function deleteTodo(id) {
  todos = todos.filter(function(t) { return t.id !== id; });
  renderTodos();
}

function filterTodos(filter, btn) {
  todoFilter = filter;
  document.querySelectorAll('.todo-filter').forEach(function(b) {
    b.classList.remove('active');
  });
  btn.classList.add('active');
  renderTodos();
}

// Initial render
renderTodos();


/* ────────────────────────────────────────────────────────
   4. CALCULATOR
   ──────────────────────────────────────────────────────── */

var calcState = {
  val:    '0',
  expr:   '',
  op:     null,
  prev:   null,
  newNum: true
};

function calcAction(key) {
  var s = calcState;

  if (key === 'C') {
    s.val    = '0';
    s.expr   = '';
    s.op     = null;
    s.prev   = null;
    s.newNum = true;

  } else if (key === '±') {
    s.val = s.val.startsWith('-') ? s.val.slice(1) : '-' + s.val;

  } else if (key === '%') {
    s.val = String(parseFloat(s.val) / 100);

  } else if ('0123456789.'.includes(key)) {
    if (s.newNum) {
      s.val    = key === '.' ? '0.' : key;
      s.newNum = false;
    } else {
      if (key === '.' && s.val.includes('.')) return;
      s.val = (s.val === '0' && key !== '.') ? key : s.val + key;
    }

  } else if (['+', '−', '×', '÷'].includes(key)) {
    if (s.op && !s.newNum) { runCalc(); }
    s.prev   = parseFloat(s.val);
    s.op     = key;
    s.newNum = true;
    s.expr   = s.val + ' ' + key;

  } else if (key === '=') {
    if (!s.op) return;
    var result = runCalc(true);
    s.expr   = s.prev + ' ' + s.op + ' ' + s.val + ' =';
    s.val    = String(result);
    s.op     = null;
    s.newNum = true;
  }

  // Update display
  var displayVal = parseFloat(s.val);
  document.getElementById('calcVal').textContent  =
    isNaN(displayVal) ? 'Error' : displayVal.toLocaleString('en', { maximumFractionDigits: 8 });
  document.getElementById('calcExpr').textContent = s.expr;
}

function runCalc(returnResult) {
  var s = calcState;
  var a = s.prev;
  var b = parseFloat(s.val);
  var result;

  if      (s.op === '+') result = a + b;
  else if (s.op === '−') result = a - b;
  else if (s.op === '×') result = a * b;
  else if (s.op === '÷') result = b !== 0 ? a / b : 0;

  if (returnResult) return result;

  s.val    = String(result);
  s.prev   = result;
  s.newNum = true;
  document.getElementById('calcVal').textContent =
    result.toLocaleString('en', { maximumFractionDigits: 8 });
}

// Keyboard support for calculator
document.addEventListener('keydown', function(e) {
  if (!document.getElementById('demo-calc').classList.contains('active')) return;

  var keyMap = {
    '0': '0', '1': '1', '2': '2', '3': '3', '4': '4',
    '5': '5', '6': '6', '7': '7', '8': '8', '9': '9',
    '.': '.', '+': '+', '-': '−', '*': '×', '/': '÷',
    'Enter': '=', 'Backspace': 'C', 'Escape': 'C'
  };

  if (keyMap[e.key]) {
    e.preventDefault();
    calcAction(keyMap[e.key]);
  }
});


/* ────────────────────────────────────────────────────────
   5. COLOR PALETTE GENERATOR
   ──────────────────────────────────────────────────────── */

var currentScheme = 'analogous';

var colorNames = [
  'Royal Violet', 'Ocean Cyan', 'Emerald Green',
  'Amber Gold', 'Crimson Red', 'Sapphire Blue',
  'Magenta Pink', 'Lime Zest'
];

function hexToHsl(hex) {
  var r = parseInt(hex.slice(1, 3), 16) / 255;
  var g = parseInt(hex.slice(3, 5), 16) / 255;
  var b = parseInt(hex.slice(5, 7), 16) / 255;

  var max = Math.max(r, g, b);
  var min = Math.min(r, g, b);
  var h, s;
  var l = (max + min) / 2;

  if (max === min) {
    h = s = 0;
  } else {
    var d = max - min;
    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
    switch (max) {
      case r: h = ((g - b) / d + (g < b ? 6 : 0)) / 6; break;
      case g: h = ((b - r) / d + 2) / 6; break;
      case b: h = ((r - g) / d + 4) / 6; break;
    }
  }
  return [h * 360, s * 100, l * 100];
}

function hslToHex(h, s, l) {
  h /= 360; s /= 100; l /= 100;
  var r, g, b;

  if (!s) {
    r = g = b = l;
  } else {
    var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
    var p = 2 * l - q;
    r = hueToRgb(p, q, h + 1/3);
    g = hueToRgb(p, q, h);
    b = hueToRgb(p, q, h - 1/3);
  }

  return '#' + [r, g, b].map(function(v) {
    return Math.round(Math.min(255, Math.max(0, v * 255))).toString(16).padStart(2, '0');
  }).join('');
}

function hueToRgb(p, q, t) {
  if (t < 0) t++;
  if (t > 1) t--;
  if (t < 1/6) return p + (q - p) * 6 * t;
  if (t < 1/2) return q;
  if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
  return p;
}

function setScheme(scheme, btn) {
  currentScheme = scheme;
  document.querySelectorAll('.scheme-btn').forEach(function(b) {
    b.classList.remove('active');
  });
  btn.classList.add('active');
  generatePalette();
}

function generatePalette() {
  var seedEl = document.getElementById('seedColor');
  if (!seedEl) return;

  var seed   = seedEl.value;
  var hsl    = hexToHsl(seed);
  var h = hsl[0], s = hsl[1], l = hsl[2];
  var colors;

  if (currentScheme === 'analogous') {
    colors = [
      hslToHex(h, s, l),
      hslToHex((h + 30) % 360, s, l),
      hslToHex((h + 60) % 360, s, l),
      hslToHex((h - 30 + 360) % 360, s, l),
      hslToHex((h + 15) % 360, s * 0.8, Math.min(l * 1.1, 90))
    ];
  } else if (currentScheme === 'complementary') {
    colors = [
      hslToHex(h, s, l),
      hslToHex((h + 180) % 360, s, l),
      hslToHex(h, s * 0.7, Math.min(l + 15, 90)),
      hslToHex((h + 180) % 360, s * 0.7, Math.min(l + 15, 90)),
      hslToHex(h, s * 0.4, 70)
    ];
  } else if (currentScheme === 'triadic') {
    colors = [
      hslToHex(h, s, l),
      hslToHex((h + 120) % 360, s, l),
      hslToHex((h + 240) % 360, s, l),
      hslToHex(h, s * 0.6, Math.min(l + 10, 90)),
      hslToHex((h + 120) % 360, s * 0.6, Math.min(l + 10, 90))
    ];
  } else {
    // monochromatic
    colors = [
      hslToHex(h, s, 20),
      hslToHex(h, s, 35),
      hslToHex(h, s, 50),
      hslToHex(h, s, 65),
      hslToHex(h, s, 80)
    ];
  }

  // Render swatches bar
  var swatchEl = document.getElementById('paletteSwatch');
  swatchEl.innerHTML = colors.map(function(c) {
    return (
      '<div class="swatch" style="background:' + c + '" onclick="copyHex(\'' + c + '\',this)">' +
        '<span class="swatch-hex">' + c + '</span>' +
      '</div>'
    );
  }).join('');

  // Render list
  var listEl = document.getElementById('paletteList');
  listEl.innerHTML = colors.map(function(c, i) {
    return (
      '<div class="palette-row">' +
        '<div class="pl-swatch" style="background:' + c + '"></div>' +
        '<span class="pl-hex">' + c.toUpperCase() + '</span>' +
        '<span class="pl-name">' + (colorNames[i] || 'Color ' + (i + 1)) + '</span>' +
        '<button class="pl-copy" onclick="copyHex(\'' + c + '\',this)">Copy</button>' +
      '</div>'
    );
  }).join('');
}

function copyHex(hex, el) {
  navigator.clipboard.writeText(hex).catch(function() {});
  var orig = el.textContent;
  el.textContent = 'Copied!';
  el.classList.add('copied');
  setTimeout(function() {
    el.textContent = orig;
    el.classList.remove('copied');
  }, 1500);
}

// Initial palette render
generatePalette();


/* ────────────────────────────────────────────────────────
   6. SKILLS RINGS
   ──────────────────────────────────────────────────────── */

var skills = [
  { name: 'HTML / CSS',       pct: 95, color: '#7C3AED' },
  { name: 'JavaScript',       pct: 92, color: '#06B6D4' },
  { name: 'React',            pct: 88, color: '#10B981' },
  { name: 'Figma',            pct: 90, color: '#F59E0B' },
  { name: 'Content Creation', pct: 92, color: '#A78BFA' },
  { name: 'Video Editing',    pct: 85, color: '#67E8F9' },
  { name: 'After Effects',    pct: 80, color: '#6EE7B7' },
  { name: 'Node.js',          pct: 75, color: '#FCD34D' }
];

var R = 32;
var CIRCUMFERENCE = 2 * Math.PI * R;

var skillsGrid = document.getElementById('skillsGrid');
if (skillsGrid) {
  skillsGrid.innerHTML = skills.map(function(s) {
    var offset = CIRCUMFERENCE - (s.pct / 100) * CIRCUMFERENCE;
    return (
      '<div class="skill-card">' +
        '<div class="skill-ring">' +
          '<svg viewBox="0 0 80 80" width="80" height="80">' +
            '<circle class="skill-ring-bg" cx="40" cy="40" r="' + R + '"/>' +
            '<circle class="skill-ring-fill" cx="40" cy="40" r="' + R + '"' +
              ' stroke="' + s.color + '"' +
              ' stroke-dasharray="' + CIRCUMFERENCE + '"' +
              ' stroke-dashoffset="' + offset + '"/>' +
          '</svg>' +
          '<div class="skill-pct" style="color:' + s.color + '">' + s.pct + '%</div>' +
        '</div>' +
        '<div class="skill-name">' + s.name + '</div>' +
      '</div>'
    );
  }).join('');
}

