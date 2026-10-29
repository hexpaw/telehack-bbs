# telehack-bbs

`smogbbs.bas` — a bulletin board for [Telehack](https://telehack.com), written
in th_basic.

Telehack is a simulated 1980s internet; th_basic is its dialect of BASIC, with
host-provided functions (`TH_SED$`, `TH_SPRINTF$`, `TH_GMTIME`, `USER$`, ...)
layered on the usual line-numbered syntax. The program is a single file — no
build step, nothing to compile.

## Running it

Upload `smogbbs.bas` to Telehack and run it there:

```
pppd smogbbs.bas
```

(The file's own header comment says `pppd petrichor.bas`; it was renamed after
the fact. Either filename works as long as the command matches.)

## What it is

A working BBS — bulletins, file areas, who-called — wrapped around a piece of
fiction. The board is called *PETRICHOR*, sysop *smog*, "est 1991". Its file
areas are COBOL copybooks and EBCDIC records from a system that did things it
shouldn't have: `ERASURE-REC`, `OBSERV-LOG`, `DONOR-HARVEST`, `FACILITY-CENSUS`.

Dark subject matter, deliberately. It's a story told through a terminal, not a
utility.

Two things are worth knowing before reading the source:

- **The RECOVERED area** dumps raw EBCDIC records from `harvest.dat`,
  `erasure.dat` and `observlog.dat` as hex. Those data files are BBS-side and
  aren't in this repo, so the section renders empty unless you supply your own.
  The companion tool for reading such records lives in
  [hextoebcdic](https://github.com/hexpaw/hextoebcdic).
- **Line bleed** — after several visits the board occasionally interrupts itself
  at 03:15 board time. That's intentional, and it's the one part of the program
  that depends on when you happen to connect.

## Structure

| Lines | Section |
| --- | --- |
| 10–80 | constants — ANSI colours, palette, spacing |
| 90–140 | command loop, key dispatch |
| 1000–1180 | welcome screen |
| 1300–1360 | main menu |
| 2000–2120 | bulletins |
| 2200–2980 | copybooks (COBOL layouts) |
| 3500–5100 | comments, who-called, goodbye, persistence |
| 6000–6340 | file areas |
| 6400–6524 | RECOVERED — hex dumps of EBCDIC records |
| 7000–7210 | line bleed |
| 9000–9080 | logo |

## License

MIT — see [LICENSE](LICENSE).
