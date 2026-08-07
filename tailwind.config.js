/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#f0f4ff',
          100: '#e0e8ff',
          200: '#c7d7fe',
          500: '#4f6ef7',
          600: '#3b55e0',
          700: '#2d42c8',
        },
      },
    },
  },
  plugins: [],
};
