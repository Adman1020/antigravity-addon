# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-07-30
### Added
- Added `tmux` to enable terminal session persistence across web UI navigation.
- Installed `xclip` to provide native copy/paste support inside the web terminal.
- Dynamically injected global Antigravity context rules via `rules.md` to inform the agent of its Home Assistant environment.

### Changed
- Replaced the local MCP proxy setup in favor of natively using the host's synced MCP tools.

## [1.0.0] - 2026-07-25
### Added
- Initial release of the Antigravity Home Assistant Add-on.
- Configured dynamic retrieval of the `SUPERVISOR_TOKEN` using `bashio` and `s6-overlay`.
