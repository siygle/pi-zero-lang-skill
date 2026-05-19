---
name: zero-lang
description: Zero language development helper. Use when writing, testing, benchmarking, or evaluating Zero .0 programs; wrapping Zero as an experimental native-tool language; upgrading the local Zero compiler; using Zero std.http/std.json/std.fs; or comparing Zero with Rust/Python for small agent-generated tools.
---

# Zero Language Skill

Zero is an experimental agent-first native programming language. Use this skill when the user asks to write or test `.0` files, upgrade Zero, benchmark Zero vs Python/Rust, or prototype future pi tools in Zero.

## Local Setup

Current working compiler used by our experiments:

```bash
/tmp/zero-test/bin/zero version
```

Source checkout used for upgrades:

```bash
cd /tmp/zero-repo
rtk git pull --ff-only
make -C native/zero-c
cp /tmp/zero-repo/.zero/bin/zero /tmp/zero-test/bin/zero
/tmp/zero-test/bin/zero version
```

Prefer `/tmp/zero-test/bin/zero` in scripts for reproducibility. Inside `/tmp/zero-repo`, `bin/zero` also points to the repo-built compiler.

## Important References

Load these reference files on demand, relative to this skill directory:

- `references/zero-agent.md` — agent edit/check workflow
- `references/zero-language.md` — syntax and language rules
- `references/zero-stdlib.md` — std.mem/std.http/std.json/std.fs/std.args patterns
- `references/zero-diagnostics.md` — structured diagnostics and repair loop
- `references/zero-builds.md` — build targets and native linking
- `references/zero-testing.md` — test patterns
- `references/zero-packages.md` — package layout

## Agent Workflow

1. Read relevant references before inventing syntax.
2. Check compiler version:

```bash
/tmp/zero-test/bin/zero version
```

3. For any `.0` file, run structured checks first:

```bash
/tmp/zero-test/bin/zero check --json path/to/file.0
```

4. Build/run with the narrowest command:

```bash
/tmp/zero-test/bin/zero run path/to/file.0
/tmp/zero-test/bin/zero build --emit exe --target linux-x64 path/to/file.0 --out .zero/out/tool
```

5. If diagnostics appear, inspect them instead of guessing:

```bash
/tmp/zero-test/bin/zero explain <CODE>
/tmp/zero-test/bin/zero fix --plan --json path/to/file.0
```

## HTTP / libcurl Notes

Zero 0.1.3 supports hosted HTTP via `std.http` on `linux-x64`, linked through libcurl. On this machine, system libcurl headers are missing, but Homebrew curl is installed. When building HTTP programs, set:

```bash
export CPATH="$(brew --prefix curl)/include:${CPATH:-}"
export LIBRARY_PATH="$(brew --prefix curl)/lib:${LIBRARY_PATH:-}"
export LD_LIBRARY_PATH="$(brew --prefix curl)/lib:${LD_LIBRARY_PATH:-}"
```

Use `linux-x64` for hosted HTTP. `linux-musl-x64` currently rejects hosted network APIs.

## Current Prototype Location

The first stock-data experiment lives at:

```bash
/home/ferrari/vibe-coding/stock-data-lib/zero-bench/
```

Useful files:

- `stock_calc.0` — pure calculation benchmark
- `stock_http.0` — Zero 0.1.3 `std.http` Yahoo Finance JSON validation
- `bench.py` — Zero vs Python pure calculation benchmark
- `bench_http.py` — Zero std.http vs Python urllib benchmark

## When to Recommend Zero vs Rust

- Use Rust for production, mature ecosystem, robust parsing, libraries, and long-term maintainability today.
- Use Zero for experimental agent-generated native tools, structured diagnostics, capability-oriented stdlib, and future pi tool prototypes.
- Prefer Python for high-level data integration while Zero JSON APIs remain low-level.
