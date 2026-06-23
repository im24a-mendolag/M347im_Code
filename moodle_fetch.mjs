const [,, session] = process.argv;

if (!session) {
  console.error("Usage: node moodle_fetch.mjs <MoodleSession-value>");
  process.exit(1);
}

const url = "https://moodle.bzz.ch/course/section.php?id=8464";

const res = await fetch(url, {
  headers: { Cookie: `MoodleSession=${session}` },
});

const html = await res.text();

const text = html
  .replace(/<script[\s\S]*?<\/script>/gi, "")
  .replace(/<style[\s\S]*?<\/style>/gi, "")
  .replace(/<[^>]+>/g, " ")
  .replace(/&nbsp;/g, " ")
  .replace(/&amp;/g, "&")
  .replace(/&lt;/g, "<")
  .replace(/&gt;/g, ">")
  .replace(/&quot;/g, '"')
  .replace(/\s{2,}/g, "\n")
  .trim();

console.log(text);
