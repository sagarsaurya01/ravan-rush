# Ravan Rush 🏹🪔

A private family Dussehra game. Strike Ravan's heads, climb your family's
leaderboard, and crown a Family Champion. No email, no password — share a link,
pick a nickname, play.

## How it works

- **Create Family Challenge** → enter a family name (e.g. *Laddha Family*). It
  makes a family code (`LADDHA26`) and a private shareable link.
- **Share on WhatsApp** → anyone who opens the link joins that family. They just
  enter a nickname.
- **Play unlimited games.** Each player's rank is their **best score ever** — a
  lower score never drops your rank. Beat your best to move up; take #1 to become
  the **Family Champion** (crown + confetti).
- Tie-break: higher accuracy, then faster finish time.

## Run it

It's a single file. Open `index.html` in a browser, or host it anywhere static
(GitHub Pages, Netlify, your Hostinger space).

**Out of the box it runs in single-device mode** (scores saved on that one phone),
so you can play and demo immediately.

## Go live across the whole family (Supabase)

For everyone's phones to share one live leaderboard, connect Supabase (free tier
is plenty):

1. Create a project at supabase.com.
2. In the SQL editor, run [`schema.sql`](schema.sql).
3. In **Project Settings → API**, copy the **Project URL** and the **anon public** key.
4. Paste both into the `CONFIG` block at the top of the `<script>` in `index.html`:
   ```js
   const CONFIG = {
     SUPABASE_URL: "https://xxxx.supabase.co",
     SUPABASE_ANON_KEY: "eyJ...",
   };
   ```
5. Re-host the file. Done — the same link now syncs every family member.

The app code doesn't change between modes: only that `CONFIG` block and the
`Backend` adapter differ. localStorage is the fallback; Supabase is the live mode.

## The game

- Destroy **21 of Ravan's heads** as fast as you can (or survive the 60s cap).
- Consecutive hits build a **combo multiplier**; a miss or an empty tap resets it.
- Score rewards speed and combo. Stats tracked: best score, best combo, best
  finish time, accuracy, games played.

Built with the clone-an-app method; shared as an artifact + this repo.
