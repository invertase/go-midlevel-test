# Go Developer Technical Test

## Overview

Export all documents from a local API to a JSON file.

**Time estimate:** ~2 hours

We respect your time — please don't feel obligated to go beyond this.

## Setup

Start the API server:
```bash
# Mac (Apple Silicon)
./bin/api-darwin-arm64

# Mac (Intel)
./bin/api-darwin-amd64

# Linux
./bin/api-linux-amd64

# Windows
./bin/api-windows-amd64.exe
```

The server runs on `http://localhost:8080`.

Alternatively, run with Docker:
```bash
docker build -t api-server .
docker run -p 8080:8080 api-server
```

> **Note:** On macOS, you may need to allow the binary to run via System Settings > Privacy & Security, or by running:
> ```bash
> xattr -d com.apple.quarantine ./bin/api-darwin-*
> ```

If you have trouble running the binaries, please get in touch.

## API

The API source code is intentionally not provided. Part of this exercise is discovering how the API behaves and handling its edge cases.

### `GET /health`

Returns `{"status": "ok"}` when the server is running.

### `GET /documents`

Returns a paginated list of documents.

```json
{
  "documents": [
    { "id": "doc_001", "name": "...", "email": "...", "company": "...", "created_at": "..." }
  ],
  "total": 5000,
  "offset": 0,
  "limit": 50
}
```

- `?offset=N` — skip the first N documents (default: 0)
- `?limit=N` — number of documents per page (default: 50, max: 50)
- The server is rate limited

## Requirements

Write a Go program that:

1. Fetches all documents from `GET /documents`
2. Writes them to `output.json` as a JSON array
3. Completes as fast as possible without failing

Put your code in the `submission/` directory.

## Submission

Include a README in your submission with:
- Roughly how long you spent
- Any design decisions you made and why
- Anything you'd improve with more time

## Evaluation Criteria

- Correctness
- Code quality
- Test quality

We value simple, working code over clever abstractions. We're not looking for a client library or SDK — a single well-structured program is fine.
