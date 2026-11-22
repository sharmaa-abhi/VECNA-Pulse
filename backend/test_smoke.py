"""
VECNA-Pulse Smoke Test Runner (Backward-Compatible Shim).
Points to tests/test_smoke.py
"""
import os
import sys

BACKEND_ROOT = os.path.dirname(os.path.abspath(__file__))
if BACKEND_ROOT not in sys.path:
    sys.path.insert(0, BACKEND_ROOT)

from tests.test_smoke import test_vecna_pulse_phase2

if __name__ == "__main__":
    test_vecna_pulse_phase2()
