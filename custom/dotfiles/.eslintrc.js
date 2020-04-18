// NOTE: Because common sense is in short supply, 
// and now that ESLint v6 can't resolve external (globally installed) configs to extend 
// (but it can be persuaded to load plugins; not configs), 
// the following code is necessary for my setup.
// Credit: https://github.com/eslint/eslint/issues/11914#issuecomment-569108633
const Module = require('module')
const ModuleFindPath = Module._findPath
Module._findPath = (request, paths, isMain) => {
  const r = ModuleFindPath(request, paths, isMain)
  if (!r) {
    return require.resolve(`/usr/lib/node_modules/${request}`)
  }
  return r
}

module.exports = {
  parser: 'babel-eslint',
  extends: 'eslint-config-standard',
  env: {
    browser: true,
  },
  plugins: [
    'html',
  ],
  rules: {
    'comma-dangle': ['error', 'only-multiline'],
    'no-unused-vars': 'warn',
    'no-labels': 'off',
  },
}
