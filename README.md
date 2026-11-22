# VECNA-Pulse

VECNA-Pulse is a browser-based incident command workstation for reviewing and prioritizing cybercrime calls. It combines vocal biomarker analysis, speech transcription, threat-keyword detection, and decision-support tools in a single interface.

The project helps operators or reviewers quickly inspect a call, identify likely distress or urgency, understand relevant redacted entities, and prepare an incident note or case report. It is an assistive prototype; its emotion and urgency results are indicative and are not proof of a caller's intent or guilt.

Repository: https://github.com/sharmaa-abhi/VECNA-Pulse

## Key Features

- **Recorded audio analysis:** Upload a WAV, MP3, or OGG file and send it to the FastAPI backend for acoustic and triage analysis.
- **Offline client fallback:** If the backend is unavailable, the frontend performs local DSP-based analysis and displays a triage payload.
- **Live-call workspace:** Uses a WebSocket connection for live call frames, scenario simulation, and multi-call surge demonstrations.
- **Acoustic biomarkers:** Reports pitch, jitter/tremor, speech rate, RMS energy, voice activity, and vocal anomaly indicators.
- **Threat and entity detection:** Detects cybercrime terms and masks phone numbers, Aadhaar numbers, OTPs, and bank account numbers.
- **Priority call queue:** Sorts active calls by urgency score and provides CRITICAL, HIGH, and MEDIUM labels.
- **Scenario demo mode:** Includes preconfigured digital arrest, UPI fraud, sextortion, and informant scenarios.
- **Voice co-pilot:** Creates a 1930 NCRP freeze-ticket draft and an FIR-style incident summary from an operator note.
- **Case export:** Generates a Markdown report and JSON telemetry packet, plus a browser-generated SHA-256 evidence certificate.
- **Provider settings:** Supports optional user-supplied Groq, OpenRouter, or SiliconFlow keys. The project also works without API keys in offline mode.
- **Local case storage:** Stores saved cases in the browser using IndexedDB, with localStorage and memory fallbacks.
- **Hardware adaptation:** Reports host CPU, memory, GPU provider, and a recommended model tier.

## Technology Stack

### Frontend

- **React 18** - Builds the workstation interface.
- **Vite** - Provides the development server and production build.
- **Tailwind CSS** - Supplies utility-based styling.
- **Lucide React** - Provides interface icons.
- **Web Audio and Web Speech APIs** - Support browser audio handling and local interfaces.
- **Hugging Face Transformers** - Included for browser-side model support.
- **IndexedDB, localStorage, and cookies** - Store cases, settings, and model metadata in the browser.

### Backend

- **Python 3.12 or newer** - Runs the backend application.
- **FastAPI** - Provides REST endpoints and WebSocket support.
- **Uvicorn** - Runs the ASGI server locally.
- **NumPy, SciPy, and librosa** - Process and analyze audio.
- **SoundFile** - Reads supported audio files.
- **Sherpa-ONNX** - Supports optional ONNX speech models when available.
- **Pydantic** - Defines API request and response data structures.
- **HTTPX** - Connects to supported cloud providers.

### Database and Persistence

VECNA-Pulse does not currently use a traditional server-side database. Saved case records and model metadata are stored on the user's device in browser **IndexedDB**. The application has localStorage and in-memory fallbacks for restricted or unavailable browser storage.

### External APIs and Providers

- **Groq** - Optional transcription and language-processing provider.
- **OpenRouter** - Optional language-model provider.
- **SiliconFlow** - Optional transcription and language-model provider.
- The application also has a deterministic offline DSP and rule-based fallback.

No API key is required for local demo mode.

## Installation and Setup

### Requirements

- Git
- Node.js and npm
- Python 3.12 or newer
- Windows PowerShell is optional for the included launcher scripts
- `uv` is recommended for Python dependency management, but pip is also supported

### 1. Clone the Repository

```bash
git clone https://github.com/sharmaa-abhi/VECNA-Pulse.git
cd VECNA-Pulse
```

### 2. Install Frontend Dependencies

```bash
cd frontend
npm install
cd ..
```

### 3. Install Backend Dependencies

Using uv:

```bash
cd backend
uv sync --active --no-dev --frozen --no-editable
cd ..
```

Using pip:

```bash
cd backend
python -m pip install -e .
cd ..
```

### 4. Configure Environment Variables

Environment variables are optional. The application can run fully offline.

Create `frontend/.env` if you want a default provider or keys:

```env
VITE_DEFAULT_PROVIDER=offline
# VITE_SILICONFLOW_API_KEY=your_key_here
# VITE_GROQ_API_KEY=your_key_here
# VITE_OPENROUTER_API_KEY=your_key_here
```

Supported provider values include `offline`, `groq`, `openrouter`, and `siliconflow`.

You can instead open the frontend Settings dialog and enter an API key. Keys are stored in browser localStorage for this project. Do not commit real keys to `.env`, source files, or Git history.

### 5. Start Development

Start the backend:

```bash
cd backend
uv run uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

For a pip-based setup:

```bash
cd backend
python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```

In a second terminal, start the frontend:

```bash
cd frontend
npm run dev
```

Open:

- Frontend: http://localhost:3000
- Backend health check: http://127.0.0.1:8000/api/health

On Windows, the repository root launcher can start both processes:

```powershell
.\run.ps1
```

Or:

```cmd
start.bat
```

### 6. Build for Production

Build the frontend:

```bash
npm run build
```

The frontend build is written to `frontend/dist`.

Preview the build locally:

```bash
cd frontend
npm run preview
```

## Running Tests

From the repository root:

```bash
npm test
```

This runs the frontend test scripts and the backend pytest suite.

Run only the frontend tests:

```bash
npm run test:frontend
```

Run only the backend tests:

```bash
npm run test:backend
```

Backend tests directly:

```bash
cd backend
python -m pytest tests
```

## Project Structure

```text
VECNA-Pulse/
├── backend/
│   ├── app/
│   │   ├── main.py           # FastAPI REST and WebSocket routes
│   │   ├── emotion_engine.py # Audio DSP and biomarker analysis
│   │   ├── triage_agent.py   # PII masking, threat scoring, provider calls
│   │   └── mock_generator.py # Demo call payloads and sample data
│   ├── samples/              # Test WAV files
│   ├── tests/                # Backend integration smoke test
│   ├── pyproject.toml        # Python dependencies and build settings
│   └── uv.lock               # Locked Python dependency versions
├── frontend/
│   ├── public/               # Static public assets
│   ├── src/
│   │   ├── components/       # Dashboard and modal React components
│   │   ├── services/         # Audio, API, hardware, cloud, and storage logic
│   │   ├── App.jsx           # Main application state and workflows
│   │   └── mockData.js       # Demo call data
│   ├── tests/                # Frontend Node test scripts
│   ├── vite.config.js        # Vite and development proxy configuration
│   └── package.json          # Frontend dependencies and scripts
├── docs/
│   └── superpowers/          # Design specifications and implementation plans
├── API_CONTRACT.md           # REST and WebSocket API contract
├── run.ps1                   # Windows PowerShell launcher
├── start.bat                 # Windows CMD launcher
└── package.json              # Root-level test and build scripts
```

## How It Works

1. The frontend opens the investigator dashboard and checks whether the backend is available.
2. The user enables demo mode, starts a live simulation, or uploads call audio.
3. In the backend flow, FastAPI receives the audio and optional transcript hint.
4. The backend processes the audio with DSP and extracts pitch, tremor, cadence, loudness, and voice activity.
5. The triage module masks detected PII, identifies cybercrime keywords, and calculates an urgency score.
6. If the user selected Groq, OpenRouter, or SiliconFlow and supplied a key, the frontend/backend can use that provider. Otherwise, local rules and heuristics provide a fallback.
7. The result is displayed in the call queue and analysis panels with emotions, timeline segments, biomarkers, and recommended actions.
8. The operator can enter a dispatch note and generate a 1930 NCRP freeze-ticket draft.
9. The user can save the call in browser storage or export a Markdown/JSON case dossier.

In demo mode, the application uses bundled scenario payloads and does not need the backend for the displayed dashboard.

## Screenshots and Demo

No public live demo URL is configured in the repository, so one is not listed here.

Add screenshots after they are captured from the running application:

### Main Dashboard

![VECNA-Pulse dashboard screenshot](docs/screenshots/dashboard.png)

### Recorded Audio Analysis

![Recorded audio analysis screenshot](docs/screenshots/audio-analysis.png)

### Case Export and Evidence Report

![Case export screenshot](docs/screenshots/case-export.png)

To create these placeholders, save PNG images under `docs/screenshots/` and keep the filenames above.

## Show Your GitHub – Off Campus Verification

**Off Campus Code:** `YJRZDD`

The project must remain public for the verification team to review it. Add this code to the repository README or GitHub About section and provide the repository link for verification:

https://github.com/sharmaa-abhi/VECNA-Pulse

## GitHub Repository About Section

Suggested repository description:

> React and FastAPI cybercrime call triage workstation with audio biomarker analysis, offline fallback, WebSocket updates, and browser-based case reporting.

## API Summary

The backend exposes:

- `GET /api/health`
- `GET /api/hardware-info`
- `GET /api/mock-scenarios`
- `GET /api/sample-audio/{scenario}`
- `POST /api/analyze-audio`
- `POST /api/voice-copilot`
- `POST /api/export-report`
- `WebSocket /ws/live-call`

See [API_CONTRACT.md](API_CONTRACT.md) for the payload contract and data fields.

## Responsible Use

Vocal emotion, urgency, and acoustic anomaly results are indicative triage signals. They must not be used as definitive evidence of a person's intent, honesty, innocence, or guilt. Human review and applicable legal procedures remain necessary.
