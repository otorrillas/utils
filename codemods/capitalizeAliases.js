import isAliases from './aliases';

function capitalizeFirstLetter(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

export default function transformer(file, api) {
  const j = api.jscodeshift;

  return j(file.source)
    .find(j.ImportDeclaration)
    .forEach(node => {
      const sourcePath = node.value.source.value;
      const splittedRes = sourcePath.split('/');
      const firstWord = splittedRes[0];

      if (isAliases(firstWord) && splittedRes.length > 1) {
        const resultPath = capitalizeFirstLetter(sourcePath);
        node.value.source.value = resultPath;
      }
    })

    .toSource({ quote: 'single' });
}
