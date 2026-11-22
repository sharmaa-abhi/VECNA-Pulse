# VECNA-Pulse

> **Real-Time Speech Emotion Recognition (SER) & Cybercrime Call Triage Incident Command Workstation**  
> Built for the VECNAVERSE Hackathon by **VoidRiders** (Abhishek Sharma & Team).

---

## ⚡ What is VECNA-Pulse?

**VECNA-Pulse** is an investigative workstation designed to assist 1930 / cybercrime call center operators in prioritizing emergency cyber fraud calls in real time. It analyzes vocal biomarkers (fundamental frequency F0, micro-tremor jitter, speech cadence, and loudness) to calculate distress urgency scores and assist officers in issuing golden-hour account freeze directives.

---

## 📁 Repository Directory Structure

```
vocal/
├── run.ps1                   # 🚀 One-click PowerShell launcher (starts Backend + Frontend)
├── start.bat                 # 🚀 One-click Windows CMD launcher
├── package.json              # Root workspace coordinator (unified test and build scripts)
├── API_CONTRACT.md           # REST & WebSocket protocol specifications
├── README.md                 # Root documentation and project overview
├── .gitignore                # Comprehensive Git ignore rules (Node, Python, ONNX, OS)
│
├── backend/                  # FastAPI & Acoustic Biomarker Engine
│   ├── app/                  # Application code
│   │   ├── main.py           # FastAPI server, REST routes, WebSocket hubs
│   │   ├── emotion_engine.py # DSP vocal biomarker extraction & ONNX acoustic models
│   │   ├── triage_agent.py   # PII redaction, cyber threat scoring, Wispr 1930 tickets
│   │   └── mock_generator.py # Synthetic scenarios & fallback audio generator
│   ├── samples/              # Pre-recorded WAV calls (Digital Arrest, UPI, Extortion)
│   ├── tests/                # Automated backend test suite
│   │   └── test_smoke.py     # End-to-end integration and smoke tests
│   ├── pyproject.toml        # Python project configuration & pytest settings
│   └── README.md             # Dedicated backend documentation
│
├── frontend/                 # Vite + React 18 + Tailwind CSS Workstation
│   ├── public/               # Static assets, branding, and sample audio
│   ├── src/                  # React application source
│   │   ├── components/       # UI components (PitchContourCanvas, BankFreezeModal, etc.)
│   │   ├── services/         # Client DSP engine, Web Audio analyser, IndexedDB caseDb
│   │   ├── App.jsx           # State coordinator & theme manager (Light / Dark)
│   │   ├── mockData.js       # Pre-computed cybercrime triage scenarios
│   │   └── index.css         # High-tech obsidian visual styling
│   ├── tests/                # Automated frontend test suite (Tasks 1 through 5)
│   ├── package.json          # Frontend dependencies & npm test scripts
│   ├── tailwind.config.js    # Design system palette configuration
│   ├── vite.config.js        # Vite dev server & proxy settings
│   └── README.md             # Dedicated frontend documentation
│
└── docs/                     # Architecture specifications & task completion reports
    └── superpowers/
        ├── plans/            # Engineering plans and verification reports
        └── specs/            # Workstation UX & technical design specifications
```

---

## 🚀 Quick Start (One-Click Launchers)

### Option A: Windows PowerShell Launcher (Recommended)
Right-click `run.ps1` and select **Run with PowerShell**, or execute:
```powershell
.\run.ps1
```

### Option B: Windows Command Prompt (Batch)
Double-click `start.bat` in File Explorer or run:
```cmd
start.bat
```

Both launchers automatically boot:
- **Backend API Server**: http://127.0.0.1:8000
- **Frontend Workstation**: http://localhost:3000

---

## 💻 Manual Development Setup

### 1. Backend (FastAPI + ONNX)
```powershell
cd backend
python -m pip install -e .
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```
*(Or with `uv`: `uv run uvicorn app.main:app --port 8000 --reload`)*

### 2. Frontend (Vite + React)
```powershell
cd frontend
npm install
npm run dev
```

---

## 🧪 Running Tests

### Frontend Test Suite (Tasks 1 – 5)
```powershell
cd frontend
npm test
```
Tests verify:
- **Task 1**: Hinglish & Indic cybercrime phrase detection, entity extraction, and attack stages.
- **Task 2**: 60fps PitchContourCanvas rendering, F0 trajectory math, and tremor detection.
- **Task 3**: Simulated NPCI / Bank Rapid Freeze Gateway Modal and Sec 102 CrPC liens.
- **Task 4**: Cryptographic Section 65B forensic SHA-256 evidence sealing and dossier export.
- **Task 5**: End-to-end integration across all subsystems.

### Backend Smoke Tests
```powershell
cd backend
python -m pytest tests/
```
*(Or run directly: `python backend/test_smoke.py`)*

---

## 🎮 Live Demo Guide

To test the system during review:

1. **Enable Demo Mode**:  
   Click the **Demo Mode** toggle in the top bar (`Demo Mode ON`).  
   *Because public, unredacted cybercrime audio datasets are legally restricted under privacy laws, Demo Mode provides pre-recorded, realistic scenarios demonstrating active extortion calls.*
2. **Select a Scenario**:
   - **Digital Arrest Extortion** (Critical urgency, severe vocal pitch tremor)
   - **Active UPI Fraud & Remote APK Drain** (High urgency, rapid cadence)
   - **Sextortion & Cyber Blackmail** (Critical distress indicators)
   - **Mule Account Informant Tip** (Moderate vocal tension)
3. **Play Synchronized Audio**:  
   Click the **Play** button in the center panel to hear the caller's spoken transcript with real-time synchronized timeline cursor and biomarker tracking.
4. **Wispr Voice Co-Pilot & 1930 Freeze Ticket**:  
   In the right panel, dictate or type dispatch notes (e.g. *"Caller confirmed transfer of 45,000 via PhonePe, issue freeze"*) and click **Apply note** (or press `Ctrl + Enter`) to auto-generate an emergency **1930 NCRP Freeze Ticket Draft**.
5. **NPCI Rapid Freeze Gateway Directive**:  
   Click **Dispatch 1930 Freeze Directive** to simulate the NPCI CFMS API handshake and issue a Section 102 CrPC administrative lien token.
6. **Export Section 65B Case Dossier**:  
   Click **Export** to download the complete case record in Markdown (`.md`) and JSON telemetry formats with cryptographic SHA-256 evidence seal.

---

## 💡 Ultra-Lightweight & Hardware-Adaptive

- **Minimal CPU Footprint, No GPU Required**: VECNA-Pulse runs directly on standard consumer hardware using pure client-side Web Audio API DSP and quantized on-device models.
- **Runs 100% On-Device**: Can be deployed to static hosting (Vercel, Netlify) with **0 MB model download** overhead in lightweight mode.
- **Zero-Cost BYOK**: Supports free API keys for **SiliconFlow** (`SenseVoiceSmall` + `Qwen 2.5`), **Groq**, and **OpenRouter**, or runs completely offline.

---

## ⚠️ Statutory Notice & Guardrails

- **Statutory Guardrail**: Automated vocal emotion metrics are **indicative triage signals only** to assist queue prioritization. They do not constitute judicial evidence of guilt, innocence, or intent.
- **Evidence Integrity**: All exported records are sealed with SHA-256 hashes pursuant to Section 65B of the Indian Evidence Act / Section 63 of the Bharatiya Sakshya Adhiniyam (BSA) 2023.

---

## 👥 Authors
Built for the VECNAVERSE Hackathon by **VoidRiders**:
- **Abhishek Sharma** & Team VoidRiders
