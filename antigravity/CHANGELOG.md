# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0](https://github.com/Adman1020/antigravity-addon/compare/v1.0.1...v1.1.0) (2026-07-30)


### Features

* Add Antigravity global rules to provide Home Assistant context ([c0d4670](https://github.com/Adman1020/antigravity-addon/commit/c0d4670b8123afa1569a305b01fe2d5cbf1ad795))
* Add tmux for session persistence across navigation ([ea63a97](https://github.com/Adman1020/antigravity-addon/commit/ea63a97e445dac7de6dc782649236db57947e315))
* Add xclip for clipboard support and document /config mount in rules ([bbcf8db](https://github.com/Adman1020/antigravity-addon/commit/bbcf8db962808c906492413b8b05e64381354348))
* Implement Antigravity CLI Add-on ([a0d95cd](https://github.com/Adman1020/antigravity-addon/commit/a0d95cdf7bc9f99d6f62e217dadc0e51711a7998))
* Session persistence, clipboard support, and HA context rules ([0ee33eb](https://github.com/Adman1020/antigravity-addon/commit/0ee33ebccdf3607e6df5a37c63f3544b7f425650))


### Bug Fixes

* Repository structure for Home Assistant Add-on compatibility ([148e917](https://github.com/Adman1020/antigravity-addon/commit/148e91779fe2626378c57c6c703f9a977d6b8c2c))

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
