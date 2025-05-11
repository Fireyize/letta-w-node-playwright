# Letta with Node.js and Playwright

A simple setup of Letta with Node.js and Playwright support for browser automation.

## Quick Start

1. Clone and start:

```bash
git clone https://github.com/ahmedrowaihi/letta-w-node-playwright.git
cd letta-w-node-playwright
docker compose up -d
```

2. (Optional) Create `.env` file:

```bash
# Database
LETTA_PG_URI=postgresql://letta:letta@pgvector_db:5432/letta

# API Keys (add as needed)
OPENAI_API_KEY=your_key_here
GROQ_API_KEY=your_key_here
ANTHROPIC_API_KEY=your_key_here
# ... other API keys
```

## Features

- PostgreSQL with pgvector
- Node.js 18.x
- Playwright with Firefox
- Optional .env configuration
- Health checks

## Database

The setup uses PostgreSQL with pgvector extension for vector storage. Default configuration:

- Database: `letta`
- User: `letta`
- Password: `letta`
- Host: `pgvector_db`
- Port: `5432`

The database is automatically initialized with the required schema and extensions.

## Documentation

- [Letta AI Documentation](https://docs.letta.com)
- [pgvector Documentation](https://github.com/pgvector/pgvector)

## Environment Variables

| Variable            | Description               | Default                                           |
| ------------------- | ------------------------- | ------------------------------------------------- |
| `LETTA_PG_URI`      | PostgreSQL connection URI | `postgresql://letta:letta@pgvector_db:5432/letta` |
| `LETTA_DEBUG`       | Enable debug mode         | `True`                                            |
| `OPENAI_API_KEY`    | OpenAI API key            | -                                                 |
| `GROQ_API_KEY`      | Groq API key              | -                                                 |
| `ANTHROPIC_API_KEY` | Anthropic API key         | -                                                 |
| `OLLAMA_BASE_URL`   | Ollama base URL           | -                                                 |
| `AZURE_API_KEY`     | Azure API key             | -                                                 |
| `AZURE_BASE_URL`    | Azure base URL            | -                                                 |
| `AZURE_API_VERSION` | Azure API version         | -                                                 |
| `GEMINI_API_KEY`    | Gemini API key            | -                                                 |
| `VLLM_API_BASE`     | VLLM API base URL         | -                                                 |
| `OPENLLM_AUTH_TYPE` | OpenLLM auth type         | -                                                 |
| `OPENLLM_API_KEY`   | OpenLLM API key           | -                                                 |

## Endpoints

- Letta Server: http://localhost:8083
- Database: localhost:5432

## Troubleshooting

```bash
# Check logs
docker compose logs -f

# Rebuild if needed
docker compose up -d --build
```

## License

MIT
