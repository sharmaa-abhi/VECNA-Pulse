# VECNA-Pulse Backend API

> **Real-Time Speech Emotion Recognition (SER) & Cybercrime Call Triage Engine**  
> Built with FastAPI, WebSockets, Librosa, Scipy, and Sherpa-ONNX.

---

## 🏛️ Architecture Overview

The backend is structured into modular domain engines:

```
backend/
├── app/
│   ├── __init__.py           # Package initialization
│   ├── main.py               # FastAPI application, routing, and WebSocket hubs
│   ├── emotion_engine.py     # DSP vocal biomarker extraction & ONNX acoustic models
│   ├── triage_agent.py       # PII redaction, cyber threat scoring, BYOK LLM & 1930 tickets
│   └── mock_generator.py     # Synthetic scenarios & demo call generation
├── samples/                  # Pre-recorded wav files for offline tests
│   ├── angry_caller.wav
│   ├── nervous_caller.wav
│   └── panic_victim.wav
├── tests/                    # Integration & smoke test suite
│   └── test_smoke.py         # End-to-end API, WebSocket, and DSP tests
├── pyproject.toml            # Project specification & dependencies
├── README.md                 # Backend documentation
└── test_smoke.py             # Root test runner shim
```

---

## ⚡ Core Capabilities

1. **Acoustic Biomarker Extraction (`app/emotion_engine.py`)**:
   - **Fundamental Frequency (F0 / Pitch)**: Autocorrelation-based pitch tracking (range 60–450 Hz).
   - **Voice Jitter & Micro-Tremor %**: Cycle-to-cycle perturbation reflecting acute vocal cord distress.
   - **Speech Rate**: Syllables per second estimation via energy peak prominence.
   - **RMS Energy (dB)**: Perceived loudness and amplitude dynamics.
   - **Voice Activity Detection (VAD)**: Energy-threshold and Silero-ONNX speech ratio.

2. **Cybercrime Triage & Incident Intelligence (`app/triage_agent.py`)**:
   - **Regex PII Redaction**: Automatic masking of 10-digit mobile numbers, 12-digit Aadhaar, 4-6 digit OTPs, and bank account numbers.
   - **Hybrid Urgency Scoring**: Weighted fusion of 60% vocal distress (pitch + jitter + rate) and 40% threat lexicon matching ("digital arrest", "CBI", "FedEx", "APK", "AnyDesk", "OTP", "lien", etc.).
   - **Wispr Voice Co-Pilot**: Transcribes operator speech and auto-drafts National Cybercrime Reporting Portal (1930 NCRP) Rapid Freeze Tickets.
   - **Forensic Case Export**: Generates courtroom-grade Markdown dossiers with Section 65B Indian Evidence Act certificates and JSON telemetry.

3. **Hardware Auto-Detection (`/api/hardware-info`)**:
   - Inspects CPU cores, RAM, and GPU execution providers (CUDA, DirectML, CoreML).
   - Dynamically recommends execution tiers: `LOW_END` (Pure DSP), `MID_RANGE` (Quantized ONNX), or `HIGH_END` (Full Neural Pipeline).

4. **Zero-Cost BYOK + Full Offline Fallback**:
   - Accepts optional user-provided free API keys for **Groq**, **SiliconFlow**, or **OpenRouter**.
   - If no key is supplied or network is unavailable, automatically executes built-in deterministic rule sets and DSP heuristics without crashing.

---

## 📡 REST & WebSocket API Reference

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/health` | System health check and engine capability inventory |
| `GET` | `/api/hardware-info` | Host hardware profiling (CPU, RAM, GPU, Recommended Tier) |
| `GET` | `/api/mock-scenarios` | 4 Pre-computed realistic cybercrime scenarios |
| `GET` | `/api/sample-audio/{name}` | Streams sample WAV audio files (`panic_victim`, `angry_caller`, `nervous_caller`) |
| `POST` | `/api/analyze-audio` | Recorded call forensics: multipart WAV upload -> complete `TriagePayload` |
| `POST` | `/api/voice-copilot` | Wispr voice co-pilot note processing -> 1930 NCRP Freeze Ticket draft |
| `POST` | `/api/export-report` | Generates downloadable forensic case report (`.md` & `.json`) |
| `WS` | `/ws/live-call` | Real-time bi-directional streaming for live audio, mic analysis, and surge simulation |

---

## 🛠️ Setup & Running

### Requirements
- Python 3.12 or 3.13
- `uv` (recommended) or standard `pip`

### Install Dependencies
```powershell
cd backend
python -m pip install -e .
```

### Start the Server
```powershell
# Using uv (fastest)
uv run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload

# Using python uvicorn
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

### Run Tests
```powershell
# Run smoke tests via pytest
python -m pytest tests/

# Or run directly
python test_smoke.py
```
