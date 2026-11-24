# tdlib-dc

TDLib **1.8.69** (commit `9d92b49bc5d0d2e29fe518239af647a88f8680e6`) with a one-line patch:
the initial main DC is read from the environment variable `TD_MAIN_DC` (1-5).
If the variable is not set (or invalid) the behaviour is identical to stock TDLib (DC1).

- `td-main-dc.patch` – the patch for `td/telegram/net/NetQueryDispatcher.h`
- `build.sh` – clones TDLib at the exact commit, applies the patch, builds `libtdjson.so`
- Prebuilt `libtdjson.so` is attached to the GitHub Release.
