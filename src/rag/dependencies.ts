import path from 'path'
import { readFileSync } from 'fs-extra'
import { RunnerConfig } from '../types'

interface Dependency {
  library: string
  major: string
  minor: string
  patch: string
}

/**
 * finds and returns library from package.json
 */
export function getLibrary(
  libraryName: string,
  config: RunnerConfig,
): Dependency | null {
  const { cwd } = config

  try {
    const filePath = path.resolve(cwd, 'package.json')
    const packageJsonFile = readFileSync(filePath)

    const packageJson = JSON.parse(packageJsonFile)

    let libraryFound = (packageJson['dependencies']?.[libraryName] ||
      packageJson['devDependencies']?.[libraryName]) as string
    if (libraryFound) {
      let versionArray = libraryFound.replace(/[^0-9.]/, '').split('.')

      return {
        library: libraryName,
        major: versionArray[0],
        minor: versionArray[1],
        patch: versionArray[2],
      }
    } else {
      return undefined
    }
  } catch (e) {
    return undefined
  }
}
