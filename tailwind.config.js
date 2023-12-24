const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')
const execSync = require('child_process').execSync;
const gemPath = execSync('bundle show activeadmin', { encoding: 'utf-8' }).trim();

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim, arb, rb}',
    './node_modules/flowbite/**/*.js',
    `${gemPath}/plugin.js`,
    `${gemPath}/app/views/**/*.{arb,erb,html,rb}`,
    `${gemPath}/lib/active_admin/**/*.rb`,
    './app/admin/**/*.{arb,erb,html,rb}',
    './app/assets/stylesheets/**/*.css'
  ],

  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      slate: colors.slate,
      gray: colors.gray,
      zinc: colors.zinc,
      neutral: colors.neutral,
      stone: colors.stone,
      red: colors.red,
      orange: colors.orange,
      amber: colors.amber,
      yellow: colors.yellow,
      lime: colors.lime,
      green: colors.green,
      emerald: colors.emerald,
      teal: colors.teal,
      cyan: colors.cyan,
      sky: colors.sky,
      blue: colors.blue,
      indigo: colors.indigo,
      violet: colors.violet,
      purple: colors.purple,
      fuchsia: colors.fuchsia,
      pink: colors.pink,
      rose: colors.rose,

      'grassy-green': '#327138',
      'pale-yellow': '#E6E278',
      'pale-green': 'rgba(108, 184, 115, 0.80)'
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  darkMode: "class",
  plugins: [
    require('@tailwindcss/forms'),
    require(`${gemPath}/plugin`)
  ]
}
