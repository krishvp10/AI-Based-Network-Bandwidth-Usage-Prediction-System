# NetPulse AI: Intelligent Network Monitoring & Bandwidth Forecasting

> **Academic Context:** B.Tech Computer Science & Engineering — Computer Networks Mini Project  
> **Application Name:** NetPulse AI  
> **Project Category:** Artificial Intelligence + Machine Learning + Computer Networks + Full-Stack Web Development  

---

## 🌟 Overview

**NetPulse AI** is an end-to-end network intelligence and bandwidth usage forecasting platform. It trains machine learning regression models on real-world historical telemetry from the **CESNET-TimeSeries24** research network, performs real-time host network interface monitoring using Python `psutil`, predicts upcoming bandwidth usage (Mbps), evaluates network capacity utilization, and generates multi-tier congestion warning advisories.

---

## 🚀 Key Capabilities

1. **Dual Operating Modes:**
   - **Mode A (Historical CESNET Mode):** Explores 40 weeks of real 10-minute network telemetry from the Czech National Education and Research Network (CESNET3), analyzing diurnal cycles, peak academic hours, and percentile distributions.
   - **Mode B (Live Monitoring Mode):** Discovers host network interfaces, samples transmitted and received byte counters via `psutil`, and calculates real-time download and upload throughput in Megabits per second (Mbps).

2. **Genuine Machine Learning Forecasting:**
   - Evaluates three distinct regression architectures: **Persistence Baseline**, **Random Forest Regressor**, and **Gradient Boosting Regressor**.
   - Chronological train/val/test splitting (70% Train, 15% Validation, 15% Holdout Test) ensuring **zero lookahead bias or future-data leakage**.
   - **Zero fabricated numbers:** All metrics are derived from actual model training and testing on unseen test partitions.

3. **Domain Compatibility & Transferable Shared Pipeline:**
   - Bridges the gap between rich enterprise flow telemetry (flows, ports, ASNs) and host-level byte counters by utilizing a strictly compatible shared feature space (`lag_1`, `lag_2`, `lag_3`, `rolling_mean_3`, `rolling_mean_6`, `rolling_std_3`, `hour_of_day`, `day_of_week`, `is_weekend`).
   - Smooth cold-start handling for real-time live monitoring.

4. **Network Utilization & Warning Engine:**
   - Configurable network capacity in Mbps.
   - Computes real-time and predicted utilization percentage:
     $$\text{Utilization (\%)} = \frac{\text{Throughput}}{\text{Configured Capacity}} \times 100$$
   - 4-tier alert threshold engine: **Normal** (&lt;70%), **Moderate** (70–85%), **High** (85–95%), and **Critical Saturation** (&gt;95%).

5. **Modern Professional Web Dashboard:**
   - Built with **React 19, TypeScript, Vite, Tailwind CSS, and Recharts**.
   - Deep navy background (`#070b14`), dark charcoal panels, electric blue and cyan glowing accents.
   - 6 functional pages: Overview Dashboard, Live Monitoring, Bandwidth Forecast, Traffic Analytics, Model Performance, and Settings.
   - **Academic Demo Replay Mode** for offline presentations and viva evaluations.

---

## 📊 Empirical Model Benchmark Results

Evaluation conducted strictly on the unseen test split (6,044 holdout intervals):

| Model Architecture | Test MAE (Mbps) | Test RMSE (Mbps) | Test sMAPE (%) | Relative Gain vs Baseline |
| :--- | :--- | :--- | :--- | :--- |
| **Persistence Baseline** ($\hat{y}_{t+1} = y_t$) | 36.53 Mbps | 49.90 Mbps | 32.18% | Benchmark Reference |
| **Random Forest Regressor** | 29.70 Mbps | 39.93 Mbps | 26.24% | **+20.0% RMSE reduction** |
| **Gradient Boosting Regressor (Selected)** | **29.61 Mbps** | **39.76 Mbps** | **26.16%** | **+20.3% RMSE reduction** |

---

## 📁 Project Directory Structure

```
NetPulse-AI/
├── backend/
│   ├── main.py                     # FastAPI application entrypoint & CORS
│   ├── requirements.txt            # Backend dependencies
│   ├── routes/
│   │   ├── monitoring.py           # Interface scan & live monitoring controls
│   │   ├── prediction.py           # Prediction & model metadata endpoints
│   │   ├── analytics.py            # Diurnal summary & historical points
│   │   └── settings.py             # Capacity & threshold configuration
│   ├── services/
│   │   ├── monitor_service.py      # Thread-safe psutil background sampler
│   │   ├── prediction_service.py   # Model inference & confidence intervals
│   │   ├── dataset_service.py      # CESNET dataset loader & demo replay
│   │   └── warning_service.py      # 4-tier utilization & alert logic
│   └── schemas/                    # Pydantic data validation schemas
├── frontend/
│   ├── package.json
│   ├── vite.config.ts
│   ├── tailwind.config.js
│   ├── index.html
│   └── src/
│       ├── components/             # Sidebar, Header, MetricCard, WarningBadge
│       ├── pages/                  # 6 full dashboard pages
│       ├── services/api.ts         # REST API communication client
│       ├── App.tsx                 # Root layout & real-time telemetry polling
│       └── main.tsx
├── src/
│   ├── download_dataset.py         # Official CESNET-TimeSeries24 downloader
│   ├── preprocessing.py            # Timestamp validation & missing data handling
│   ├── features.py                 # Lag, rolling, & calendar feature engineering
│   ├── train.py                    # Model training pipeline & serialization
│   └── evaluate.py                 # Academic evaluation figures generator
├── models/
│   ├── bandwidth_model.joblib      # Serialized Gradient Boosting model
│   ├── local_model.joblib          # Serialized compatible local model
│   └── model_metadata.json         # Provenance, hyperparameters & test metrics
├── data/
│   ├── README.md                   # Dataset schema documentation
│   ├── cesnet_institution_0_10min.csv  # 40,298 historical observations
│   └── sample_cesnet_institution.csv    # 2,016 observation slice for testing
├── reports/
│   ├── figures/                    # High-res academic visualization charts
│   └── results/                    # Test metrics JSON & predictions CSV
├── docs/
│   ├── architecture.md             # System design & API specifications
│   ├── methodology.md              # Mathematical formulations & ML split
│   └── workflow.md                 # Operating modes & warning engine flow
├── requirements.txt
└── README.md
```

---

## 🛠️ Quickstart Installation & Execution

### 1. Prerequisites
- Python 3.10+
- Node.js (v18+) & npm

### 2. Backend Setup & Startup
```bash
# Navigate to the backend directory
cd NetPulse-AI/backend

# Install backend dependencies
pip install -r requirements.txt

# Start the FastAPI server
uvicorn main:app --host 127.0.0.1 --port 8000 --reload
```
The backend API documentation will be available at: `http://127.0.0.1:8000/docs`

### 3. Frontend Setup & Startup
```bash
# In a new terminal, navigate to the frontend directory
cd NetPulse-AI/frontend

# Install frontend dependencies
npm install

# Launch the Vite development server
npm run dev
```
Open your browser at: `http://localhost:5173`

---

## 📚 Dataset Provenance & Academic Citation

- **Dataset:** CESNET-TimeSeries24: Time Series Dataset for Network Traffic Anomaly Detection and Forecasting
- **Paper:** Koumar, J., Hynek, K., Čejka, T. & Šiška, P. *Sci Data* 12, 169 (2025). [https://doi.org/10.1038/s41597-025-04506-3](https://doi.org/10.1038/s41597-025-04506-3)
- **Zenodo Repository:** DOI [10.5281/zenodo.13382427](https://doi.org/10.5281/zenodo.13382427)
- **Toolkit:** [`cesnet-tszoo`](https://github.com/CESNET/cesnet-tszoo)
