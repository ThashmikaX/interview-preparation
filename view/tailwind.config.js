/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html", // Add your HTML or JS/TS files here
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        background: "#0d1117",
        card: "#161b22",
        text: "#c9d1d9",
        folder: "#8b949e",
        file: "#8b949e",
      },
    },
  },
  plugins: [],
};
