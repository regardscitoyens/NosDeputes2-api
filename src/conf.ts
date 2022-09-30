export const DB_PWD = readFromEnv('DB_PWD')

function readFromEnv(name: string): string {
  const value = process.env[name]
  if (value === undefined) {
    throw new Error(`Missing env variable ${value}`)
  }
  return value
}
