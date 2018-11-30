const isRelative = path => path.startsWith('../');

const aliases = [
  'app',
  'analytics',
  'services',
  'store',
  'styles',
  'utils',
  'views'
];
const isAliases = value => aliases.indexOf(value) !== -1;

const removeRelatives = (str, pattern = '..') => {
  const parts = str.split('/');
  let result = [];

  for (const part of parts) {
    if (part !== pattern) {
      result.push(part);
    }
  }

  result = result.join('/').toString();
  return result;
};

export default function transformer(file, api) {
  const j = api.jscodeshift;

  return j(file.source)
    .find(j.ImportDeclaration)
    .forEach(node => {
      const sourcePath = node.value.source.value;

      if (isRelative(sourcePath)) {
        const resultPath = removeRelatives(sourcePath);
        const splittedRes = resultPath.split('/');
        const firstWord = splittedRes[0];

        if (isAliases(firstWord) && splittedRes.length > 1) {
          node.value.source.value = resultPath;
        }
      }
    })

    .toSource({ quote: 'single' });
}
