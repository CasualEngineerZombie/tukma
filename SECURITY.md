# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.x     | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability within Tukma, please send an email to **hello@rianbarriga.com**. All security vulnerabilities will be promptly addressed.

**Please do not report security vulnerabilities through public GitHub issues.**

### What to include

When reporting a vulnerability, please include:

- A description of the vulnerability
- Steps to reproduce the issue
- Potential impact
- Any suggested fixes (if applicable)

### What to expect

- Acknowledgement of your report within 48 hours
- An assessment of the vulnerability within 7 days
- A fix or mitigation plan communicated to you before public disclosure

## Security Best Practices

When using Tukma in production:

- Keep your Go version up to date
- Regularly update dependencies (`go get -u ./... && go mod tidy`)
- Use environment variables or a secrets manager for sensitive configuration
- Restrict network access to Tukma services where possible
- Monitor logs for unexpected behavior

## Disclosure Policy

We follow coordinated disclosure. Once a fix is available, we will:

1. Release a patched version
2. Publish a security advisory on GitHub
3. Credit the reporter (unless they prefer anonymity)
