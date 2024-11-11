# Install system dependencies first
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    cmake \
    libmupdf-dev \
    swig \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Then create venv and install requirements
RUN --mount=type=cache,id=s/211dbc54-74f6-4383-86e8-5f16ae4d6a79-/root/cache/pip,target=/root/.cache/pip \
    python -m venv --copies /opt/venv \
    && . /opt/venv/bin/activate \
    && pip install --upgrade pip setuptools wheel \
    && pip install -r requirements.txt
