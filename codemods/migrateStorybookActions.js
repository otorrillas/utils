const isStorybookReact = p => p.value.source.value === '@storybook/react'
const isActionImport = s => s.imported.name === 'action'

const insertActionAddonImport = p =>
  p.get().insertAfter("import { action } from '@storybook/addon-actions'")

const removeActionSpecifier = (j, path) => {
  const newSpecifiers = path.value.specifiers.filter(s => !isActionImport(s))

  if (newSpecifiers.length === 0) {
    j(path).remove()
  } else {
    path.value.specifiers = newSpecifiers
  }
}

export default function transformer (file, api) {
  const j = api.jscodeshift

  return j(file.source)
    .find(j.ImportDeclaration)
    .filter(
      path =>
        isStorybookReact(path) && path.value.specifiers.find(isActionImport)
    )
    .forEach(path => {
      insertActionAddonImport(path)
      removeActionSpecifier(j, path)
    })
    .toSource()
}
