import { Request, Response } from 'express'
import express from 'express'
import { getDb } from './db'

const app = express()
const port = 4545

app.get('/', (req: Request, res: Response) => {
  res.json('Express + TypeScript Server')
})

app.listen(port, () => {
  console.log(`[server]: Server is running at https://localhost:${port}`)
})

start()

async function start() {
  const db = getDb()

  const parlementaires = await db
    .selectFrom('parlementaire')
    .selectAll()
    .execute()

  console.log(parlementaires)
}
