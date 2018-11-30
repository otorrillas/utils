const aliases = [
  'app',
  'analytics',
  'services',
  'store',
  'styles',
  'utils',
  'views',
  'configs'
];

const isAliases = value => aliases.indexOf(value) !== -1;

export default isAliases;
