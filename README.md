# Zero Lang Skill for Pi

A pi agent skill for experimenting with the [Zero](https://zerolang.ai/) programming language.

Use this skill when writing, testing, benchmarking, or evaluating Zero `.0` programs; wrapping Zero as an experimental native-tool language; upgrading the local Zero compiler; using Zero `std.http` / `std.json` / `std.fs`; or comparing Zero with Rust/Python for small agent-generated tools.

## Install

Clone into pi's global skills directory:

```bash
git clone git@github.com:siygle/pi-zero-lang-skill.git ~/.pi/agent/skills/zero-lang
```

Then restart pi or run `/reload`.

## Contents

- `SKILL.md` — skill instructions and local workflow
- `references/` — Zero language, stdlib, diagnostics, build, testing, and package references
- `scripts/update-zero.sh` — update `/tmp/zero-repo`, rebuild Zero, and copy compiler to `/tmp/zero-test/bin/zero`
- `scripts/zero-http-env.sh` — run Zero with Homebrew curl include/lib env for `std.http`

## Notes

Zero is pre-1 and intentionally unstable. This skill is meant for experiments and agent-generated native tool prototypes, not production systems.
