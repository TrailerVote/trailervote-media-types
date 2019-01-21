// tslint:disable:max-classes-per-file
function escape(regex: string) {
  return regex.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&')
}

class UnexpectedFormatVariable extends Error {
  public variables: Readonly<string[]>
  public actual: Readonly<string>
  constructor({ variables, actual }: { variables: Readonly<string[]>, actual: Readonly<string> }) {
    super(`'Expected a formatted url only containing ${variables}, instead got ${actual}'`)

    this.variables = variables
    this.actual = actual
  }
}

export class FormattedUrl {
  private variables: string[]
  private test: RegExp

  constructor(...variables: string[]) {
    this.variables = variables.map((variable) => `{${variable}}`)
    const variableOptions = this.variables.map((variable) => escape(variable))
    const sectionsFirst = `(?>${variableOptions.concat(['[^\s\/$.?#\{\}]']).join('|')})`
    const sectionsNotFirst = `(?>${variableOptions.concat(['[^\\s\\{\\}]']).join('|')})`

    this.test = new RegExp(`^https?:\/\/${sectionsFirst}${sectionsNotFirst}*$/`)
  }

  public equals(other: string) {
    if (this.test.test(other)) {
      return true
    }

    throw new UnexpectedFormatVariable({ variables: this.variables, actual: other })
  }
}
