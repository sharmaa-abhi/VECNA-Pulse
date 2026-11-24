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
